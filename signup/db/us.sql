-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 21, 2018 at 09:02 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.25-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `us`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL,
  `viewed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audit`
--

INSERT INTO `audit` (`id`, `user`, `page`, `timestamp`, `ip`, `viewed`) VALUES
(1, 1, '42', '2017-02-20 17:31:13', '::1', 0),
(2, 0, '44', '2017-08-14 17:32:22', '::1', 0),
(3, 0, '4', '2017-09-16 17:53:58', '::1', 0),
(4, 0, '4', '2017-10-09 15:41:11', '192.168.0.222', 0),
(5, 0, '3', '2018-02-18 07:27:03', '192.168.1.114', 0),
(6, 0, '3', '2018-02-18 10:54:29', '192.168.1.114', 0),
(7, 0, '3', '2018-02-18 10:54:31', '192.168.1.114', 0),
(8, 0, '3', '2018-02-18 12:27:13', '192.168.1.104', 0),
(9, 0, '3', '2018-02-19 09:06:58', '192.168.1.104', 0),
(10, 0, '3', '2018-02-19 19:30:56', '192.168.1.104', 0),
(11, 0, '3', '2018-02-19 19:31:50', '192.168.1.104', 0),
(12, 0, '3', '2018-02-19 19:31:51', '192.168.1.104', 0),
(13, 0, '24', '2018-02-20 08:44:38', '192.168.1.104', 0),
(14, 0, '3', '2018-02-20 11:13:21', '192.168.1.104', 0),
(15, 0, '3', '2018-02-20 11:13:23', '192.168.1.104', 0),
(16, 0, '3', '2018-02-20 11:22:38', '192.168.1.104', 0),
(17, 0, '3', '2018-02-20 11:23:35', '192.168.1.104', 0),
(18, 0, '3', '2018-02-20 11:24:46', '192.168.1.104', 0),
(19, 0, '3', '2018-02-20 16:51:10', '192.168.1.104', 0),
(20, 0, '53', '2018-02-20 18:20:10', '192.168.1.104', 0),
(21, 0, '3', '2018-02-20 18:24:29', '192.168.1.104', 0),
(22, 0, '3', '2018-02-20 18:27:11', '192.168.1.104', 0),
(23, 0, '3', '2018-02-20 18:29:32', '192.168.1.104', 0),
(24, 0, '3', '2018-02-20 18:41:15', '192.168.1.104', 0),
(25, 0, '3', '2018-02-20 20:35:48', '192.168.1.104', 0),
(26, 0, '3', '2018-02-20 20:39:08', '192.168.1.104', 0),
(27, 0, '3', '2018-02-20 20:39:32', '192.168.1.104', 0),
(28, 0, '3', '2018-02-21 10:44:45', '192.168.1.104', 0),
(29, 0, '3', '2018-02-21 11:21:57', '192.168.1.114', 0),
(30, 0, '3', '2018-02-21 12:12:22', '192.168.1.114', 0),
(31, 0, '3', '2018-02-21 12:28:38', '192.168.1.104', 0);

-- --------------------------------------------------------

--
-- Table structure for table `crons`
--

CREATE TABLE `crons` (
  `id` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `sort` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crons`
--

INSERT INTO `crons` (`id`, `active`, `sort`, `name`, `file`, `createdby`, `created`, `modified`) VALUES
(1, 0, 100, 'Auto-Backup', 'backup.php', 1, '2017-09-16 07:49:22', '2017-11-11 20:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `crons_logs`
--

CREATE TABLE `crons_logs` (
  `id` int(11) NOT NULL,
  `cron_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `website_name` varchar(100) NOT NULL,
  `smtp_server` varchar(100) NOT NULL,
  `smtp_port` int(10) NOT NULL,
  `email_login` varchar(150) NOT NULL,
  `email_pass` varchar(100) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `from_email` varchar(150) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `verify_url` varchar(255) NOT NULL,
  `email_act` int(1) NOT NULL,
  `debug_level` int(1) NOT NULL DEFAULT '0',
  `isSMTP` int(1) NOT NULL DEFAULT '0',
  `isHTML` varchar(5) NOT NULL DEFAULT 'true',
  `useSMTPauth` varchar(6) NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`id`, `website_name`, `smtp_server`, `smtp_port`, `email_login`, `email_pass`, `from_name`, `from_email`, `transport`, `verify_url`, `email_act`, `debug_level`, `isSMTP`, `isHTML`, `useSMTPauth`) VALUES
