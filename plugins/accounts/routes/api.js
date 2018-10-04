const Account = require('../util/accountFunctions');
 

module.exports = [
  
    {
        method: 'GET',
        path: '/api/v1/account/getbalance',
        config: {
            handler: (req, reply) => {
                Account.getBalance(req, res => {
                    reply(res);
                });
            },
            // Add authentication to this route
            auth: {
                strategy: 'jwt',
            }
        }
    },
    {
        method: 'GET',
        path: '/api/v1/account/get',
        config: {
            handler: (req, reply) => {
                Account.getActiveAccount(req, res => {
                    reply(res);
                });
            },
            // Add authentication to this route
            auth: {
                strategy: 'jwt',
            }
        }
    },
    {
        method: 'POST',
        path: '/api/v1/account/send',
        config: {
            handler: (req, reply) => {
                Account.sendAsset(req, res => {
                    reply(res);
                });
            },
            // Add authentication to this route
            auth: {
                strategy: 'jwt',
            }
        }
    },
    {
        method: 'GET',
        path: '/api/v1/account/transactions',
        config: {
            handler: (req, reply) => {
                Account.getTransactions(req, res => {
                    reply(res);
                });
            },
            // Add authentication to this route
            auth: {
                strategy: 'jwt',
            }
        }
    }
];