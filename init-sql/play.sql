-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-10-21 09:03:31
-- 服务器版本： 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `play`
--

-- --------------------------------------------------------

--
-- 表的结构 `food`
--

CREATE TABLE IF NOT EXISTS `food` (
  `food_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `food`
--

INSERT INTO `food` (`food_id`, `name`, `price`) VALUES
(2, '鱼香肉丝', 11),
(3, '水煮鱼', 18),
(4, '小炒肉', 30),
(5, '蛋炒饭', 6),
(6, '兰州拉面', 12);

-- --------------------------------------------------------

--
-- 表的结构 `order_food`
--

CREATE TABLE IF NOT EXISTS `order_food` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `order_food`
--

INSERT INTO `order_food` (`id`, `order_id`, `food_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 2),
(4, 2, 3),
(5, 2, 4),
(6, 2, 5),
(7, 2, 6),
(8, 3, 3),
(9, 3, 4),
(10, 4, 2),
(11, 4, 3),
(16, 7, 2),
(17, 7, 3),
(18, 8, 3),
(19, 8, 4),
(20, 8, 5),
(21, 9, 3),
(22, 9, 4),
(23, 9, 5),
(24, 10, 3),
(25, 10, 4),
(26, 10, 5),
(27, 11, 3),
(28, 11, 4),
(29, 12, 3),
(30, 12, 4),
(31, 13, 2),
(32, 13, 3),
(33, 14, 4),
(34, 14, 5),
(35, 15, 2),
(36, 15, 3),
(37, 15, 4),
(38, 16, 2),
(39, 16, 3),
(40, 16, 4),
(41, 16, 5),
(42, 16, 6),
(43, 17, 2),
(44, 17, 3),
(45, 17, 4),
(46, 17, 5),
(47, 17, 6),
(48, 18, 2),
(49, 18, 3),
(50, 18, 4),
(51, 18, 5),
(52, 18, 6);

-- --------------------------------------------------------

--
-- 表的结构 `order_recode`
--

CREATE TABLE IF NOT EXISTS `order_recode` (
  `order_id` int(11) NOT NULL,
  `table_code` varchar(55) NOT NULL,
  `user_code` varchar(100) NOT NULL,
  `total_price` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `price_date` datetime DEFAULT NULL,
  `real_price` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `order_recode`
--

INSERT INTO `order_recode` (`order_id`, `table_code`, `user_code`, `total_price`, `create_date`, `price_date`, `real_price`, `status`) VALUES
(1, 'A18', 'd45cc28d-c004-446a-a9f7-d7e276f50620', 29, '2016-10-20 22:58:50', NULL, NULL, 0),
(2, 'B15', 'fe6710f3-e3ad-4246-8204-5a73138b5cc4', 77, '2016-10-21 12:01:33', NULL, NULL, 0),
(3, '18q', '6f9e6c56-400a-496a-b477-714a05996986', 48, '2016-10-21 12:46:33', NULL, NULL, 0),
(4, '12', '318d0336-e674-4ef1-b6f9-daa479594c17', 29, '2016-10-21 12:53:25', NULL, NULL, 0),
(7, '18wa', '810489fc-dbaf-4d2c-b291-f291a5a313e8', 29, '2016-10-21 12:55:43', NULL, NULL, 0),
(8, 'dd', '93880265-a680-42dd-82ae-9b7918c5885c', 54, '2016-10-21 14:41:04', NULL, NULL, 0),
(9, 'dd', '004b79de-c651-435a-9d6f-e215b582f6c5', 54, '2016-10-21 14:42:10', NULL, NULL, 0),
(10, 'dd', '26a19212-e17a-46b3-8671-1c763819e8af', 54, '2016-10-21 14:42:40', NULL, NULL, 0),
(11, 'sdsd', 'e6bb8fba-8f7e-4de7-aadd-502d5e3bc9b6', 48, '2016-10-21 14:43:49', NULL, NULL, 0),
(12, 'dds', '4725ce7d-8e5a-4563-ba9b-ee6e426dcb39', 48, '2016-10-21 14:44:39', NULL, NULL, 0),
(13, 'dfdf', '8b3d98f1-8099-471d-8110-28c9335ec89c', 29, '2016-10-21 14:45:33', NULL, NULL, 0),
(14, 'aa', '7e8491ed-a6f9-488a-ad05-ce9503b3c63a', 36, '2016-10-21 14:46:10', NULL, NULL, 0),
(15, 'sadasd', '5ab5804c-de4b-43ec-9464-f8199e90a598', 59, '2016-10-21 14:47:29', NULL, NULL, 0),
(16, 'llklkk', '85868652-be75-4b57-a743-5c706dbd7dde', 77, '2016-10-21 14:53:27', NULL, NULL, 0),
(17, 'llklkk', '1a889246-c196-4943-8b8f-14f2db8f1a6d', 77, '2016-10-21 14:53:55', NULL, NULL, 0),
(18, 'llklkk', '0690d66f-e716-48ff-94cb-541b95cddb87', 77, '2016-10-21 14:55:33', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `play_evolutions`
--

CREATE TABLE IF NOT EXISTS `play_evolutions` (
  `id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `apply_script` text,
  `revert_script` text,
  `state` varchar(255) DEFAULT NULL,
  `last_problem` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `play_evolutions`
--

INSERT INTO `play_evolutions` (`id`, `hash`, `applied_at`, `apply_script`, `revert_script`, `state`, `last_problem`) VALUES
(1, 'f0b1f68ce000bfb46416e715b77f5b481889db0a', '2016-10-20 12:35:51', 'create table food (\nfood_id                   integer auto_increment not null,\nname                      varchar(255),\nprice                     integer,\nconstraint pk_food primary key (food_id))\n;', 'SET FOREIGN_KEY_CHECKS=0;\n\ndrop table food;\n\nSET FOREIGN_KEY_CHECKS=1;', 'applied', 'Table ''food'' already exists [ERROR:1050, SQLSTATE:42S01]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `order_food`
--
ALTER TABLE `order_food`
  ADD PRIMARY KEY (`id`), ADD KEY `order_id` (`order_id`), ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `order_recode`
--
ALTER TABLE `order_recode`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `play_evolutions`
--
ALTER TABLE `play_evolutions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `order_food`
--
ALTER TABLE `order_food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `order_recode`
--
ALTER TABLE `order_recode`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