(1, 'User Spice', 'smtp.gmail.com', 587, 'yourEmail@gmail.com', '1234', 'User Spice', 'yourEmail@gmail.com', 'tls', 'http://localhost/43', 0, 0, 0, 'true', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `groups_menus`
--

CREATE TABLE `groups_menus` (
  `id` int(11) NOT NULL,
  `group_id` int(15) NOT NULL,
  `menu_id` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups_menus`
--

INSERT INTO `groups_menus` (`id`, `group_id`, `menu_id`) VALUES
(30, 2, 9),
(29, 0, 8),
(28, 0, 7),
(27, 0, 21),
(5, 0, 3),
(6, 0, 1),
(7, 0, 2),
(8, 0, 51),
(9, 0, 52),
(10, 0, 37),
(11, 0, 38),
(12, 2, 39),
(13, 2, 40),
(14, 2, 41),
(15, 2, 42),
(16, 2, 43),
(17, 2, 44),
(18, 2, 45),
(19, 0, 46),
(20, 0, 47),
(21, 0, 49),
(26, 0, 20),
(25, 0, 18),
(31, 2, 10),
(32, 2, 11),
(33, 2, 12),
(34, 2, 13),
(35, 2, 14),
(36, 2, 15),
(37, 0, 16);

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `stripe_ts` varchar(255) NOT NULL,
  `stripe_tp` varchar(255) NOT NULL,
  `stripe_ls` varchar(255) NOT NULL,
  `stripe_lp` varchar(255) NOT NULL,
  `recap_pub` varchar(100) NOT NULL,
  `recap_pri` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(3) NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logtype` varchar(25) NOT NULL,
  `lognote` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `logdate`, `logtype`, `lognote`) VALUES
(79, 1, '2018-02-16 12:48:27', 'User', 'User logged in.'),
(80, 1, '2018-02-16 12:48:28', 'User', 'User logged in.'),
(81, 1, '2018-02-16 12:49:10', 'User', 'User logged in.'),
(82, 1, '2018-02-16 12:49:10', 'User', 'User logged in.'),
(83, 1, '2018-02-16 12:49:19', 'System Updates', 'Reformatted existing vericodes'),
(84, 1, '2018-02-16 12:49:19', 'System Updates', 'Update 3GJYaKcqUtw7 successfully deployed.'),
(85, 1, '2018-02-16 12:49:19', 'System Updates', 'Updated old Blacklisted logs to IP Logging type.'),
(86, 1, '2018-02-16 12:49:19', 'System Updates', 'Added cloaking to users.'),
(87, 1, '2018-02-16 12:49:21', 'System Updates', 'Update 2XQjsKYJAfn1 successfully deployed.'),
(88, 1, '2018-02-16 12:49:21', 'System Updates', 'Updated force_notif to 0 if you had not set it already.'),
(89, 1, '2018-02-16 12:49:21', 'System Updates', 'Update 549DLFeHMNw7 successfully deployed.'),
(90, 1, '2018-02-16 12:49:21', 'System Updates', 'Added registration to settings.'),
(91, 1, '2018-02-16 12:49:21', 'System Updates', 'Update 4Dgt2XVjgz2x successfully deployed.'),
(92, 3, '2018-02-18 01:56:04', 'User', 'User logged in.'),
(93, 4, '2018-02-18 02:32:19', 'User', 'User logged in.'),
(94, 5, '2018-02-18 02:46:56', 'User', 'User logged in.'),
(95, 1, '2018-02-18 05:23:16', 'User', 'User logged in.'),
(96, 1, '2018-02-18 05:23:16', 'User', 'User logged in.'),
(97, 1, '2018-02-18 06:56:43', 'User', 'User logged in.'),
(98, 1, '2018-02-18 06:56:43', 'User', 'User logged in.'),
(99, 1, '2018-02-18 07:32:25', 'User', 'User logged in.'),
(100, 1, '2018-02-18 07:32:25', 'User', 'User logged in.'),
(101, 1, '2018-02-18 07:47:01', 'User', 'User logged in.'),
(102, 1, '2018-02-18 07:47:01', 'User', 'User logged in.'),
(103, 6, '2018-02-19 03:36:41', 'User', 'User logged in.'),
(104, 7, '2018-02-19 04:32:00', 'User', 'User logged in.'),
(105, 8, '2018-02-19 04:33:11', 'User', 'User logged in.'),
(106, 9, '2018-02-19 07:26:46', 'User', 'User logged in.'),
(107, 10, '2018-02-19 07:28:33', 'User', 'User logged in.'),
(108, 11, '2018-02-19 07:29:58', 'User', 'User logged in.'),
(109, 12, '2018-02-19 07:30:50', 'User', 'User logged in.'),
(110, 13, '2018-02-19 07:44:04', 'User', 'User logged in.'),
(111, 14, '2018-02-19 07:46:56', 'User', 'User logged in.'),
(112, 15, '2018-02-19 13:29:17', 'User', 'User logged in.'),
(113, 16, '2018-02-19 13:50:50', 'User', 'User logged in.'),
(114, 17, '2018-02-19 14:00:37', 'User', 'User logged in.'),
(115, 1, '2018-02-19 14:07:21', 'User', 'User logged in.'),
(116, 1, '2018-02-19 14:07:21', 'User', 'User logged in.'),
(117, 1, '2018-02-19 14:12:17', 'User', 'User logged in.'),
(118, 1, '2018-02-19 14:12:17', 'User', 'User logged in.'),
(119, 18, '2018-02-19 14:14:06', 'User', 'User logged in.'),
(120, 19, '2018-02-19 14:18:49', 'User', 'User logged in.'),
(121, 20, '2018-02-20 03:11:05', 'User', 'User logged in.'),
(122, 21, '2018-02-20 03:12:48', 'User', 'User logged in.'),
(123, 21, '2018-02-20 03:14:01', 'User', 'Changed fname from Nananannanan to Moomomooooo.'),
(124, 22, '2018-02-20 05:41:21', 'User', 'User logged in.'),
(125, 23, '2018-02-20 05:43:49', 'User', 'User logged in.'),
(126, 24, '2018-02-20 05:44:40', 'User', 'User logged in.'),
(127, 24, '2018-02-20 05:44:53', 'User', 'User logged in.'),
(128, 24, '2018-02-20 05:44:53', 'User', 'User logged in.'),
(129, 25, '2018-02-20 05:52:13', 'User', 'User logged in.'),
(130, 26, '2018-02-20 05:54:33', 'User', 'User logged in.'),
(131, 27, '2018-02-20 10:40:47', 'User', 'User logged in.'),
(132, 1, '2018-02-20 10:56:27', 'User', 'User logged in.'),
(133, 1, '2018-02-20 10:56:27', 'User', 'User logged in.'),
(134, 1, '2018-02-20 11:15:03', 'User', 'User logged in.'),
(135, 1, '2018-02-20 11:15:03', 'User', 'User logged in.'),
(136, 1, '2018-02-20 11:45:01', 'User', 'User logged in.'),
(137, 1, '2018-02-20 11:45:02', 'User', 'User logged in.'),
(138, 1, '2018-02-20 11:46:49', 'User', 'User logged in.'),
(139, 1, '2018-02-20 11:46:49', 'User', 'User logged in.'),
(140, 1, '2018-02-20 12:51:46', 'User', 'User logged in.'),
(141, 1, '2018-02-20 12:51:46', 'User', 'User logged in.'),
(142, 1, '2018-02-20 12:54:38', 'User', 'User logged in.'),
(143, 1, '2018-02-20 12:54:38', 'User', 'User logged in.'),
(144, 1, '2018-02-20 12:57:18', 'User', 'User logged in.'),
(145, 1, '2018-02-20 12:57:18', 'User', 'User logged in.'),
(146, 1, '2018-02-20 12:59:43', 'User', 'User logged in.'),
(147, 1, '2018-02-20 12:59:43', 'User', 'User logged in.'),
(148, 1, '2018-02-20 13:11:53', 'User', 'User logged in.'),
(149, 1, '2018-02-20 13:11:53', 'User', 'User logged in.'),
(150, 1, '2018-02-20 14:53:11', 'User', 'User logged in.'),
(151, 1, '2018-02-20 14:53:11', 'User', 'User logged in.'),
(152, 1, '2018-02-20 15:05:58', 'User', 'User logged in.'),
(153, 1, '2018-02-20 15:05:58', 'User', 'User logged in.'),
(154, 1, '2018-02-20 15:09:16', 'User', 'User logged in.'),
(155, 1, '2018-02-20 15:09:16', 'User', 'User logged in.'),
(156, 1, '2018-02-20 15:09:39', 'User', 'User logged in.'),
(157, 1, '2018-02-20 15:09:39', 'User', 'User logged in.'),
(158, 1, '2018-02-21 05:11:23', 'User', 'User logged in.'),
(159, 1, '2018-02-21 05:11:24', 'User', 'User logged in.'),
(160, 1, '2018-02-21 05:14:53', 'User', 'User logged in.'),
(161, 1, '2018-02-21 05:14:53', 'User', 'User logged in.'),
(162, 1, '2018-02-21 05:25:39', 'User', 'User logged in.'),
(163, 1, '2018-02-21 05:25:39', 'User', 'User logged in.'),
(164, 28, '2018-02-21 06:40:35', 'User', 'User logged in.'),
(165, 29, '2018-02-21 06:41:57', 'User', 'User logged in.'),
(166, 30, '2018-02-21 06:44:24', 'User', 'User logged in.'),
(167, 29, '2018-02-21 06:51:47', 'User', 'User logged in.'),
(168, 29, '2018-02-21 06:51:47', 'User', 'User logged in.'),
(169, 31, '2018-02-21 07:22:33', 'User', 'User logged in.'),
(170, 1, '2018-02-21 07:42:05', 'User', 'User logged in.'),
(171, 1, '2018-02-21 07:42:05', 'User', 'User logged in.'),
(172, 32, '2018-02-21 07:52:28', 'User', 'User logged in.'),
(173, 32, '2018-02-21 07:52:38', 'User', 'User logged in.'),
(174, 32, '2018-02-21 07:52:39', 'User', 'User logged in.'),
(175, 29, '2018-02-21 09:44:54', 'User', 'User logged in.'),
(176, 29, '2018-02-21 09:44:54', 'User', 'User logged in.');

-- --------------------------------------------------------

--
-- Table structure for table `logs_exempt`
--

CREATE TABLE `logs_exempt` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdby` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `parent` int(10) NOT NULL,
  `dropdown` int(1) NOT NULL,
  `logged_in` int(1) NOT NULL,
  `display_order` int(10) NOT NULL,
  `label` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icon_class` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `parent`, `dropdown`, `logged_in`, `display_order`, `label`, `link`, `icon_class`) VALUES
