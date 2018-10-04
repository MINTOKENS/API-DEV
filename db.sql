-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2018 at 03:30 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unsinkable`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(191) NOT NULL,
  `public_key` varchar(56) NOT NULL,
  `private_key` text NOT NULL,
  `is_primary` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1' COMMENT 'Active, not active',
  `refund_xlm` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Chcek if the user returned 2 xlm'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `email`, `public_key`, `private_key`, `is_primary`, `created_at`, `status`, `refund_xlm`) VALUES
(1, 1, 'abed@gmail.com', 'GD2HH647KO6AZWFNJZG47SNXDPZLCXNWYCUQFSJT7G3OX6Q2JKR2GZIA', 'U2FsdGVkX1+xh3wGsJx4i6vImuBfEw7E5cFZPFs2+yZVICEHRH8gIT2L80bPFGpwvqaH//1ozkikHA/inbiuLaG2BAbBlfZu8rhgh7XJS6Y=', 1, '2018-07-15 09:42:25', 1, 1),
(2, 4, 'ahmed@gmail.com', 'GALRG6UQ3QMZ7UPNI46UMALEMZGAEAOUS4B726FZFECGPZN7UGSPEOLA', 'U2FsdGVkX19IaDzr02dTZ1G8FCCtp0Nzz5tJ4CtoogQTaxGR3Cz4sXLbOtVDNL6ikkAvAqGVFb2W8vlmGRXiAvaDlva7VbGeKeMFzmrf+Ls=', 0, '2018-07-15 10:06:40', 1, 0),
(3, 5, 'abeewwssd@gamwadil.com', 'GD67CKV6IXFG25FRQOBYJS7I24CAGMBBSI7Z432NNA5IXFAQKEH2HOZG', 'U2FsdGVkX1+Xf4fbMUjYQGA58dDtWXDSnU8req7+AgP58aEAmeTZY+09ZlI7xDYZUUcY27Iz27/zP4Dzpqrdwunkmij5/OL9P3v8QvD6qB4=', 1, '2018-07-19 06:19:16', 1, 1),
(4, 6, 'abeewwssd@gsamwadil.com', 'GAKY7XEYWAMRHLTFZHSMJQCTYQCXXO3GWROBED2YUFTB4NRWG2BKQW36', 'U2FsdGVkX19PSVShwJbexfupavJAFxqPw7ZqGZbsZdiKfzEguGiWMsAfYlDNIR1moh/j2xEvJtjwubseuJj+X3F1LrERq3JSIPGwOdLKN6E=', 1, '2018-07-19 16:01:57', 1, 0),
(5, 7, 'abed@g.com', 'GCIM36WDIQDC2WHSB5JTZKOSVFZ3JJZZBNQBN2RW7O4RSW66C6YWH6G4', 'U2FsdGVkX1/OzpgQRrJtCjD/86kTytD6G/bw8CkS6Wl+zLWRcnfWEsVo2ffc6evLqaz5p7lw4YFURi+Dwf8Wz4889UgHyuKdHtGlijO8+5Y=', 1, '2018-07-25 09:16:54', 1, 1),
(6, 4, 'ahmed@gmail.com', 'GBKVKVYPIPTNNUQRTB5CVIAIZUWOPYDVSJ4D6TRKI5EGFISX3UAA5EPS', 'U2FsdGVkX18z3B+RW08YCTyNfdnJC1dgd2D71Ro6xUhnSgRsYiLyhCOPMM1L2+qjJoo13GX0T9HK1ekBNYk/bDSZMAFQbAywAXV5dKOI8mM=', 0, '2018-07-29 08:45:39', 1, 1),
(7, 4, 'ahmed@gmail.com', 'GCP7FAOV6RMLGDLA55OKHIYCZPRPBZUIAGA2LBFMLSX647BOZZFKBOJG', 'U2FsdGVkX19F//q2cI62HvCCQAelU/SByef7heqOQ3noBN4mHaiR4iQOsxXMnhvnz8dKbB1Zrah51RxWyBBHyOhZrkNFTv+qgjdi+km9D/A=', 1, '2018-07-29 08:47:23', 1, 1),
(8, 8, 'asa@gsamwadil.com', 'GA5JSB4C7PP5WXBEBRNIN6S43BR7MJC26ED6AR3PIJF6A4NH25GWE2YI', 'U2FsdGVkX182hdwxxb57b1B3IwebzlhdIMteG8u6+F3JDZf92qlawsqv6gehWjsmuaK+bEJ8qfe8HCSAxVoav/KV2jH6TU77CmIwOaurAB4=', 1, '2018-08-03 15:47:01', 1, 1),
(9, 9, 'shkir@gmail.com', 'GCM4IRYK4PUUI45KVCREP4S7HEZCFONPJX5YGZQRK6AO35SGTVWYC4ZU', 'U2FsdGVkX1+Zg0niL8scubB20D62087xcIbURrf2L9L739MlCjhJCSh26wEmS5Xoo1mRwwtSMAwTQDdMh6a1+tWCjlRVSC0tsrCrWbU7weY=', 1, '2018-08-19 13:47:58', 1, 1),
(10, 10, 'OF@gmail.com', 'GDJHZWQKXJ6LMYKZSHVWBQUCLVT5VCQQECMRYLBFNUFCZNXB6NDVIHPG', 'U2FsdGVkX1+wzHjhXPSN4fZCocUU8BPXK+r1fiuxea8jsI4rSvwg3LTRocxKXjamJq3F6VDro8kxLl1JLoJXAn0yzDclDAwzKwb5U3PEP6M=', 1, '2018-08-19 15:06:16', 1, 1),
(11, 11, 'BY@gmail.com', 'GCIJXNPJQVFFMCJZWQSGYXJHKQCTV4WF75AFKMUHASSM744MABDIO6RJ', 'U2FsdGVkX19ZibP3L8cWntk+yWs4OxI+zAUaBbXyI6mYFbab2ulZ1LrLHa4kDDIz3DWlhZuGag2upvmfH8EHiAO1qToWVvRE8ivcUpAW70A=', 1, '2018-08-19 15:27:10', 1, 1),
(12, 12, 'asww2@gsamwadil.com', 'GCGUVEIRQ3GSNGIT5DBGK7SGSOHXOFIUK5SCOC6OU4AUJ2XFTP72QYZ4', 'U2FsdGVkX1++myNLSFq795VvNk65KeGMwhS8oKAfhdyIq3mhQ5Ihl3eOKW3qxXnkbGsx7TF/vrPIQR0Hv7QInmHBxO19tM8BktkocooZiwI=', 1, '2018-09-22 09:37:36', 1, 0),
(13, 13, 'aswwq2@gsamwadil.com', 'GDAIJ55C4XVBV5MSPMXXJW4UA72IIFHABH47S5TDVGWXPBRA3VISPLZN', 'U2FsdGVkX19GiZF6OkrEQptJm9J+pMS9M3CdB/moFFP/yYhxEUJ1hWD/eWGRmQfrzdgGPPSkJuqqyiuWx/wypgzX3QV6TTdONmXcl259QCc=', 1, '2018-09-22 09:41:25', 1, 1),
(14, 14, 'aswwqs2@gsamwadil.com', 'GAJR5UHMYNLHZXQKE5CIEIHHB33XQUGZ3LNFQ3MSEONFZ3WNLDKMOCRS', 'U2FsdGVkX19CiYUFrRoLAI4BaRWn5cP/0q4JWs4pj+XL9AuIdvsXsPy03KIJ6G/pKE2a2He/SrlSVVzT0+HiwjQohTWC02fBwuxtG5jmCMs=', 1, '2018-09-23 08:15:33', 1, 0),
(15, 15, 'jas@qqq.com', 'GAO6C63SP3656AW7FBDJV4567TV6PTZMQQQRAJEPBUATS7562EOJOCHV', 'U2FsdGVkX19lMXuinAC++bVo09Jio1IbSiRI3xyuNOpRyZworhzCAPY/4wEgjjTM8xaBRLzGUkdyAitZdU6Y0hEuJhWAkPkpKBA0vse/g9w=', 1, '2018-09-24 16:37:22', 1, 1),
(16, 16, 'jas@4qqq.com', 'GBVE55KX57OZDYZKY66XLG4GSVHPJWCZARH4SEHYZFPKVKA33EJZMMAS', 'U2FsdGVkX1+ekaaoUWN75t0i/leOJHQmy2EaCp3wuuQhayUS2mR4crZ/83jKYw+Ex0QqJMocYpn3yAPVEzP131sD0PetYcz5jLlpO0jhivg=', 1, '2018-09-24 16:50:01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`, `email`) VALUES
(1, 'admin', '$2a$10$pMN8ldemljOp0JEFfRlpc.o..n/kTC7Pdi3bxm5S8QVAKgv4nguHC', 'admin@a.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `is_verified` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `status`, `is_verified`) VALUES
(1, 'Abed Alzain', 'abed@gmail.com', '$2a$10$pMN8ldemljOp0JEFfRlpc.o..n/kTC7Pdi3bxm5S8QVAKgv4nguHC', NULL, '2018-07-15', NULL, 1, NULL),
(4, 'Abed Alzain', 'ahmed@gmail.com', '$2a$10$M03uFezvjeV20Np7QUtrMOcPSXG/LJhDptZG18W0zi2i2qxU2X/R.', NULL, '2018-07-15', NULL, 1, NULL),
(5, 'Abed Alzain', 'abeewwssd@gamwadil.com', '$2a$10$wVhaRbH8KWVJBl8rb6vOdeakHjCKioekWvWyhKQp4lsShckrR22Fy', NULL, '2018-07-19', NULL, 1, NULL),
(6, 'Abed Alzain', 'abeewwssd@gsamwadil.com', '$2a$10$ReWxGZR7UBC4vvBX0LAS4ujFtwuW9SLhpyfNrpPy1zVQ2zuAD4vUG', NULL, '2018-07-19', NULL, 1, NULL),
(7, 'Abed Alzain', 'abed@g.com', '$2a$10$QM7v.HLZJK6VY97qLBOMmuO8TNlTLpAm1KsE5asaBPmGfYWf6.Qq6', NULL, '2018-07-25', NULL, 1, NULL),
(8, 'Abed Alzain', 'asa@gsamwadil.com', '$2a$10$D0nVvpmLTr.Ew7ZjO8DiEeIx0ou1sI1zl/ldM1ImV0RxI1ZtzDoNK', NULL, '2018-08-03', NULL, 1, NULL),
(9, 'Abed Alzain', 'shkir@gmail.com', '$2a$10$11J6278ywhTveHjrJU7w0Odt0s./nUhVKScTSEFi.EgOk/jbDK1Pq', NULL, '2018-08-19', NULL, 1, NULL),
(10, 'Abed Alzain', 'OF@gmail.com', '$2a$10$UFQ1c52nBv4I18QH3JwXjubWpvofjfybeNIPz9oJa.DN8Ieac8RW6', NULL, '2018-08-19', NULL, 1, NULL),
(11, 'Abed Alzain', 'BY@gmail.com', '$2a$10$.JpY/7D6sIVkcgH/ZnVKHez8msW5WDEQ0y8NpREXWxHB10IAhYNJm', NULL, '2018-08-19', NULL, 1, NULL),
(12, 'Abed Alzain', 'asww2@gsamwadil.com', '$2a$10$E0GU6I7J1jjDltupnuLM1u5y03nJGCaZ1GC4GECsd.2dHEb3DU4Ru', NULL, '2018-09-22', NULL, 1, NULL),
(13, 'Abed Alzain', 'aswwq2@gsamwadil.com', '$2a$10$Of/kMtPmBahN.yD45/MNVOkDwGAwH0NIBWEabqf1XuTUd9l.ACtXO', NULL, '2018-09-22', NULL, 1, NULL),
(14, '123456', 'aswwqs2@gsamwadil.com', '$2a$10$wVrN7jpGzLSytSKeD0NOiOejhT3KrQ5ci/896zVzVirwazom5p0ey', NULL, '2018-09-23', NULL, 1, NULL),
(15, 'Abed Alzain', 'jas@qqq.com', '$2a$10$gmC7DM9reurWtOtGbGf5kefPm31gED.KtDaYE01Ev.sfdv.rW63tW', NULL, '2018-09-24', NULL, 1, NULL),
(16, 'Abed Alzain', 'jas@4qqq.com', '$2a$10$SesqH8gnIo4jKgBWxyMYtefvwYFw.i1nd8LkH9iM1EecqB8aHeEWm', NULL, '2018-09-24', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
