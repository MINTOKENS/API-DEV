'use strict';

const Boom = require('boom');
const bcrypt = require('bcryptjs');
const axios = require('axios');
const fs = require('fs');
const timeago = require("timeago.js");
const BigNumber = require('bignumber.js');

const stellar = require('../../util/stellar-util');
const crypto = require('../../util/crypto');
const common = require('../../util/common');
const logger = require('../../util/logger');
const token = require('../../util/token');
const secret = require('../../../config/config');

const User = require('../../users/models/User');
const modelHelper = require('../../users/util/modelHelper');
const Account = require('../../accounts/models/Account');
const helper = require('../../util/helper');

function sendAsset(request, callback) {
    let authUser = token.getAuthenticatedUser(request.headers.authorization);
    let data = request.payload;

    if (data.destination == null) {
        callback(Boom.badRequest(request.i18n.__("Enter the destination key")));
        return;
    }
    if (data.amount == null) {
        callback(Boom.badRequest(request.i18n.__("Enter the amount")));
        return;
    }
    if (data.asset == null) {
        callback(Boom.badRequest(request.i18n.__("Enter the asset")));
        return;
    }
    // if (data.password == null) {
    //     callback(Boom.badRequest(request.i18n.__("Enter the password")));
    //     return;
    // }

    Account.one({
        user_id: authUser.id,
        is_primary: 1
    }, function (err, account) {
        //user can not send to his account
        /*if (account.public_key == data.destination || account.getAddress() == data.destination) {
            callback(Boom.badRequest(request.i18n.__("User can not send to his account")));
            return;
        }*/
        
        var secretKey = crypto.decryptData(account.private_key, secret.encryptKey);
        
        if (stellar.verifyAccount(secretKey)) {
            if (stellar.isFederation(data.destination)) {
                stellar.getFederationAddress(data.destination).then(fed => {
                    stellar.sendAsset(secretKey, fed.account_id, String(data.amount), data.asset, data.memo).then((result) => {
                        var info = {
                            type: "Success",
                            name: "Success",
                            message: request.i18n.__("Asset has been sent")
                        }
                        callback(info);
                    }).catch(err => {
                        callback(Boom.badData(request.i18n.__("Something wrong ;( Transaction failed")));
                    });
                }).catch(err => {
                    callback(Boom.badData(request.i18n.__("Stellar Address is not valid")));
                });
            } else { 
                logger.info('Sending Asset');
                stellar.sendAsset(secretKey, data.destination, String(data.amount), data.asset, data.memo).then((result) => {
                    var info = {
                        type: "Success",
                        name: "Success",
                        message: request.i18n.__("Asset has been sent")
                    }
                    callback(info);
                }).catch(err => {
                   // console.log(err);
                    callback(Boom.badData(request.i18n.__("Something wrong ;( Transaction failed")));
                });
            }

        } else {
            callback(Boom.badData(request.i18n.__("Bad keys or password")));
        }
    });
}

function getActiveAccount(request, callback) {
    let authUser = token.getAuthenticatedUser(request.headers.authorization);
 
    Account.one({
        user_id: authUser.id,
        is_primary: 1
    }, (error, account) => {
        if (error) {
            callback(Boom.badRequest(error));
        } else {
            var info = {
                account: account.public_key
            }
            callback(info);
        }
    });
}

function getTransactions(request, callback) {
    let authUser = token.getAuthenticatedUser(request.headers.authorization);

    var dir = request.params.dir;

    Account.one({
        user_id: authUser.id,
        is_primary: 1
    }, (err, account) => {
        if (err) {
            callback(request.i18n.__('This account does not exist'));
            return;
        }

        var public_key = account.public_key;

        stellar.transactions(public_key).then((results) => {
            var payments = [];
            var count = 0;
            var cursor;
            results.records.forEach(function (rec) {
                var action, account, amount, asset;
                count++;

                if (rec.type == "payment") {
                    action = rec.from == public_key ? "Sent" : "Received";
                    account = rec.from == public_key ? rec.to : rec.from;
                    amount = rec.amount;
                    asset = rec.asset_code != null ? rec.asset_code : "XLM";
                } else if (rec.type == "create_account") {
                    action = "Funded";
                    account = rec.account == public_key ? rec.funder : rec.account;
                    amount = rec.starting_balance;
                    asset = "XLM";
                }

                if (dir == "in" && (action != "Received" && action != "Funded")) {
                    return;
                } else if (dir == "out" && action != "Sent") {
                    return;
                }

                var formated_date = timeago().format(rec.created_at);

                payments.push({
                    action: action,
                    account: account,
                    amount: amount,
                    asset: asset,
                    transaction_hash: rec.transaction_hash,
                    date: formated_date,
                    created_at: new Date(rec.created_at).toISOString().replace(/T/, ' ').replace(/\..+/, '')
                });
            });
            //callback({transactions: payments, cursor: cursor});
            callback(payments);
        }).catch((err) => {
            console.log(err);
            callback(Boom.badData(request.i18n.__('Something wrong ;(')));
        });
    });
}


const getBalance = async (request, callback) => {
    logger.info('Start Get Balance');
    let authUser = token.getAuthenticatedUser(request.headers.authorization);

    var account = await modelHelper.getAccount(authUser.id);
    var public_key = account.public_key;

    common.getBalance(public_key).then(balance => {
        callback(balance);  
    }).catch(err => {
        callback(err);
    });
}


module.exports = {
    getBalance,
    getActiveAccount,
    sendAsset,
    getTransactions
}