(1, 'main', 2, 0, 1, 1, 'Home', '', 'fa fa-fw fa-home'),
(2, 'main', -1, 1, 1, 14, '', '', 'fa fa-fw fa-cogs'),
(3, 'main', -1, 0, 1, 11, '{{username}}', 'users/account.php', 'fa fa-fw fa-user'),
(4, 'main', -1, 1, 0, 3, 'Help', '', 'fa fa-fw fa-life-ring'),
(5, 'main', -1, 0, 0, 2, 'Register', 'users/join.php', 'fa fa-fw fa-plus-square'),
(6, 'main', -1, 0, 0, 1, 'Log In', 'users/login.php', 'fa fa-fw fa-sign-in'),
(7, 'main', 2, 0, 1, 2, 'Account', 'users/account.php', 'fa fa-fw fa-user'),
(8, 'main', 2, 0, 1, 3, '{{hr}}', '', ''),
(9, 'main', 2, 0, 1, 4, 'Admin Dashboard', 'users/admin.php', 'fa fa-fw fa-cogs'),
(10, 'main', 2, 0, 1, 5, 'User Management', 'users/admin_users.php', 'fa fa-fw fa-user'),
(11, 'main', 2, 0, 1, 6, 'Permissions Manager', 'users/admin_permissions.php', 'fa fa-fw fa-lock'),
(12, 'main', 2, 0, 1, 7, 'Page Management', 'users/admin_pages.php', 'fa fa-fw fa-wrench'),
(13, 'main', 2, 0, 1, 8, 'Messages Manager', 'users/admin_messages.php', 'fa fa-fw fa-envelope'),
(14, 'main', 2, 0, 1, 9, 'System Logs', 'users/admin_logs.php', 'fa fa-fw fa-search'),
(15, 'main', 2, 0, 1, 10, '{{hr}}', '', ''),
(16, 'main', 2, 0, 1, 11, 'Logout', 'users/logout.php', 'fa fa-fw fa-sign-out'),
(17, 'main', -1, 0, 0, 0, 'Home', '', 'fa fa-fw fa-home'),
(18, 'main', -1, 0, 1, 10, 'Home', '', 'fa fa-fw fa-home'),
(19, 'main', 4, 0, 0, 1, 'Forgot Password', 'users/forgot_password.php', 'fa fa-fw fa-wrench'),
(20, 'main', -1, 0, 1, 12, '{{notifications}}', '', ''),
(21, 'main', -1, 0, 1, 13, '{{messages}}', '', ''),
(22, 'main', 4, 0, 0, 99999, 'Resend Activation Email', 'users/verify_resend.php', 'fa fa-exclamation-triangle');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_body` text NOT NULL,
  `msg_read` int(1) NOT NULL,
  `msg_thread` int(11) NOT NULL,
  `deleted` int(1) NOT NULL,
  `sent_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `msg_from`, `msg_to`, `msg_body`, `msg_read`, `msg_thread`, `deleted`, `sent_on`) VALUES
(1, 1, 2, '&lt;p&gt;fgds&lt;/p&gt;', 0, 1, 0, '2017-08-06 00:13:47'),
(2, 1, 2, '&lt;p&gt;Did it work?&lt;/p&gt;', 0, 2, 0, '2017-09-09 15:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `message_threads`
--

CREATE TABLE `message_threads` (
  `id` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_from` int(11) NOT NULL,
  `msg_subject` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL,
  `last_update_by` int(11) NOT NULL,
  `archive_from` int(1) NOT NULL DEFAULT '0',
  `archive_to` int(1) NOT NULL DEFAULT '0',
  `hidden_from` int(1) NOT NULL DEFAULT '0',
  `hidden_to` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message_threads`
--

INSERT INTO `message_threads` (`id`, `msg_to`, `msg_from`, `msg_subject`, `last_update`, `last_update_by`, `archive_from`, `archive_to`, `hidden_from`, `hidden_to`) VALUES
(1, 2, 1, 'Testiing123', '2017-08-06 00:13:47', 1, 0, 0, 0, 0),
(2, 2, 1, 'Testing Message Badge', '2017-09-09 15:10:09', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mqtt`
--

CREATE TABLE `mqtt` (
  `id` int(11) NOT NULL,
  `server` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mqtt`
--

INSERT INTO `mqtt` (`id`, `server`, `port`, `username`, `password`, `nickname`) VALUES
(2, '192.168.0.222', 1883, '', '', 'Raspberry PI MQTT2');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` mediumtext NOT NULL,
  `is_read` tinyint(4) NOT NULL,
  `is_archived` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `page` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `private` int(11) NOT NULL DEFAULT '0',
  `re_auth` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page`, `title`, `private`, `re_auth`) VALUES
(1, 'index.php', 'Home', 0, 0),
(2, 'z_us_root.php', '', 0, 0),
(3, 'users/account.php', 'Account Dashboard', 1, 0),
(4, 'users/admin.php', 'Admin Dashboard', 1, 0),
(5, 'users/admin_page.php', 'Manage Page', 1, 0),
(6, 'users/admin_pages.php', 'Manage Pages', 1, 0),
(7, 'users/admin_permission.php', 'Manage Permission', 1, 0),
(8, 'users/admin_permissions.php', 'Manage Permissions', 1, 0),
(9, 'users/admin_user.php', 'Manage User', 1, 0),
(10, 'users/admin_users.php', 'Manage Users', 1, 1),
(11, 'users/edit_profile.php', 'Edit Profile', 1, 0),
(12, 'users/email_settings.php', 'Email Settings', 1, 0),
(13, 'users/email_test.php', 'Email Test', 1, 0),
(14, 'users/forgot_password.php', 'Forgotten Password', 0, 0),
(15, 'users/forgot_password_reset.php', 'Reset Forgotten Password', 0, 0),
(16, 'users/index.php', 'Home', 0, 0),
(17, 'users/init.php', '', 0, 0),
(18, 'users/join.php', 'Join', 0, 0),
(19, 'users/joinThankYou.php', 'Join', 0, 0),
(20, 'users/login.php', 'Login', 0, 0),
(21, 'users/logout.php', 'Logout', 0, 0),
(22, 'users/profile.php', 'Profile', 1, 0),
(23, 'users/times.php', '', 0, 0),
(24, 'users/user_settings.php', 'My Settings', 1, 0),
(25, 'users/verify.php', 'Account Verification', 0, 0),
(26, 'users/verify_resend.php', 'Account Verification', 0, 0),
(27, 'users/view_all_users.php', 'View All Users', 1, 0),
(28, 'usersc/empty.php', '', 0, 0),
(31, 'users/oauth_success.php', '', 0, 0),
(33, 'users/fb-callback.php', '', 0, 0),
(37, 'users/check_updates.php', 'Check For Updates', 1, 0),
(38, 'users/google_helpers.php', '', 0, 0),
(39, 'users/tomfoolery.php', 'Security Log', 1, 0),
(41, 'users/messages.php', 'My Messages', 1, 0),
(42, 'users/message.php', 'My Messages', 1, 0),
(44, 'users/admin_backup.php', 'Backup Files', 1, 0),
(45, 'users/maintenance.php', 'Maintenance', 0, 0),
(47, 'users/mqtt_settings.php', 'MQTT Settings', 1, 0),
(49, 'users/admin_verify.php', 'Verify Password', 1, 0),
(50, 'users/cron_manager.php', 'Cron Manager', 1, 0),
(51, 'users/cron_post.php', 'Post a Cron Job', 1, 0),
(52, 'users/admin_message.php', 'View Message', 1, 0),
(53, 'users/admin_messages.php', 'View Messages', 1, 0),
(55, 'users/admin_logs.php', 'Site Logs', 1, 0),
(56, 'users/admin_logs_exempt.php', 'Site Logs', 1, 0),
(57, 'users/admin_logs_manager.php', 'Site Logs', 1, 0),
(58, 'users/admin_logs_mapper.php', 'Site Logs', 1, 0),
(68, 'users/update.php', 'Update UserSpice', 1, 0),
(69, 'users/admin_menu_item.php', 'Manage Menus', 1, 0),
(70, 'users/admin_menus.php', 'Manage Menus', 1, 0),
(71, 'users/admin_menu.php', 'Manage Menus', 1, 0),
(72, 'users/admin_ips.php', 'Admin IPs', 1, 0),
(73, 'users/subscribe.php', '', 1, 0),
(74, 'users/admin_notifications.php', 'Admin Notifications', 1, 0),
(75, 'users/enable2fa.php', 'Two Factor Authentication', 1, 0),
(76, 'users/enable2fa.php', 'Enable 2 Factor Auth', 1, 0),
(77, 'users/disable2fa.php', 'Enable 2 Factor Auth', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`) VALUES
(1, 'User'),
(2, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `permission_page_matches`
--

CREATE TABLE `permission_page_matches` (
  `id` int(11) NOT NULL,
  `permission_id` int(15) NOT NULL,
  `page_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_page_matches`
--

INSERT INTO `permission_page_matches` (`id`, `permission_id`, `page_id`) VALUES
(2, 2, 27),
(3, 1, 24),
(4, 1, 22),
(5, 2, 13),
(6, 2, 12),
(7, 1, 11),
(8, 2, 10),
(9, 2, 9),
(10, 2, 8),
(11, 2, 7),
(12, 2, 6),
(13, 2, 5),
(14, 2, 4),
(15, 1, 3),
(16, 2, 37),
(17, 2, 39),
(19, 2, 40),
(21, 2, 41),
(23, 2, 42),
(27, 1, 42),
(28, 1, 27),
(29, 1, 41),
(30, 1, 40),
(31, 2, 44),
(32, 2, 47),
(33, 2, 51),
(34, 2, 50),
(35, 2, 49),
(36, 2, 53),
(37, 2, 52),
(38, 2, 68),
(39, 2, 55),
(40, 2, 56),
(41, 2, 71),
(42, 2, 58),
(43, 2, 57),
(44, 2, 53),
(45, 2, 74),
(46, 2, 75),
(47, 1, 75),
(48, 1, 76),
(49, 2, 76),
(50, 1, 77),
(51, 2, 77);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `bio`) VALUES
(1, 1, '<h1>This is the Admin\'s bio.</h1>'),
(2, 2, 'This is your bio'),
(3, 3, 'This is your bio'),
(4, 4, 'This is your bio'),
(5, 5, 'This is your bio'),
(6, 6, 'This is your bio'),
(7, 7, 'This is your bio'),
(8, 8, 'This is your bio'),
(9, 9, 'This is your bio'),
(10, 10, 'This is your bio'),
(11, 11, 'This is your bio'),
(12, 12, 'This is your bio'),
(13, 13, 'This is your bio'),
(14, 14, 'This is your bio'),
(15, 15, 'This is your bio'),
(16, 16, 'This is your bio'),
(17, 17, 'This is your bio'),
(18, 18, 'This is your bio'),
(19, 19, 'This is your bio'),
(20, 20, 'This is your bio'),
(21, 21, 'This is your bio'),
(22, 22, 'This is your bio'),
(23, 23, 'This is your bio'),
(24, 24, 'This is your bio'),
(25, 25, 'This is your bio'),
(26, 26, 'This is your bio'),
(27, 27, 'This is your bio'),
(28, 28, 'This is your bio'),
(29, 29, 'This is your bio'),
(30, 30, 'This is your bio'),
(31, 31, 'This is your bio'),
(32, 32, 'This is your bio');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(50) NOT NULL,
  `recaptcha` int(1) NOT NULL DEFAULT '0',
  `force_ssl` int(1) NOT NULL,
  `css_sample` int(1) NOT NULL,
  `us_css1` varchar(255) NOT NULL,
  `us_css2` varchar(255) NOT NULL,
  `us_css3` varchar(255) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `language` varchar(255) NOT NULL,
  `track_guest` int(1) NOT NULL,
  `site_offline` int(1) NOT NULL,
  `force_pr` int(1) NOT NULL,
  `glogin` int(1) NOT NULL DEFAULT '0',
  `fblogin` int(1) NOT NULL,
  `gid` varchar(255) NOT NULL,
  `gsecret` varchar(255) NOT NULL,
  `gredirect` varchar(255) NOT NULL,
  `ghome` varchar(255) NOT NULL,
  `fbid` varchar(255) NOT NULL,
  `fbsecret` varchar(255) NOT NULL,
  `fbcallback` varchar(255) NOT NULL,
  `graph_ver` varchar(255) NOT NULL,
  `finalredir` varchar(255) NOT NULL,
  `req_cap` int(1) NOT NULL,
  `req_num` int(1) NOT NULL,
  `min_pw` int(2) NOT NULL,
  `max_pw` int(3) NOT NULL,
  `min_un` int(2) NOT NULL,
  `max_un` int(3) NOT NULL,
  `messaging` int(1) NOT NULL,
  `snooping` int(1) NOT NULL,
  `echouser` int(11) NOT NULL,
  `wys` int(1) NOT NULL,
  `change_un` int(1) NOT NULL,
  `backup_dest` varchar(255) NOT NULL,
  `backup_source` varchar(255) NOT NULL,
  `backup_table` varchar(255) NOT NULL,
  `msg_notification` int(1) NOT NULL,
  `permission_restriction` int(1) NOT NULL,
  `auto_assign_un` int(1) NOT NULL,
  `page_permission_restriction` int(1) NOT NULL,
  `msg_blocked_users` int(1) NOT NULL,
  `msg_default_to` int(1) NOT NULL,
  `notifications` int(1) NOT NULL,
  `notif_daylimit` int(3) NOT NULL,
  `recap_public` varchar(100) NOT NULL,
  `recap_private` varchar(100) NOT NULL,
  `page_default_private` int(1) NOT NULL,
  `navigation_type` tinyint(1) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `custom_settings` int(1) NOT NULL,
  `system_announcement` varchar(255) NOT NULL,
  `twofa` int(1) DEFAULT '0',
  `force_notif` tinyint(1) DEFAULT NULL,
  `cron_ip` varchar(255) DEFAULT NULL,
  `registration` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `recaptcha`, `force_ssl`, `css_sample`, `us_css1`, `us_css2`, `us_css3`, `site_name`, `language`, `track_guest`, `site_offline`, `force_pr`, `glogin`, `fblogin`, `gid`, `gsecret`, `gredirect`, `ghome`, `fbid`, `fbsecret`, `fbcallback`, `graph_ver`, `finalredir`, `req_cap`, `req_num`, `min_pw`, `max_pw`, `min_un`, `max_un`, `messaging`, `snooping`, `echouser`, `wys`, `change_un`, `backup_dest`, `backup_source`, `backup_table`, `msg_notification`, `permission_restriction`, `auto_assign_un`, `page_permission_restriction`, `msg_blocked_users`, `msg_default_to`, `notifications`, `notif_daylimit`, `recap_public`, `recap_private`, `page_default_private`, `navigation_type`, `copyright`, `custom_settings`, `system_announcement`, `twofa`, `force_notif`, `cron_ip`, `registration`) VALUES
(1, 0, 0, 0, '../users/css/color_schemes/bootstrap.min.css', '../users/css/sb-admin.css', '../users/css/custom.css', 'UserSpice', 'en', 1, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', 0, 0, 6, 30, 4, 30, 1, 1, 0, 1, 0, '/', 'everything', '', 0, 0, 0, 0, 0, 1, 0, 7, '6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI', '6LeIxAcTAAAAAGG-vFI1TnRWxMZNFuojJ4WifJWe', 1, 1, 'UserSpice', 1, '', 0, 0, 'off', 1);

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `migration` varchar(15) NOT NULL,
  `applied_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `migration`, `applied_on`) VALUES
(15, '3GJYaKcqUtw7', '2018-02-16 18:19:19'),
(16, '3GJYaKcqUtz8', '2018-02-16 18:19:19'),
(17, '69qa8h6E1bzG', '2018-02-16 18:19:19'),
(18, '2XQjsKYJAfn1', '2018-02-16 18:19:21'),
(19, '549DLFeHMNw7', '2018-02-16 18:19:21'),
(20, '4Dgt2XVjgz2x', '2018-02-16 18:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(155) NOT NULL,
  `email_new` varchar(155) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `permissions` int(11) NOT NULL,
  `logins` int(100) NOT NULL,
  `account_owner` tinyint(4) NOT NULL DEFAULT '0',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `company` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `email_verified` tinyint(4) NOT NULL DEFAULT '0',
  `vericode` varchar(15) NOT NULL,
  `active` int(1) NOT NULL,
  `oauth_provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `oauth_uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gpluslink` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `fb_uid` varchar(255) NOT NULL,
  `un_changed` int(1) NOT NULL,
  `msg_exempt` int(1) NOT NULL DEFAULT '0',
  `last_confirm` datetime DEFAULT NULL,
  `protected` int(1) NOT NULL DEFAULT '0',
  `dev_user` int(1) NOT NULL DEFAULT '0',
  `msg_notification` int(1) NOT NULL DEFAULT '1',
  `force_pr` int(1) NOT NULL DEFAULT '0',
  `twoKey` varchar(16) DEFAULT NULL,
  `twoEnabled` int(1) DEFAULT '0',
  `cloak_allowed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_new`, `username`, `password`, `fname`, `lname`, `permissions`, `logins`, `account_owner`, `account_id`, `company`, `join_date`, `last_login`, `email_verified`, `vericode`, `active`, `oauth_provider`, `oauth_uid`, `gender`, `locale`, `gpluslink`, `picture`, `created`, `modified`, `fb_uid`, `un_changed`, `msg_exempt`, `last_confirm`, `protected`, `dev_user`, `msg_notification`, `force_pr`, `twoKey`, `twoEnabled`, `cloak_allowed`) VALUES
(1, 'userspicephp@gmail.com', NULL, 'admin', '$2y$12$1v06jm2KMOXuuo3qP7erTuTIJFOnzhpds1Moa8BadnUUeX0RV3ex.', 'The', 'Admin', 1, 25, 1, 0, 'UserSpice', '2016-01-01 00:00:00', '2018-02-21 13:12:05', 1, 'Ksu6suKVl9ukmOk', 0, '', '', '', '', '', '', '0000-00-00 00:00:00', '1899-11-30 00:00:00', '', 0, 1, '2018-02-21 18:42:05', 1, 0, 1, 0, NULL, 0, 0),
(2, 'noreply@userspice.com', NULL, 'user', '$2y$12$HZa0/d7evKvuHO8I3U8Ff.pOjJqsGTZqlX8qURratzP./EvWetbkK', 'Sample', 'User', 1, 0, 1, 0, 'none', '2016-01-02 00:00:00', '2017-10-08 15:47:41', 1, 'fatBNZjJKSirq4Z', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, NULL, 0, 0, 1, 0, NULL, 0, 0),
(3, 'bababab@gmail.om', NULL, 'ababab', '$2y$12$0OSLyR9cSlBOp7RojZzPteqTS1xSUbxGSurYqAN863oP6q0ZjNNKW', 'Abababa', 'Bababab', 1, 1, 1, 0, '', '2018-02-18 07:26:03', '2018-02-18 07:26:04', 1, 'kzauaDylTcFRgs', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-18 07:26:04', 0, 0, 1, 0, NULL, 0, 0),
(4, 'babababab@gmail.com', NULL, 'abababaa', '$2y$12$44CMyUsxe7n4YoIiHDWoXeYsadq.taVlCoBvwZ6UclQo86znvnYdi', 'Ababba', 'Bababab', 1, 1, 1, 0, '', '2018-02-18 08:02:17', '2018-02-18 08:02:19', 1, 'hxANlgpkynwYD', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-18 08:02:19', 0, 0, 1, 0, NULL, 0, 0),
(5, 'abababab@gmail.com', NULL, 'abababff', '$2y$12$fjkzacGOC8htN3SpHdOysuH2tVisIhFlGgthzMziDr45H4crgCh1G', 'Bababab', 'Babbaba', 1, 1, 1, 0, '', '2018-02-18 08:16:54', '2018-02-18 08:16:56', 1, 'LelmUsPzZrIzFC', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-18 08:16:56', 0, 0, 1, 0, NULL, 0, 0),
(6, 'bbabababab@gmail.com', NULL, 'abababbaa', '$2y$12$N33Bq3A7S.auWur3O9PoXucCNPkmJyP5IIVgO0lmzlTN7VjDu3vBO', 'Babababab', 'Aabababba', 1, 1, 1, 0, '', '2018-02-19 09:06:39', '2018-02-19 09:06:41', 1, 'vlLMbBwZCDXTh1S', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 09:06:41', 0, 0, 1, 0, NULL, 0, 0),
(7, 'fbidsixty@yahoo.com', NULL, 'abababb', '$2y$12$51FHj9CejQHYXP3Gn6CUS.nkZWzBL4bZGR8jIAAH5Vp2OW6thOv0i', 'Babababbab', 'Babababb', 1, 1, 1, 0, '', '2018-02-19 10:01:58', '2018-02-19 10:02:00', 1, 'D9Qb0GZODERpw0m', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 10:02:00', 0, 0, 1, 0, NULL, 0, 0),
(8, 'fbiidnity@yahooc.om', NULL, 'abhishek', '$2y$12$D.raSoKsUI1LL3iKyS97OOJ0IOm8M6mxuGZYr/vWVJdBOp7cO6QC2', 'Avavav', 'Vavavav', 1, 1, 1, 0, '', '2018-02-19 10:03:09', '2018-02-19 10:03:11', 1, '9AClKVCswItDn0t', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 10:03:11', 0, 0, 1, 0, NULL, 0, 0),
(9, 'bababab@gmail.com', NULL, 'ababbab', '$2y$12$08FiGAojYvddwa9dznplxuyic//6bvZj9xZPFi7wig1ENmibBufAy', 'Bababab', 'Bababbab', 1, 1, 1, 0, '', '2018-02-19 12:56:45', '2018-02-19 12:56:46', 1, 'GilsVioNZg9R42G', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 12:56:46', 0, 0, 1, 0, NULL, 0, 0),
(10, 'abababbab@gmail.com', NULL, 'abababbaab', '$2y$12$.ggRRf8pzHv4l51cB5oU1u4mSK3WgPcVdf2lJ.G96vhrSob5Y1KDi', 'Aaababb', 'Bababbabab', 1, 1, 1, 0, '', '2018-02-19 12:58:32', '2018-02-19 12:58:33', 1, 'mHf7sqMrnUvAd', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 12:58:33', 0, 0, 1, 0, NULL, 0, 0),
(11, 'ababababb@gmail.com', NULL, 'ababbabab', '$2y$12$gr.qm9GGLso73Lkjse6HPehweHqfeUg/KsWZn5x.3ONMMAzW7f5U2', 'Babababb', 'Babababb', 1, 1, 1, 0, '', '2018-02-19 12:59:57', '2018-02-19 12:59:58', 1, 'qeLkZb3rPkcbwlG', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 12:59:58', 0, 0, 1, 0, NULL, 0, 0),
(12, 'bababbab@hotmail.com', NULL, 'ababababb', '$2y$12$bR9zIFkwFfU8JQkMMKG4WegTf3R7pLb7TpzlQU7gI36qbFmHosHM.', 'Babababab', 'Bbabababab', 1, 1, 1, 0, '', '2018-02-19 13:00:49', '2018-02-19 13:00:50', 1, 'PyemxMBBcI1VdHX', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 13:00:50', 0, 0, 1, 0, NULL, 0, 0),
(13, 'fbidnity@hotmail.com', NULL, 'nnaannanan', '$2y$12$H3G7dFbn6ZbzuYZImiSeg.z42/IuKy8qIfHpkPQp7vuaWfCLrbP2.', 'Abababb', 'Bababab', 1, 1, 1, 0, '', '2018-02-19 13:14:03', '2018-02-19 13:14:04', 1, 'yZycZPN8HYoNT', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 13:14:04', 0, 0, 1, 0, NULL, 0, 0),
(14, 'fbidnity@ayyayay.com', NULL, 'babbabb', '$2y$12$rWZ8PuGCp/vPS/3VthbK4.Ut4TEIwKPfmTciZMhEh0zJUtwlTi4lq', 'Babababbb', 'Abababba', 1, 1, 1, 0, '', '2018-02-19 13:16:55', '2018-02-19 13:16:56', 1, 'lfjwpN6g3VQHjbS', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 13:16:56', 0, 0, 1, 0, NULL, 0, 0),
(15, 'bbabbaab@gmail.com', NULL, 'abhishehhehe', '$2y$12$K9XYhLR0WwfifByQjbTev./7F/YbVayH3oTp1OKnDdTvXkDDL476G', 'Sbsbssbbsb', 'Babbabababab', 1, 1, 1, 0, '', '2018-02-19 18:59:15', '2018-02-19 18:59:17', 1, 'DKS4vBAVaInMtB', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 18:59:17', 0, 0, 1, 0, NULL, 0, 0),
(16, 'babababb@gmail.com', NULL, 'bbbababab', '$2y$12$oScLbwnseyAqeisAISeaG.6Kzlb1t23GfsDijiRtFK0i1KHsuY2Ga', 'Ababbaba', 'Bbbababab', 1, 1, 1, 0, '', '2018-02-19 19:20:48', '2018-02-19 19:20:50', 1, 'y8zn8vs7jUukf0X', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 19:20:50', 0, 0, 1, 0, NULL, 0, 0),
(17, 'yaou@gmail.com', NULL, 'abaabbababab', '$2y$12$nIv7Be8m9Es/pbY49R/8wuZmoPb7Awe3QycVMKF837Y9DbrL1bShO', 'Bababbabab', 'Babbababababbbsbs', 1, 1, 1, 0, '', '2018-02-19 19:30:35', '2018-02-19 19:30:37', 1, 'k7lYg2R2tx6rmCX', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 19:30:37', 0, 0, 1, 0, NULL, 0, 0),
(18, 'bbababababb@gmail.com', NULL, 'abbababab', '$2y$12$dapUJ26eY.sXmLz/yT2jTOE4SBKKQ58gEYfNWZxWoUJD4uNrtlfJC', 'Babbabababab', 'Babbababa', 1, 1, 1, 0, '', '2018-02-19 19:44:05', '2018-02-19 19:44:06', 1, 'riJmtbeRXP1A8aX', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 19:44:06', 0, 0, 1, 0, NULL, 0, 0),
(19, 'iaiiaiaiai@gmail.com', NULL, 'adiro', '$2y$12$V0gvwCxtqehQgyeQ23/nje8OYZWpXWFe05bPYxX3wFYPdor1YW2ca', 'Aiiaiaiaii', 'Iaiaiiaiaiai', 1, 1, 1, 0, '', '2018-02-19 19:48:48', '2018-02-19 19:48:49', 1, 'A5ByqWne9axqreH', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-19 19:48:49', 0, 0, 1, 0, NULL, 0, 0),
(20, 'baababab@gmail.com', NULL, 'ababababbaabb', '$2y$12$JdhRvmjO2A0T0A4HxfhrwOseNfI6oB6T45UOZFerRaD0eIOKEENxW', 'Bababababbababab', 'Bababbaababb', 1, 1, 1, 0, '', '2018-02-20 08:41:03', '2018-02-20 08:41:05', 1, '2mx1GDE11tDvsPd', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-20 08:41:05', 0, 0, 1, 0, NULL, 0, 0),
(21, 'nanananan@gmail.com', NULL, 'ananannan', '$2y$12$Z9uHJPZVK3M81dzK0vh/6egm2eDe1sEMTN3d2y8YKQkYUrd5aq.VO', 'Moomomooooo', 'Nanananannan', 1, 1, 1, 0, '', '2018-02-20 08:42:47', '2018-02-20 08:42:48', 1, 'nZqzTKAfpegSrlG', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-20 08:42:48', 0, 0, 1, 0, NULL, 0, 0),
(22, 'babababababb@gmail.com', NULL, 'ababababbabab', '$2y$12$X6rAZE852Oxz2fd7FR9DjuhSBihfGnQicoeOU56.6FSkTyAS6xaPG', 'Abbabababab', 'Babababbabab', 1, 1, 1, 0, '', '2018-02-20 11:11:20', '2018-02-20 11:11:21', 1, 'OQuDkcA3rdfh7X', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-20 11:11:21', 0, 0, 1, 0, NULL, 0, 0),
(23, 'babababbaba@gmail.com', NULL, 'abababbab', '$2y$12$1drIDfO8uF8wAviRqUYCy.fQandjNmIW/S1Uok6kBx/kqEruOY5va', 'Babbababab', 'Bababbababab', 1, 1, 1, 0, '', '2018-02-20 11:13:48', '2018-02-20 11:13:49', 1, 'I83atUdK8qYjIc2', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-20 11:13:49', 0, 0, 1, 0, NULL, 0, 0),
(24, 'kkakak@gmail.com', NULL, 'nine', '$2y$12$NOxY0VjyDRYcCjqdftIllOMqnpBP7ezJaaZm3cDMfgbL8sKttVjpy', 'Abhishek', 'Kakakkaka', 1, 2, 1, 0, '', '2018-02-20 11:14:39', '2018-02-20 11:14:53', 1, 'wVu7z4Nhj956deA', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-20 16:44:53', 0, 0, 1, 0, NULL, 0, 0),
(25, 'bbabababbabab@gmail.com', NULL, 'abbabababbba', '$2y$12$dy30bR5l.gSL3vk2fPL0j.l5cqNXLxz1WekgWIYwkJTiYtRZLPEle', 'Bbabababababab', 'Bbababababab', 1, 1, 1, 0, '', '2018-02-20 11:22:12', '2018-02-20 11:22:13', 1, 's8fq1PVmUmEXL6s', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-20 11:22:13', 0, 0, 1, 0, NULL, 0, 0),
(26, 'you@example.com', NULL, 'aaabbababab', '$2y$12$NZz/JX.w1r2MtYPixlbNFucEZppq6OxG9pKQwduM7KgiYCFM5rNJa', 'Babbabababa', 'Uwuwuuwuwu', 1, 1, 1, 0, '', '2018-02-20 11:24:32', '2018-02-20 11:24:33', 1, 'dZHLnWXqNyju8J', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-20 11:24:33', 0, 0, 1, 0, NULL, 0, 0),
(27, 'fbidsixtyyy@yahoo.com', NULL, 'amamamam', '$2y$12$BSfdnz7d85hgacQZmAL/POQnUYj4mNmr.D7OiJT6vs2JqKyBDdBFe', 'Mamammamam', 'Mamammamam', 1, 1, 1, 0, '', '2018-02-20 16:10:46', '2018-02-20 16:10:47', 1, 'PP1Gxak6hrTH7ta', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-20 16:10:47', 0, 0, 1, 0, NULL, 0, 0),
(28, 'fbxyz@yahoo.com', NULL, 'abcde', '$2y$12$hakZ1CCcG.x7NzmPWdGuheWxAHaexrm08fG3jNdWwey1OgfuDwBja', 'Ueuueuueu', 'Uuwuwuwuwu', 1, 1, 1, 0, '', '2018-02-21 12:10:34', '2018-02-21 12:10:35', 1, 'plBRWg79Fp8JXb', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-21 12:10:35', 0, 0, 1, 0, NULL, 0, 0),
(29, 'eeeeeeee@eeee.com', NULL, 'abcd', '$2y$12$uodHNRRFS0UJI04/cAaFue7GEUZ7kiMyQ88iogBMLmT.KLTfssoaS', 'Addddd', 'Uuuuuuuuu', 1, 3, 1, 0, '', '2018-02-21 12:11:55', '2018-02-21 15:14:54', 1, 'H5E1QnxXjVLraEj', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-21 20:44:54', 0, 0, 1, 0, NULL, 0, 0),
(30, 'babbababbttab@gmail.co', NULL, 'abdc', '$2y$12$6dxMori.XToeUKqPrctcXOxSzy57NO5PoqSeiy1IyyhK8f32o3gIC', 'Ababbabb', 'Babababab', 1, 1, 1, 0, '', '2018-02-21 12:14:23', '2018-02-21 12:14:24', 1, 'RA3IYfV1koUk8Pd', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-21 12:14:24', 0, 0, 1, 0, NULL, 0, 0),
(31, 'bababababb@gmail.com', NULL, 'bababbababababab', '$2y$12$Gs/NU1BGLMCdbzCKN2ymeeEdaifV.LLRWz1FyTeAipxm24sNpJZJq', 'Babababab', 'Bbabababbab', 1, 1, 1, 0, '', '2018-02-21 12:52:32', '2018-02-21 12:52:33', 1, 'LaWEjuj4lJh5tfK', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-21 12:52:33', 0, 0, 1, 0, NULL, 0, 0),
(32, 'bbabababababab@gmail.com', NULL, 'qwer', '$2y$12$w5nJStcjBlmtK4thIsPsTON/0L02ipkc1vqWCv38D.fz/OIonTCue', 'Ababbabab', 'Bbabababbab', 1, 2, 1, 0, '', '2018-02-21 13:22:27', '2018-02-21 13:22:38', 1, 'gBbp7Z7CshQJ1gv', 1, '', '', '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, 0, '2018-02-21 18:52:39', 0, 0, 1, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(10) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `timestamp` varchar(15) NOT NULL,
  `user_id` int(10) NOT NULL,
  `session` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `ip`, `timestamp`, `user_id`, `session`) VALUES
(1, '192.168.1.104', '1519218725', 1, ''),
(14, '192.168.1.104', '1519067936', 15, ''),
(15, '192.168.1.104', '1519068557', 16, ''),
(16, '192.168.1.104', '1519068637', 17, ''),
(17, '192.168.1.104', '1519069447', 18, ''),
(18, '192.168.1.104', '1519069729', 19, ''),
(19, '192.168.1.104', '1519116065', 20, ''),
(20, '192.168.1.104', '1519116245', 21, ''),
(21, '192.168.1.104', '1519125082', 22, ''),
(22, '192.168.1.104', '1519125230', 23, ''),
(23, '192.168.1.104', '1519125293', 24, ''),
(24, '192.168.1.104', '1519125733', 25, ''),
(25, '192.168.1.104', '1519125873', 26, ''),
(26, '192.168.1.104', '1519143048', 27, ''),
(27, '192.168.1.114', '1519215036', 28, ''),
(28, '192.168.1.104', '1519226094', 29, ''),
(29, '192.168.1.114', '1519215265', 30, ''),
(30, '192.168.1.104', '1519217553', 31, ''),
(31, '192.168.1.104', '1519219359', 32, '');

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE `users_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `uagent` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_session`
--

INSERT INTO `users_session` (`id`, `user_id`, `hash`, `uagent`) VALUES
(1, 3, '378d819afe18669c22dfa4ae0e00feb7498d0c4b20eb0d678f6a316c68881e05', 'Mozilla (X11; Ubuntu; Linux x86_64; rv:57.0) Gecko Firefox'),
(2, 6, '6d5a796ec16b87230b7b27fe527aeb1944205de29d2cf7e5e7d3811d5b42cea6', 'Mozilla (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit (KHTML, like Gecko) Version Safari'),
(3, 7, '242cfaeeb485fb958326dfa6ec4dd8c2595c5ffb7ddde64f76ad3664b9ca73da', 'Mozilla (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit (KHTML, like Gecko) Version Safari'),
(4, 8, 'fa9e836d4e91af98bae3e87f68cee637be31dd28e99eb615527f689c5d9fed03', 'Mozilla (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit (KHTML, like Gecko) Version Safari'),
(5, 9, 'ec702084a86eb2118703d8686835484d3f9fdbf66c9cde08a6fe7c668565232e', 'Mozilla (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit (KHTML, like Gecko) Version Safari'),
(6, 10, '5d0e3f418e159cd247c0fd53e7244f76b00ef0a92a03c0b310f886783d046046', 'Mozilla (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit (KHTML, like Gecko) Version Safari'),
(7, 11, '49cfdd91ea7b0f1ad55fd078b3ca4108cc001e017e25c165f665bb140a2c63da', 'Mozilla (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit (KHTML, like Gecko) Version Safari'),
(8, 12, 'e6d1343ef4fd385acaabb97d94b9307f27824f7761dd4060610aea8b4652d126', 'Mozilla (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit (KHTML, like Gecko) Version Safari'),
(9, 13, 'fd5e245753db8eb60e2a55a1066e197ea49584b67c897d2cc4359099a74101e8', 'Mozilla (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit (KHTML, like Gecko) Version Safari'),
(10, 14, 'ed87ce632801be3430b5583e1e09e4c59e3d42d5a49731e336fc6b8a3c103dac', '\"Mozilla (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit (KHTML, like Gecko) Version Mobile Safari\"'),
(11, 15, '74539ac2ea021800ad2bf4ceff9457ed94f8f1921b174ef1be52348ac21edb7c', 'Mozilla (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit (KHTML, like Gecko) Version Safari'),
(14, 18, 'c4ab174d904b359906dcb3bbfb532b6fa4b020c9da99395d503aa07b04c9da49', 'Mozilla (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit (KHTML, like Gecko) Version Safari');

-- --------------------------------------------------------

--
-- Table structure for table `user_permission_matches`
--

CREATE TABLE `user_permission_matches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_permission_matches`
--

INSERT INTO `user_permission_matches` (`id`, `user_id`, `permission_id`) VALUES
(100, 1, 1),
(101, 1, 2),
(102, 2, 1),
(103, 3, 1),
(104, 4, 1),
(105, 5, 1),
(106, 6, 1),
(107, 7, 1),
(108, 8, 1),
(109, 9, 1),
(110, 10, 1),
(111, 11, 1),
(112, 12, 1),
(113, 13, 1),
(114, 14, 1),
(115, 15, 1),
(116, 16, 1),
(117, 17, 1),
(118, 18, 1),
(119, 19, 1),
(120, 20, 1),
(121, 21, 1),
(122, 22, 1),
(123, 23, 1),
(124, 24, 1),
(125, 25, 1),
(126, 26, 1),
(127, 27, 1),
(128, 28, 1),
(129, 29, 1),
(130, 30, 1),
(131, 31, 1),
(132, 32, 1);

-- --------------------------------------------------------

--
-- Table structure for table `us_ip_blacklist`
--

CREATE TABLE `us_ip_blacklist` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `last_user` int(11) NOT NULL DEFAULT '0',
  `reason` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_ip_blacklist`
--

INSERT INTO `us_ip_blacklist` (`id`, `ip`, `last_user`, `reason`) VALUES
(3, '192.168.0.21', 1, 0),
(4, '192.168.0.22', 1, 0),
(10, '192.168.0.222', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `us_ip_list`
--

CREATE TABLE `us_ip_list` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_ip_list`
--

INSERT INTO `us_ip_list` (`id`, `ip`, `user_id`, `timestamp`) VALUES
(1, '::1', 1, '2017-10-09 15:20:03'),
(2, '127.0.0.1', 1, '2018-02-16 18:18:28'),
(3, '192.168.1.114', 29, '2018-02-21 12:21:47'),
(4, '192.168.1.104', 29, '2018-02-21 15:14:54');

-- --------------------------------------------------------

--
-- Table structure for table `us_ip_whitelist`
--

CREATE TABLE `us_ip_whitelist` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `us_ip_whitelist`
--

INSERT INTO `us_ip_whitelist` (`id`, `ip`) VALUES
(2, '192.168.0.21'),
(3, '192.168.0.23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crons`
--
ALTER TABLE `crons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crons_logs`
--
ALTER TABLE `crons_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_menus`
--
ALTER TABLE `groups_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_exempt`
--
ALTER TABLE `logs_exempt`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `logs_exempt_type` (`name`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_threads`
--
ALTER TABLE `message_threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mqtt`
--
ALTER TABLE `mqtt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_page_matches`
--
ALTER TABLE `permission_page_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EMAIL` (`email`) USING BTREE;

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_session`
--
ALTER TABLE `users_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permission_matches`
--
ALTER TABLE `user_permission_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_ip_blacklist`
--
ALTER TABLE `us_ip_blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_ip_list`
--
ALTER TABLE `us_ip_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `us_ip_whitelist`
--
ALTER TABLE `us_ip_whitelist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `crons`
--
ALTER TABLE `crons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crons_logs`
--
ALTER TABLE `crons_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `groups_menus`
--
ALTER TABLE `groups_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `logs_exempt`
--
ALTER TABLE `logs_exempt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message_threads`
--
ALTER TABLE `message_threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mqtt`
--
ALTER TABLE `mqtt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permission_page_matches`
--
ALTER TABLE `permission_page_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users_session`
--
ALTER TABLE `users_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_permission_matches`
--
ALTER TABLE `user_permission_matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `us_ip_blacklist`
--
ALTER TABLE `us_ip_blacklist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `us_ip_list`
--
ALTER TABLE `us_ip_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `us_ip_whitelist`
--
ALTER TABLE `us_ip_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
