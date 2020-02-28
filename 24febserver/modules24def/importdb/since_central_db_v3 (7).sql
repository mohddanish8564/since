-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2020 at 03:06 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `since_central_db_v3`
--

-- --------------------------------------------------------

--
-- Table structure for table `emailvars`
--

CREATE TABLE `emailvars` (
  `id` int(11) NOT NULL,
  `flink` varchar(80) NOT NULL,
  `glink` varchar(80) NOT NULL,
  `tlink` varchar(80) NOT NULL,
  `ilink` varchar(80) NOT NULL,
  `yt` varchar(50) NOT NULL,
  `tag1` varchar(200) NOT NULL,
  `tag2` varchar(200) NOT NULL,
  `tag3` varchar(200) NOT NULL,
  `tag4` varchar(210) NOT NULL,
  `tag5` varchar(210) NOT NULL,
  `name` varchar(120) NOT NULL,
  `copyright` varchar(120) NOT NULL,
  `address` varchar(200) NOT NULL,
  `noreplys` varchar(80) NOT NULL,
  `func` varchar(20) NOT NULL,
  `postdate` datetime NOT NULL,
  `email` varchar(60) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emailvars`
--

INSERT INTO `emailvars` (`id`, `flink`, `glink`, `tlink`, `ilink`, `yt`, `tag1`, `tag2`, `tag3`, `tag4`, `tag5`, `name`, `copyright`, `address`, `noreplys`, `func`, `postdate`, `email`, `mobile`, `img`) VALUES
(1, 'facebook7.com', 'google7.com', 'twitter7.com', 'insta37', 'youtube.com', 'The World\'s Best Online Teaching Management vk', 'Own your future by learning new skills online vk', 'The art of teaching is the art of discovery vk', 'Become a Teacher for VK', 'Teach what you love. Edufair gives you the tools to create an online course. vk', 'About Us', '@2018', '77 gfgfg, dfgdf', 'noreply@rsv.com', 'mailTemp', '2018-08-01 17:03:59', 'email@email.com', '(000) 12 456 789', 'assets/web/images/logoimg1537408700.png');

-- --------------------------------------------------------

--
-- Table structure for table `emptype`
--

CREATE TABLE `emptype` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dstatus` tinyint(1) NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emptype`
--

INSERT INTO `emptype` (`id`, `name`, `status`, `dstatus`, `postdate`) VALUES
(1, 'admin', 1, 0, '2018-09-21 00:00:00'),
(2, 'user', 1, 0, '2018-09-21 00:00:00'),
(3, 'manager', 1, 0, '2018-09-21 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `import_beneficiaries`
--

CREATE TABLE `import_beneficiaries` (
  `id` int(11) NOT NULL,
  `beneficiary_id` bigint(20) NOT NULL,
  `sex` varchar(12) NOT NULL,
  `region` varchar(45) NOT NULL,
  `entry_date_to_since` date NOT NULL,
  `target_group` varchar(65) NOT NULL,
  `value_chain` varchar(45) NOT NULL,
  `entry_point_income` float NOT NULL,
  `endline_income` float NOT NULL,
  `type_of_income` varchar(20) NOT NULL,
  `disabled` varchar(15) NOT NULL,
  `Employed` varchar(15) DEFAULT NULL,
  `consortium` varchar(30) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `import_beneficiary_trainings`
--

CREATE TABLE `import_beneficiary_trainings` (
  `beneficiary_id` bigint(20) NOT NULL,
  `tvet_id` int(7) NOT NULL,
  `training_module` varchar(65) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `import_job_placement`
--

CREATE TABLE `import_job_placement` (
  `beneficiary_id` bigint(20) NOT NULL,
  `job_placed` varchar(15) DEFAULT NULL,
  `placement_type` varchar(25) NOT NULL,
  `sme_or_cpmpany_id` int(7) NOT NULL,
  `wage` float NOT NULL,
  `consortium` varchar(30) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `import_smecompanies`
--

CREATE TABLE `import_smecompanies` (
  `enterprise_id` bigint(20) NOT NULL,
  `name` varchar(65) NOT NULL,
  `is_sme` varchar(10) NOT NULL,
  `region` varchar(25) NOT NULL,
  `consortium` varchar(25) NOT NULL,
  `since_supported` varchar(10) NOT NULL,
  `value_chain` varchar(30) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `import_tvet`
--

CREATE TABLE `import_tvet` (
  `id` int(11) NOT NULL,
  `tvet_id` int(7) NOT NULL,
  `tvet_name` varchar(65) NOT NULL,
  `region` varchar(45) NOT NULL,
  `tvet_type` varchar(25) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `table_name` varchar(45) NOT NULL,
  `uploaded_rec` int(7) NOT NULL,
  `total_records` int(7) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `table_name`, `uploaded_rec`, `total_records`, `date`) VALUES
(1, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-24 00:00:00'),
(2, 'xls_import_beneficiaries', 1592, 1593, '2020-01-24 00:00:00'),
(3, 'xls_import_job_placement', 676, 681, '2020-01-24 00:00:00'),
(4, 'xls_import_oo_indicators12', 11, 12, '2020-01-24 00:00:00'),
(5, 'xls_import_oo_indicators34', 1, 2, '2020-01-24 00:00:00'),
(6, 'xls_import_pp', 27, 28, '2020-01-24 00:00:00'),
(7, 'xls_import_sme_support', 153, 154, '2020-01-24 00:00:00'),
(8, 'xls_import_tvet', 13, 14, '2020-01-24 00:00:00'),
(9, 'xls_import_smecompanies', 152, 153, '2020-01-24 00:00:00'),
(10, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-24 00:00:00'),
(11, 'xls_import_beneficiaries', 1592, 1593, '2020-01-24 00:00:00'),
(12, 'xls_import_job_placement', 676, 681, '2020-01-24 00:00:00'),
(13, 'xls_import_oo_indicators12', 11, 12, '2020-01-24 00:00:00'),
(14, 'xls_import_oo_indicators34', 1, 2, '2020-01-24 00:00:00'),
(15, 'xls_import_pp', 27, 28, '2020-01-24 00:00:00'),
(16, 'xls_import_sme_support', 153, 154, '2020-01-24 00:00:00'),
(17, 'xls_import_tvet', 13, 14, '2020-01-24 00:00:00'),
(18, 'xls_import_smecompanies', 0, 153, '2020-01-24 00:00:00'),
(19, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-24 00:00:00'),
(20, 'xls_import_beneficiaries', 1592, 1593, '2020-01-24 00:00:00'),
(21, 'xls_import_job_placement', 676, 681, '2020-01-24 00:00:00'),
(22, 'xls_import_oo_indicators12', 11, 12, '2020-01-24 00:00:00'),
(23, 'xls_import_oo_indicators34', 1, 2, '2020-01-24 00:00:00'),
(24, 'xls_import_pp', 27, 28, '2020-01-24 00:00:00'),
(25, 'xls_import_sme_support', 153, 154, '2020-01-24 00:00:00'),
(26, 'xls_import_tvet', 13, 14, '2020-01-24 00:00:00'),
(27, 'xls_import_smecompanies', 152, 153, '2020-01-24 00:00:00'),
(28, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-24 00:00:00'),
(29, 'xls_import_beneficiaries', 1592, 1593, '2020-01-24 00:00:00'),
(30, 'xls_import_job_placement', 676, 681, '2020-01-24 00:00:00'),
(31, 'xls_import_oo_indicators12', 11, 12, '2020-01-24 00:00:00'),
(32, 'xls_import_oo_indicators34', 1, 2, '2020-01-24 00:00:00'),
(33, 'xls_import_pp', 27, 28, '2020-01-24 00:00:00'),
(34, 'xls_import_sme_support', 153, 154, '2020-01-24 00:00:00'),
(35, 'xls_import_tvet', 13, 14, '2020-01-24 00:00:00'),
(36, 'xls_import_smecompanies', 0, 153, '2020-01-24 00:00:00'),
(37, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-24 00:00:00'),
(38, 'xls_import_beneficiaries', 1592, 1593, '2020-01-24 00:00:00'),
(39, 'xls_import_job_placement', 676, 681, '2020-01-24 00:00:00'),
(40, 'xls_import_oo_indicators12', 11, 12, '2020-01-24 00:00:00'),
(41, 'xls_import_oo_indicators34', 1, 2, '2020-01-24 00:00:00'),
(42, 'xls_import_pp', 27, 28, '2020-01-24 00:00:00'),
(43, 'xls_import_sme_support', 153, 154, '2020-01-24 00:00:00'),
(44, 'xls_import_tvet', 13, 14, '2020-01-24 00:00:00'),
(45, 'xls_import_smecompanies', 152, 153, '2020-01-24 00:00:00'),
(46, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-24 00:00:00'),
(47, 'xls_import_beneficiaries', 1592, 1593, '2020-01-24 00:00:00'),
(48, 'xls_import_job_placement', 676, 681, '2020-01-24 00:00:00'),
(49, 'xls_import_oo_indicators12', 11, 12, '2020-01-24 00:00:00'),
(50, 'xls_import_oo_indicators34', 1, 2, '2020-01-24 00:00:00'),
(51, 'xls_import_pp', 27, 28, '2020-01-24 00:00:00'),
(52, 'xls_import_sme_support', 153, 154, '2020-01-24 00:00:00'),
(53, 'xls_import_tvet', 13, 14, '2020-01-24 00:00:00'),
(54, 'xls_import_smecompanies', 152, 153, '2020-01-24 00:00:00'),
(55, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-24 00:00:00'),
(56, 'xls_import_beneficiaries', 1592, 1593, '2020-01-24 00:00:00'),
(57, 'xls_import_job_placement', 676, 681, '2020-01-24 00:00:00'),
(58, 'xls_import_oo_indicators12', 11, 12, '2020-01-24 00:00:00'),
(59, 'xls_import_oo_indicators34', 1, 2, '2020-01-24 00:00:00'),
(60, 'xls_import_pp', 27, 28, '2020-01-24 00:00:00'),
(61, 'xls_import_sme_support', 153, 154, '2020-01-24 00:00:00'),
(62, 'xls_import_tvet', 13, 14, '2020-01-24 00:00:00'),
(63, 'xls_import_smecompanies', 152, 153, '2020-01-24 00:00:00'),
(64, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-24 00:00:00'),
(65, 'xls_import_beneficiaries', 1592, 1593, '2020-01-24 00:00:00'),
(66, 'xls_import_job_placement', 676, 681, '2020-01-24 00:00:00'),
(67, 'xls_import_oo_indicators12', 11, 12, '2020-01-24 00:00:00'),
(68, 'xls_import_oo_indicators34', 1, 2, '2020-01-24 00:00:00'),
(69, 'xls_import_pp', 27, 28, '2020-01-24 00:00:00'),
(70, 'xls_import_sme_support', 153, 154, '2020-01-24 00:00:00'),
(71, 'xls_import_tvet', 13, 14, '2020-01-24 00:00:00'),
(72, 'xls_import_smecompanies', 152, 153, '2020-01-24 00:00:00'),
(73, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-27 00:00:00'),
(74, 'xls_import_beneficiaries', 1592, 1593, '2020-01-27 00:00:00'),
(75, 'xls_import_job_placement', 676, 681, '2020-01-27 00:00:00'),
(76, 'xls_import_oo_indicators12', 11, 12, '2020-01-27 00:00:00'),
(77, 'xls_import_oo_indicators34', 1, 2, '2020-01-27 00:00:00'),
(78, 'xls_import_pp', 27, 28, '2020-01-27 00:00:00'),
(79, 'xls_import_sme_support', 153, 154, '2020-01-27 00:00:00'),
(80, 'xls_import_tvet', 13, 14, '2020-01-27 00:00:00'),
(81, 'xls_import_smecompanies', 152, 153, '2020-01-27 00:00:00'),
(82, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-27 00:00:00'),
(83, 'xls_import_beneficiaries', 1592, 1593, '2020-01-27 00:00:00'),
(84, 'xls_import_job_placement', 676, 681, '2020-01-27 00:00:00'),
(85, 'xls_import_oo_indicators12', 11, 12, '2020-01-27 00:00:00'),
(86, 'xls_import_oo_indicators34', 1, 2, '2020-01-27 00:00:00'),
(87, 'xls_import_pp', 27, 28, '2020-01-27 00:00:00'),
(88, 'xls_import_sme_support', 153, 154, '2020-01-27 00:00:00'),
(89, 'xls_import_tvet', 13, 14, '2020-01-27 00:00:00'),
(90, 'xls_import_smecompanies', 152, 153, '2020-01-27 00:00:00'),
(91, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-27 00:00:00'),
(92, 'xls_import_beneficiaries', 1592, 1593, '2020-01-27 00:00:00'),
(93, 'xls_import_job_placement', 676, 681, '2020-01-27 00:00:00'),
(94, 'xls_import_oo_indicators12', 11, 12, '2020-01-27 00:00:00'),
(95, 'xls_import_oo_indicators34', 1, 2, '2020-01-27 00:00:00'),
(96, 'xls_import_pp', 27, 28, '2020-01-27 00:00:00'),
(97, 'xls_import_sme_support', 153, 154, '2020-01-27 00:00:00'),
(98, 'xls_import_tvet', 13, 14, '2020-01-27 00:00:00'),
(99, 'xls_import_smecompanies', 152, 153, '2020-01-27 00:00:00'),
(100, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-27 00:00:00'),
(101, 'xls_import_beneficiaries', 1592, 1593, '2020-01-27 00:00:00'),
(102, 'xls_import_job_placement', 676, 681, '2020-01-27 00:00:00'),
(103, 'xls_import_oo_indicators12', 11, 12, '2020-01-27 00:00:00'),
(104, 'xls_import_oo_indicators34', 1, 2, '2020-01-27 00:00:00'),
(105, 'xls_import_pp', 27, 28, '2020-01-27 00:00:00'),
(106, 'xls_import_sme_support', 153, 154, '2020-01-27 00:00:00'),
(107, 'xls_import_tvet', 13, 14, '2020-01-27 00:00:00'),
(108, 'xls_import_smecompanies', 152, 153, '2020-01-27 00:00:00'),
(109, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-27 00:00:00'),
(110, 'xls_import_beneficiaries', 1592, 1593, '2020-01-27 00:00:00'),
(111, 'xls_import_job_placement', 676, 681, '2020-01-27 00:00:00'),
(112, 'xls_import_oo_indicators12', 11, 12, '2020-01-27 00:00:00'),
(113, 'xls_import_oo_indicators34', 1, 2, '2020-01-27 00:00:00'),
(114, 'xls_import_pp', 27, 28, '2020-01-27 00:00:00'),
(115, 'xls_import_sme_support', 153, 154, '2020-01-27 00:00:00'),
(116, 'xls_import_tvet', 13, 14, '2020-01-27 00:00:00'),
(117, 'xls_import_smecompanies', 152, 153, '2020-01-27 00:00:00'),
(118, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-27 00:00:00'),
(119, 'xls_import_beneficiaries', 1592, 1593, '2020-01-27 00:00:00'),
(120, 'xls_import_job_placement', 676, 681, '2020-01-27 00:00:00'),
(121, 'xls_import_oo_indicators12', 11, 12, '2020-01-27 00:00:00'),
(122, 'xls_import_oo_indicators34', 1, 2, '2020-01-27 00:00:00'),
(123, 'xls_import_pp', 27, 28, '2020-01-27 00:00:00'),
(124, 'xls_import_sme_support', 153, 154, '2020-01-27 00:00:00'),
(125, 'xls_import_tvet', 13, 14, '2020-01-27 00:00:00'),
(126, 'xls_import_smecompanies', 152, 153, '2020-01-27 00:00:00'),
(127, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(128, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(129, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(130, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(131, 'xls_import_oo_indicators34', 1, 2, '2020-01-28 00:00:00'),
(132, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(133, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(134, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(135, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(136, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(137, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(138, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(139, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(140, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(141, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(142, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(143, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(144, 'xls_import_tvet_training_bkp', 6, 46, '2020-01-28 00:00:00'),
(145, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(146, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(147, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(148, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(149, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(150, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(151, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(152, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(153, 'xls_import_tvet_training_bkp', 16, 46, '2020-01-28 00:00:00'),
(154, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(155, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(156, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(157, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(158, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(159, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(160, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(161, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(162, 'xls_import_tvet_training_bkp', 16, 46, '2020-01-28 00:00:00'),
(163, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(164, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(165, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(166, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(167, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(168, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(169, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(170, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(171, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(172, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(173, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(174, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(175, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(176, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(177, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(178, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(179, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(180, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(181, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(182, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(183, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(184, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(185, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(186, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(187, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(188, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(189, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(190, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(191, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(192, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(193, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(194, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(195, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(196, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(197, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(198, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(199, 'xls_import_oo_indicators34', 1, 2, '2020-01-28 00:00:00'),
(200, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(201, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(202, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(203, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(204, 'xls_import_tvet_training_bkp', 16, 46, '2020-01-28 00:00:00'),
(205, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(206, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(207, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(208, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(209, 'xls_import_oo_indicators34', 1, 2, '2020-01-28 00:00:00'),
(210, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(211, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(212, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(213, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(214, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-28 00:00:00'),
(215, 'xls_import_beneficiaries', 1592, 1593, '2020-01-28 00:00:00'),
(216, 'xls_import_job_placement', 676, 681, '2020-01-28 00:00:00'),
(217, 'xls_import_oo_indicators12', 11, 12, '2020-01-28 00:00:00'),
(218, 'xls_import_oo_indicators34', 1, 2, '2020-01-28 00:00:00'),
(219, 'xls_import_pp', 27, 28, '2020-01-28 00:00:00'),
(220, 'xls_import_sme_support', 153, 154, '2020-01-28 00:00:00'),
(221, 'xls_import_tvet', 13, 14, '2020-01-28 00:00:00'),
(222, 'xls_import_smecompanies', 152, 153, '2020-01-28 00:00:00'),
(223, 'xls_import_tvet_training_bkp', 45, 46, '2020-01-28 00:00:00'),
(224, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-29 00:00:00'),
(225, 'xls_import_beneficiaries', 1592, 1593, '2020-01-29 00:00:00'),
(226, 'xls_import_job_placement', 676, 681, '2020-01-29 00:00:00'),
(227, 'xls_import_oo_indicators12', 11, 12, '2020-01-29 00:00:00'),
(228, 'xls_import_oo_indicators34', 1, 2, '2020-01-29 00:00:00'),
(229, 'xls_import_pp', 27, 28, '2020-01-29 00:00:00'),
(230, 'xls_import_sme_support', 153, 154, '2020-01-29 00:00:00'),
(231, 'xls_import_tvet', 13, 14, '2020-01-29 00:00:00'),
(232, 'xls_import_smecompanies', 152, 153, '2020-01-29 00:00:00'),
(233, 'xls_import_tvet_training_bkp', 45, 46, '2020-01-29 00:00:00'),
(234, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-29 00:00:00'),
(235, 'xls_import_beneficiaries', 1592, 1593, '2020-01-29 00:00:00'),
(236, 'xls_import_job_placement', 676, 681, '2020-01-29 00:00:00'),
(237, 'xls_import_oo_indicators12', 11, 12, '2020-01-29 00:00:00'),
(238, 'xls_import_oo_indicators34', 1, 2, '2020-01-29 00:00:00'),
(239, 'xls_import_pp', 27, 28, '2020-01-29 00:00:00'),
(240, 'xls_import_sme_support', 153, 154, '2020-01-29 00:00:00'),
(241, 'xls_import_tvet', 13, 14, '2020-01-29 00:00:00'),
(242, 'xls_import_smecompanies', 152, 153, '2020-01-29 00:00:00'),
(243, 'xls_import_tvet_training', 45, 46, '2020-01-29 00:00:00'),
(244, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-30 00:00:00'),
(245, 'xls_import_beneficiaries', 1592, 1593, '2020-01-30 00:00:00'),
(246, 'xls_import_job_placement', 676, 681, '2020-01-30 00:00:00'),
(247, 'xls_import_oo_indicators12', 11, 12, '2020-01-30 00:00:00'),
(248, 'xls_import_oo_indicators34', 1, 2, '2020-01-30 00:00:00'),
(249, 'xls_import_pp', 27, 28, '2020-01-30 00:00:00'),
(250, 'xls_import_sme_support', 153, 154, '2020-01-30 00:00:00'),
(251, 'xls_import_tvet', 13, 14, '2020-01-30 00:00:00'),
(252, 'xls_import_smecompanies', 152, 153, '2020-01-30 00:00:00'),
(253, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-30 00:00:00'),
(254, 'xls_import_beneficiaries', 1592, 1593, '2020-01-30 00:00:00'),
(255, 'xls_import_job_placement', 676, 681, '2020-01-30 00:00:00'),
(256, 'xls_import_oo_indicators12', 11, 12, '2020-01-30 00:00:00'),
(257, 'xls_import_oo_indicators34', 1, 2, '2020-01-30 00:00:00'),
(258, 'xls_import_pp', 27, 28, '2020-01-30 00:00:00'),
(259, 'xls_import_sme_support', 153, 154, '2020-01-30 00:00:00'),
(260, 'xls_import_tvet', 13, 14, '2020-01-30 00:00:00'),
(261, 'xls_import_smecompanies', 152, 153, '2020-01-30 00:00:00'),
(262, 'xls_import_tvet_training', 45, 46, '2020-01-30 00:00:00'),
(263, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-30 00:00:00'),
(264, 'xls_import_beneficiaries', 1592, 1593, '2020-01-30 00:00:00'),
(265, 'xls_import_job_placement', 676, 681, '2020-01-30 00:00:00'),
(266, 'xls_import_oo_indicators12', 11, 12, '2020-01-30 00:00:00'),
(267, 'xls_import_oo_indicators34', 1, 2, '2020-01-30 00:00:00'),
(268, 'xls_import_pp', 27, 28, '2020-01-30 00:00:00'),
(269, 'xls_import_sme_support', 153, 154, '2020-01-30 00:00:00'),
(270, 'xls_import_tvet', 13, 14, '2020-01-30 00:00:00'),
(271, 'xls_import_smecompanies', 152, 153, '2020-01-30 00:00:00'),
(272, 'xls_import_tvet_training', 45, 46, '2020-01-30 00:00:00'),
(273, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-30 00:00:00'),
(274, 'xls_import_beneficiaries', 1592, 1593, '2020-01-30 00:00:00'),
(275, 'xls_import_job_placement', 676, 681, '2020-01-30 00:00:00'),
(276, 'xls_import_oo_indicators12', 11, 12, '2020-01-30 00:00:00'),
(277, 'xls_import_oo_indicators34', 1, 2, '2020-01-30 00:00:00'),
(278, 'xls_import_pp', 27, 28, '2020-01-30 00:00:00'),
(279, 'xls_import_sme_support', 153, 154, '2020-01-30 00:00:00'),
(280, 'xls_import_tvet', 13, 14, '2020-01-30 00:00:00'),
(281, 'xls_import_smecompanies', 152, 153, '2020-01-30 00:00:00'),
(282, 'xls_import_tvet_training', 45, 46, '2020-01-30 00:00:00'),
(283, 'xls_import_beneficiary_trainings', 407, 411, '2020-01-30 00:00:00'),
(284, 'xls_import_beneficiaries', 934, 935, '2020-01-30 00:00:00'),
(285, 'xls_import_job_placement', 282, 313, '2020-01-30 00:00:00'),
(286, 'xls_import_oo_indicators12', 3, 4, '2020-01-30 00:00:00'),
(287, 'xls_import_pp', 4, 5, '2020-01-30 00:00:00'),
(288, 'xls_import_sme_support', 28, 29, '2020-01-30 00:00:00'),
(289, 'xls_import_tvet', 3, 4, '2020-01-30 00:00:00'),
(290, 'xls_import_smecompanies', 34, 35, '2020-01-30 00:00:00'),
(291, 'xls_import_tvet_training', 10, 11, '2020-01-30 00:00:00'),
(292, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-01-31 00:00:00'),
(293, 'xls_import_beneficiaries', 1592, 1593, '2020-01-31 00:00:00'),
(294, 'xls_import_job_placement', 676, 681, '2020-01-31 00:00:00'),
(295, 'xls_import_oo_indicators12', 11, 12, '2020-01-31 00:00:00'),
(296, 'xls_import_oo_indicators34', 1, 2, '2020-01-31 00:00:00'),
(297, 'xls_import_pp', 27, 28, '2020-01-31 00:00:00'),
(298, 'xls_import_sme_support', 153, 154, '2020-01-31 00:00:00'),
(299, 'xls_import_tvet', 13, 14, '2020-01-31 00:00:00'),
(300, 'xls_import_smecompanies', 152, 153, '2020-01-31 00:00:00'),
(301, 'xls_import_tvet_training', 45, 46, '2020-01-31 00:00:00'),
(302, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-05 00:00:00'),
(303, 'xls_import_beneficiaries', 1592, 1593, '2020-02-05 00:00:00'),
(304, 'xls_import_job_placement', 676, 681, '2020-02-05 00:00:00'),
(305, 'xls_import_oo_indicators12', 11, 12, '2020-02-05 00:00:00'),
(306, 'xls_import_oo_indicators34', 1, 2, '2020-02-05 00:00:00'),
(307, 'xls_import_pp', 27, 28, '2020-02-05 00:00:00'),
(308, 'xls_import_sme_support', 153, 154, '2020-02-05 00:00:00'),
(309, 'xls_import_tvet', 13, 14, '2020-02-05 00:00:00'),
(310, 'xls_import_smecompanies', 152, 153, '2020-02-05 00:00:00'),
(311, 'xls_import_tvet_training', 45, 46, '2020-02-05 00:00:00'),
(312, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(313, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(314, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(315, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(316, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(317, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(318, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(319, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(320, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(321, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(322, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(323, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(324, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(325, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(326, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(327, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(328, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(329, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(330, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(331, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(332, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(333, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(334, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(335, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(336, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(337, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(338, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(339, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(340, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(341, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(342, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(343, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(344, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(345, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(346, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(347, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(348, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(349, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(350, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(351, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(352, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(353, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(354, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(355, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(356, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(357, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(358, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(359, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(360, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(361, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(362, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(363, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(364, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(365, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(366, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(367, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-07 00:00:00'),
(368, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(369, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(370, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(371, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(372, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(373, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-07 00:00:00'),
(374, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(375, 'xls_import_job_placement', 676, 684, '2020-02-07 00:00:00'),
(376, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(377, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(378, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(379, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(380, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-07 00:00:00'),
(381, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(382, 'xls_import_job_placement', 676, 684, '2020-02-07 00:00:00'),
(383, 'xls_import_oo_indicators12', 10, 11, '2020-02-07 00:00:00'),
(384, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(385, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(386, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(387, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(388, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-07 00:00:00'),
(389, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(390, 'xls_import_job_placement', 676, 684, '2020-02-07 00:00:00'),
(391, 'xls_import_oo_indicators12', 10, 11, '2020-02-07 00:00:00'),
(392, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(393, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(394, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(395, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(396, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-07 00:00:00'),
(397, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(398, 'xls_import_job_placement', 676, 684, '2020-02-07 00:00:00'),
(399, 'xls_import_oo_indicators12', 10, 11, '2020-02-07 00:00:00'),
(400, 'xls_import_oo_indicators34', 5, 6, '2020-02-07 00:00:00'),
(401, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(402, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(403, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(404, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(405, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-07 00:00:00'),
(406, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(407, 'xls_import_job_placement', 676, 684, '2020-02-07 00:00:00'),
(408, 'xls_import_oo_indicators12', 10, 11, '2020-02-07 00:00:00'),
(409, 'xls_import_oo_indicators34', 5, 6, '2020-02-07 00:00:00'),
(410, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(411, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(412, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(413, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(414, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-07 00:00:00'),
(415, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(416, 'xls_import_job_placement', 676, 684, '2020-02-07 00:00:00'),
(417, 'xls_import_oo_indicators12', 10, 11, '2020-02-07 00:00:00'),
(418, 'xls_import_oo_indicators34', 5, 6, '2020-02-07 00:00:00'),
(419, 'xls_import_pp', 27, 28, '2020-02-07 00:00:00'),
(420, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(421, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(422, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(423, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(424, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-07 00:00:00'),
(425, 'xls_import_beneficiaries', 1592, 1593, '2020-02-07 00:00:00'),
(426, 'xls_import_job_placement', 676, 684, '2020-02-07 00:00:00'),
(427, 'xls_import_oo_indicators12', 10, 11, '2020-02-07 00:00:00'),
(428, 'xls_import_oo_indicators34', 5, 6, '2020-02-07 00:00:00'),
(429, 'xls_import_pp', 27, 28, '2020-02-07 00:00:00'),
(430, 'xls_import_sme_support', 160, 161, '2020-02-07 00:00:00'),
(431, 'xls_import_tvet', 8, 9, '2020-02-07 00:00:00'),
(432, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00'),
(433, 'xls_import_tvet_training', 46, 47, '2020-02-07 00:00:00'),
(434, 'xls_import_beneficiary_trainings', 1592, 1593, '2020-02-12 00:00:00'),
(435, 'xls_import_beneficiaries', 1593, 1594, '2020-02-12 00:00:00'),
(436, 'xls_import_job_placement', 1332, 1333, '2020-02-12 00:00:00'),
(437, 'xls_import_pp', 180, 181, '2020-02-12 00:00:00'),
(438, 'xls_import_sme_support', 149, 150, '2020-02-12 00:00:00'),
(439, 'xls_import_tvet', 6, 7, '2020-02-12 00:00:00'),
(440, 'xls_import_smecompanies', 201, 202, '2020-02-12 00:00:00'),
(441, 'xls_import_beneficiary_trainings', 1592, 1593, '2020-02-12 00:00:00'),
(442, 'xls_import_beneficiaries', 1593, 1594, '2020-02-12 00:00:00'),
(443, 'xls_import_job_placement', 1332, 1333, '2020-02-12 00:00:00'),
(444, 'xls_import_pp', 180, 181, '2020-02-12 00:00:00'),
(445, 'xls_import_sme_support', 149, 150, '2020-02-12 00:00:00'),
(446, 'xls_import_tvet', 6, 7, '2020-02-12 00:00:00'),
(447, 'xls_import_smecompanies', 201, 202, '2020-02-12 00:00:00'),
(448, 'xls_import_tvet_training', 44, 45, '2020-02-12 00:00:00'),
(449, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-12 00:00:00'),
(450, 'xls_import_beneficiaries', 1592, 1593, '2020-02-12 00:00:00'),
(451, 'xls_import_job_placement', 676, 684, '2020-02-12 00:00:00'),
(452, 'xls_import_oo_indicators12', 10, 11, '2020-02-12 00:00:00'),
(453, 'xls_import_oo_indicators34', 5, 6, '2020-02-12 00:00:00'),
(454, 'xls_import_pp', 27, 28, '2020-02-12 00:00:00'),
(455, 'xls_import_sme_support', 160, 161, '2020-02-12 00:00:00'),
(456, 'xls_import_tvet', 8, 9, '2020-02-12 00:00:00'),
(457, 'xls_import_tvet_training', 46, 47, '2020-02-12 00:00:00'),
(458, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-12 00:00:00'),
(459, 'xls_import_beneficiaries', 1592, 1593, '2020-02-12 00:00:00'),
(460, 'xls_import_job_placement', 676, 684, '2020-02-12 00:00:00'),
(461, 'xls_import_oo_indicators12', 10, 11, '2020-02-12 00:00:00'),
(462, 'xls_import_oo_indicators34', 5, 6, '2020-02-12 00:00:00'),
(463, 'xls_import_pp', 27, 28, '2020-02-12 00:00:00'),
(464, 'xls_import_sme_support', 160, 161, '2020-02-12 00:00:00'),
(465, 'xls_import_tvet', 8, 9, '2020-02-12 00:00:00'),
(466, 'xls_import_tvet_training', 46, 47, '2020-02-12 00:00:00'),
(467, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-12 00:00:00'),
(468, 'xls_import_beneficiaries', 1592, 1593, '2020-02-12 00:00:00'),
(469, 'xls_import_job_placement', 676, 684, '2020-02-12 00:00:00'),
(470, 'xls_import_oo_indicators12', 10, 11, '2020-02-12 00:00:00'),
(471, 'xls_import_oo_indicators34', 5, 6, '2020-02-12 00:00:00'),
(472, 'xls_import_pp', 27, 28, '2020-02-12 00:00:00'),
(473, 'xls_import_sme_support', 160, 161, '2020-02-12 00:00:00'),
(474, 'xls_import_tvet', 8, 9, '2020-02-12 00:00:00'),
(475, 'xls_import_tvet_training', 46, 47, '2020-02-12 00:00:00'),
(476, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-12 00:00:00'),
(477, 'xls_import_beneficiaries', 1592, 1593, '2020-02-12 00:00:00'),
(478, 'xls_import_job_placement', 676, 684, '2020-02-12 00:00:00'),
(479, 'xls_import_oo_indicators12', 10, 11, '2020-02-12 00:00:00'),
(480, 'xls_import_oo_indicators34', 5, 6, '2020-02-12 00:00:00'),
(481, 'xls_import_pp', 27, 28, '2020-02-12 00:00:00'),
(482, 'xls_import_sme_support', 160, 161, '2020-02-12 00:00:00'),
(483, 'xls_import_tvet', 8, 9, '2020-02-12 00:00:00'),
(484, 'xls_import_beneficiary_trainings', 1590, 1591, '2020-02-12 00:00:00'),
(485, 'xls_import_beneficiaries', 1592, 1593, '2020-02-12 00:00:00'),
(486, 'xls_import_job_placement', 676, 684, '2020-02-12 00:00:00'),
(487, 'xls_import_oo_indicators12', 10, 11, '2020-02-12 00:00:00'),
(488, 'xls_import_oo_indicators34', 5, 6, '2020-02-12 00:00:00'),
(489, 'xls_import_pp', 27, 28, '2020-02-12 00:00:00'),
(490, 'xls_import_sme_support', 160, 161, '2020-02-12 00:00:00'),
(491, 'xls_import_tvet', 8, 9, '2020-02-12 00:00:00'),
(492, 'xls_import_smecompanies', 153, 202, '2020-02-12 00:00:00'),
(493, 'xls_import_tvet_training', 46, 47, '2020-02-12 00:00:00'),
(494, 'xls_import_beneficiary_trainings', 1592, 1593, '2020-02-13 00:00:00'),
(495, 'xls_import_beneficiaries', 1592, 1593, '2020-02-13 00:00:00'),
(496, 'xls_import_job_placement', 1332, 1333, '2020-02-13 00:00:00'),
(497, 'xls_import_oo_indicators12', 3, 4, '2020-02-13 00:00:00'),
(498, 'xls_import_oo_indicators34', 1, 2, '2020-02-13 00:00:00'),
(499, 'xls_import_pp', 180, 181, '2020-02-13 00:00:00'),
(500, 'xls_import_sme_support', 149, 150, '2020-02-13 00:00:00'),
(501, 'xls_import_tvet', 6, 7, '2020-02-13 00:00:00'),
(502, 'xls_import_smecompanies', 201, 202, '2020-02-13 00:00:00'),
(503, 'xls_import_tvet_training', 44, 45, '2020-02-13 00:00:00'),
(504, 'xls_import_beneficiary_trainings', 1077, 1080, '2020-02-13 00:00:00'),
(505, 'xls_import_beneficiaries', 1745, 1746, '2020-02-13 00:00:00'),
(506, 'xls_import_job_placement', 1079, 1080, '2020-02-13 00:00:00'),
(507, 'xls_import_oo_indicators12', 2, 3, '2020-02-13 00:00:00'),
(508, 'xls_import_oo_indicators34', 2, 3, '2020-02-13 00:00:00'),
(509, 'xls_import_pp', 0, 1, '2020-02-13 00:00:00'),
(510, 'xls_import_sme_support', 0, 1, '2020-02-13 00:00:00'),
(511, 'xls_import_tvet', 5, 6, '2020-02-13 00:00:00'),
(512, 'xls_import_smecompanies', 34, 35, '2020-02-13 00:00:00'),
(513, 'xls_import_tvet_training', 25, 26, '2020-02-13 00:00:00'),
(514, 'xls_import_beneficiary_trainings', 1490, 1501, '2020-02-13 00:00:00'),
(515, 'xls_import_beneficiaries', 2109, 2110, '2020-02-13 00:00:00'),
(516, 'xls_import_job_placement', 993, 1031, '2020-02-13 00:00:00'),
(517, 'xls_import_oo_indicators12', 1, 2, '2020-02-13 00:00:00'),
(518, 'xls_import_oo_indicators34', 1, 2, '2020-02-13 00:00:00'),
(519, 'xls_import_pp', 32, 33, '2020-02-13 00:00:00'),
(520, 'xls_import_sme_support', 18, 19, '2020-02-13 00:00:00'),
(521, 'xls_import_tvet', 9, 10, '2020-02-13 00:00:00'),
(522, 'xls_import_smecompanies', 38, 39, '2020-02-13 00:00:00'),
(523, 'xls_import_tvet_training', 25, 26, '2020-02-13 00:00:00'),
(524, 'xls_import_beneficiary_trainings', 407, 411, '2020-02-13 00:00:00'),
(525, 'xls_import_beneficiaries', 934, 935, '2020-02-13 00:00:00'),
(526, 'xls_import_job_placement', 282, 313, '2020-02-13 00:00:00'),
(527, 'xls_import_oo_indicators12', 3, 4, '2020-02-13 00:00:00'),
(528, 'xls_import_oo_indicators34', 2, 3, '2020-02-13 00:00:00'),
(529, 'xls_import_pp', 4, 5, '2020-02-13 00:00:00'),
(530, 'xls_import_sme_support', 28, 29, '2020-02-13 00:00:00'),
(531, 'xls_import_tvet', 3, 4, '2020-02-13 00:00:00'),
(532, 'xls_import_smecompanies', 33, 34, '2020-02-13 00:00:00'),
(533, 'xls_import_tvet_training', 10, 11, '2020-02-13 00:00:00'),
(534, 'xls_import_beneficiary_trainings', 2253, 2264, '2020-02-13 00:00:00'),
(535, 'xls_import_beneficiaries', 2425, 2426, '2020-02-13 00:00:00'),
(536, 'xls_import_job_placement', 801, 804, '2020-02-13 00:00:00'),
(537, 'xls_import_oo_indicators12', 2, 3, '2020-02-13 00:00:00'),
(538, 'xls_import_oo_indicators34', 2, 3, '2020-02-13 00:00:00'),
(539, 'xls_import_pp', 65, 66, '2020-02-13 00:00:00'),
(540, 'xls_import_sme_support', 0, 1, '2020-02-13 00:00:00'),
(541, 'xls_import_tvet', 8, 9, '2020-02-13 00:00:00'),
(542, 'xls_import_smecompanies', 0, 1, '2020-02-13 00:00:00'),
(543, 'xls_import_tvet_training', 25, 26, '2020-02-13 00:00:00'),
(544, 'xls_import_beneficiary_trainings', 1535, 1593, '2020-02-17 00:00:00'),
(545, 'xls_import_beneficiaries', 1592, 1593, '2020-02-17 00:00:00'),
(546, 'xls_import_job_placement', 781, 1333, '2020-02-17 00:00:00'),
(547, 'xls_import_oo_indicators12', 3, 4, '2020-02-17 00:00:00'),
(548, 'xls_import_oo_indicators34', 1, 2, '2020-02-17 00:00:00'),
(549, 'xls_import_pp', 180, 181, '2020-02-17 00:00:00'),
(550, 'xls_import_sme_support', 149, 150, '2020-02-17 00:00:00'),
(551, 'xls_import_tvet', 6, 7, '2020-02-17 00:00:00'),
(552, 'xls_import_smecompanies', 201, 202, '2020-02-17 00:00:00'),
(553, 'xls_import_tvet_training', 44, 45, '2020-02-17 00:00:00'),
(554, 'xls_import_beneficiary_trainings', 1535, 1593, '2020-02-17 00:00:00'),
(555, 'xls_import_beneficiaries', 1592, 1593, '2020-02-17 00:00:00'),
(556, 'xls_import_job_placement', 781, 1333, '2020-02-17 00:00:00'),
(557, 'xls_import_oo_indicators12', 3, 4, '2020-02-17 00:00:00'),
(558, 'xls_import_oo_indicators34', 1, 2, '2020-02-17 00:00:00'),
(559, 'xls_import_pp', 180, 181, '2020-02-17 00:00:00'),
(560, 'xls_import_sme_support', 149, 150, '2020-02-17 00:00:00'),
(561, 'xls_import_tvet', 6, 7, '2020-02-17 00:00:00'),
(562, 'xls_import_smecompanies', 201, 202, '2020-02-17 00:00:00'),
(563, 'xls_import_tvet_training', 44, 45, '2020-02-17 00:00:00'),
(564, 'xls_import_beneficiary_trainings', 1535, 1593, '2020-02-17 00:00:00'),
(565, 'xls_import_beneficiaries', 1592, 1593, '2020-02-17 00:00:00'),
(566, 'xls_import_job_placement', 781, 1333, '2020-02-17 00:00:00'),
(567, 'xls_import_oo_indicators12', 3, 4, '2020-02-17 00:00:00'),
(568, 'xls_import_oo_indicators34', 1, 2, '2020-02-17 00:00:00'),
(569, 'xls_import_pp', 180, 181, '2020-02-17 00:00:00'),
(570, 'xls_import_sme_support', 149, 150, '2020-02-17 00:00:00'),
(571, 'xls_import_tvet', 6, 7, '2020-02-17 00:00:00'),
(572, 'xls_import_smecompanies', 201, 202, '2020-02-17 00:00:00'),
(573, 'xls_import_tvet_training', 44, 45, '2020-02-17 00:00:00'),
(574, 'xls_import_extra_indicators', 0, 2, '2020-02-17 00:00:00'),
(575, 'xls_import_beneficiary_trainings', 1535, 1593, '2020-02-17 00:00:00'),
(576, 'xls_import_beneficiaries', 1592, 1593, '2020-02-17 00:00:00'),
(577, 'xls_import_job_placement', 781, 1333, '2020-02-17 00:00:00'),
(578, 'xls_import_oo_indicators12', 3, 4, '2020-02-17 00:00:00'),
(579, 'xls_import_oo_indicators34', 1, 2, '2020-02-17 00:00:00'),
(580, 'xls_import_pp', 180, 181, '2020-02-17 00:00:00'),
(581, 'xls_import_sme_support', 149, 150, '2020-02-17 00:00:00'),
(582, 'xls_import_tvet', 6, 7, '2020-02-17 00:00:00'),
(583, 'xls_import_smecompanies', 201, 202, '2020-02-17 00:00:00'),
(584, 'xls_import_tvet_training', 44, 45, '2020-02-17 00:00:00'),
(585, 'xls_import_extra_indicators', 1, 2, '2020-02-17 00:00:00'),
(586, 'xls_import_beneficiary_trainings', 1535, 1593, '2020-02-17 00:00:00'),
(587, 'xls_import_beneficiaries', 1592, 1593, '2020-02-17 00:00:00'),
(588, 'xls_import_job_placement', 781, 1333, '2020-02-17 00:00:00'),
(589, 'xls_import_oo_indicators12', 3, 4, '2020-02-17 00:00:00'),
(590, 'xls_import_oo_indicators34', 1, 2, '2020-02-17 00:00:00'),
(591, 'xls_import_pp', 180, 181, '2020-02-17 00:00:00'),
(592, 'xls_import_sme_support', 149, 150, '2020-02-17 00:00:00'),
(593, 'xls_import_tvet', 6, 7, '2020-02-17 00:00:00'),
(594, 'xls_import_smecompanies', 201, 202, '2020-02-17 00:00:00'),
(595, 'xls_import_tvet_training', 44, 45, '2020-02-17 00:00:00'),
(596, 'xls_import_extra_indicators', 1, 2, '2020-02-17 00:00:00'),
(597, 'xls_import_beneficiary_trainings', 1535, 1593, '2020-02-17 00:00:00'),
(598, 'xls_import_beneficiaries', 1592, 1593, '2020-02-17 00:00:00'),
(599, 'xls_import_job_placement', 781, 1333, '2020-02-17 00:00:00'),
(600, 'xls_import_oo_indicators12', 3, 4, '2020-02-17 00:00:00'),
(601, 'xls_import_oo_indicators34', 1, 2, '2020-02-17 00:00:00'),
(602, 'xls_import_pp', 180, 181, '2020-02-17 00:00:00'),
(603, 'xls_import_sme_support', 149, 150, '2020-02-17 00:00:00'),
(604, 'xls_import_tvet', 6, 7, '2020-02-17 00:00:00'),
(605, 'xls_import_smecompanies', 201, 202, '2020-02-17 00:00:00'),
(606, 'xls_import_tvet_training', 44, 45, '2020-02-17 00:00:00'),
(607, 'xls_import_extra_indicators', 1, 2, '2020-02-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lots`
--

CREATE TABLE `lots` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `postdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lots`
--

INSERT INTO `lots` (`id`, `name`, `status`, `postdate`) VALUES
(1, 'Lot1', 1, '2020-01-27 07:39:46'),
(2, 'Lot2', 1, '2020-01-27 07:39:46'),
(3, 'Lot3', 1, '2020-01-27 07:39:58'),
(4, 'Lot4', 1, '2020-01-27 07:39:58'),
(5, 'Lot4', 1, '2020-01-27 07:40:21');

-- --------------------------------------------------------

--
-- Table structure for table `lots_master`
--

CREATE TABLE `lots_master` (
  `id` int(11) NOT NULL,
  `lots_name` varchar(25) NOT NULL,
  `lots_id` varchar(15) NOT NULL,
  `region` varchar(25) DEFAULT NULL,
  `percent` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `postdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lots_master`
--

INSERT INTO `lots_master` (`id`, `lots_name`, `lots_id`, `region`, `percent`, `status`, `postdate`) VALUES
(1, 'Lot1', 'Lot_1', 'Addis Ababa', 0, 1, '2020-01-11'),
(2, 'Lot2', 'Lot_2', 'Amhara ', 0, 1, '2020-01-12'),
(3, 'Lot3', 'Lot_3', 'Oromia', 0, 1, '2020-01-30'),
(4, 'Lot4', 'Lot_4', 'SNNP', 0, 1, '2020-01-30'),
(5, 'Lot5', 'Lot_5', 'Tigray', 0, 1, '2020-01-30');

-- --------------------------------------------------------

--
-- Table structure for table `quarter_master`
--

CREATE TABLE `quarter_master` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `range_from` varchar(2) NOT NULL,
  `range_to` varchar(2) NOT NULL,
  `range_year` varchar(7) DEFAULT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quarter_master`
--

INSERT INTO `quarter_master` (`id`, `name`, `range_from`, `range_to`, `range_year`, `status`) VALUES
(1, 'Q1', '01', '03', NULL, 1),
(2, 'Q2', '04', '06', NULL, 1),
(3, 'Q3', '07', '09', NULL, 1),
(4, 'Q4', '10', '12', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(10) NOT NULL,
  `username` varchar(50) DEFAULT '',
  `password` varchar(50) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `username`, `password`) VALUES
(1, 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tuser_type`
--

CREATE TABLE `tuser_type` (
  `id` int(11) NOT NULL,
  `urole` tinyint(1) NOT NULL COMMENT '1=admin,2=user,3=manager',
  `name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dstatus` tinyint(1) NOT NULL,
  `postdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tuser_type`
--

INSERT INTO `tuser_type` (`id`, `urole`, `name`, `status`, `dstatus`, `postdate`) VALUES
(1, 2, 'user', 1, 0, '2018-07-11 11:47:11'),
(3, 1, 'Admin', 1, 0, '2018-07-19 14:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `status` varchar(10) NOT NULL,
  `role` int(11) NOT NULL,
  `post_date` datetime NOT NULL,
  `ip_address` varchar(20) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `dstatus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `firstname`, `lastname`, `pass`, `gender`, `mobile_no`, `email`, `status`, `role`, `post_date`, `ip_address`, `lastlogin`, `dstatus`) VALUES
(33, 'Danish', 'Ansari', '202cb962ac59075b964b07152d234b70', 'male', '8299226971', 'danish.ali@dataman.in', '1', 1, '2020-01-21 00:00:00', NULL, NULL, 0),
(34, 'danish', 'danishansariaa', 'e6e061838856bf47e1de730719fb2609', 'male', '8564957155', 'mohddanish8564@gmail.com', '1', 1, '2020-01-21 00:00:00', NULL, NULL, 0),
(40, 'POP', 'danish', '202cb962ac59075b964b07152d234b70', 'male', '9044130123', 'danwebdeveloper8564@gmail.com', '1', 2, '2020-01-27 00:00:00', NULL, NULL, 0),
(41, 'test', 'me', '202cb962ac59075b964b07152d234b70', 'male', '777777777777', 'test@gmail.com', '1', 2, '2020-01-30 00:00:00', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `valuechain_master`
--

CREATE TABLE `valuechain_master` (
  `id` int(11) NOT NULL,
  `name` varchar(65) NOT NULL,
  `region` varchar(65) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `postdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `valuechain_master`
--

INSERT INTO `valuechain_master` (`id`, `name`, `region`, `status`, `postdate`) VALUES
(1, 'Agribusiness', '', 1, '2020-02-10 12:19:51'),
(2, 'Textile', '', 1, '2020-02-10 12:19:51'),
(3, 'Leather', '', 1, '2020-02-10 12:20:13'),
(4, 'Construction', '', 1, '2020-02-10 12:58:08'),
(5, 'Metal Works', '', 1, '2020-02-10 12:49:01');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_beneficiaries`
--

CREATE TABLE `xls_import_beneficiaries` (
  `beneficiary_id` bigint(20) NOT NULL,
  `sex` varchar(12) NOT NULL,
  `region` varchar(45) NOT NULL,
  `entry_date_to_since` date NOT NULL,
  `target_group` varchar(65) NOT NULL,
  `value_chain` varchar(45) NOT NULL,
  `entry_point_income` float NOT NULL,
  `endline_income` float NOT NULL,
  `type_of_income` varchar(20) NOT NULL,
  `disabled` varchar(15) NOT NULL,
  `Employed` tinyint(1) DEFAULT NULL,
  `consortium` varchar(30) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_beneficiaries`
--

INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(102499, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102500, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102501, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102502, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102503, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102504, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102505, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102506, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102507, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102508, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 2000, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102509, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102510, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102511, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102512, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102513, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102514, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102515, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102516, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102517, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102518, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102519, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Metal Works', 1000, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102520, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102521, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102522, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102523, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102524, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102525, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 4000, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102526, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102527, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102528, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102529, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102530, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102531, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102532, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102533, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102534, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102535, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102536, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102537, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102538, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102539, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Construction', 0, 0, 'Formal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102540, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 250, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102541, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102542, 'Female', 'Addis Ababa', '2018-08-31', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102543, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102544, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102545, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102546, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102547, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 200, 0, 'Informal', '1', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102548, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102549, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 750, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102550, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102551, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102552, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 300, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102553, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102554, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102555, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102556, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102557, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102558, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102559, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102560, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102561, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102562, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102563, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102564, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 550, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102565, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102566, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102567, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102568, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102569, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Formal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102570, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102571, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102572, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102573, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102574, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102575, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Formal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102576, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102577, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102578, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 200, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102579, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102580, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102581, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102582, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102583, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102584, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102585, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102586, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102587, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, '', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102588, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102589, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102590, 'Female', 'Addis Ababa', '2018-08-31', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102591, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102592, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102593, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102594, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102595, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102596, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102597, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102598, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102599, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102600, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102601, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102602, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102603, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102604, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102605, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102606, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102607, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102608, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102609, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102610, 'female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102611, 'female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102612, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102613, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102614, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102615, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102616, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Formal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102617, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102618, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102619, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102620, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102621, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102622, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102623, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'formal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102624, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102625, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102626, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102627, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102628, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102629, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102630, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102631, 'Male', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102632, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102633, 'Male', 'Addis Ababa', '2018-09-20', 'Returnee', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102634, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102635, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102636, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102637, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Formal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102638, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102639, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102640, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102641, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102642, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102643, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102644, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102645, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102646, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102647, 'Male', 'Addis Ababa', '1970-01-01', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102648, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102649, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102650, 'Female', 'Addis Ababa', '1970-01-01', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102651, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102652, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102653, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102654, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102655, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102656, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102657, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102658, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102659, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102660, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102661, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102662, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102663, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102664, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102665, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102666, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102667, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102668, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102669, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102670, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102671, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102672, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102673, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102674, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102675, 'Male', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102676, 'female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102677, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 200, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102678, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102679, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102680, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102681, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102682, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102683, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102684, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102685, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102686, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102687, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102688, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102689, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102690, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102691, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102692, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 650, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102693, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102694, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102695, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 1500, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102696, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102697, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102698, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102699, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102700, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 1, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102701, 'Female', 'Addis Ababa', '2018-08-31', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102702, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102703, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102704, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102705, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102706, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102707, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102708, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102709, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102710, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102711, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102712, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102713, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102714, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 760, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102715, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 800, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102716, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102717, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102718, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 850, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102719, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 670, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102720, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 600, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102721, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Construction', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102722, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 560, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102723, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102724, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 580, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102725, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 570, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102726, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 560, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102727, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102728, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102729, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102730, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102731, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 600, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102732, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102733, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102734, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 720, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102735, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102736, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102737, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102738, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 750, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102739, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102740, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Construction', 560, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102741, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 800, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102742, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102743, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 850, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102744, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102745, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102746, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102747, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 690, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102748, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Construction', 730, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102749, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 690, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102750, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102751, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102752, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 680, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102753, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 730, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102754, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 670, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102755, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 690, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102756, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 870, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102757, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 850, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102758, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 580, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102759, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102760, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102761, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 700, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102762, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 850, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102763, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102764, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102765, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102766, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 570, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102767, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 720, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102768, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 600, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102769, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 600, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102770, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(102771, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 560, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102772, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Construction', 720, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102773, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 680, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102774, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102775, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 600, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102776, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 560, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102777, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102778, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 850, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102779, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 760, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102780, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102781, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102782, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 850, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102783, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102784, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102785, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 500, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102786, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 850, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102787, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 670, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102788, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 690, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102789, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 740, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102790, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102791, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102792, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 900, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102793, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 680, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102794, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102795, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102796, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 870, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102797, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 750, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102798, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 850, 0, 'Informal', '1', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102799, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 600, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102800, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102801, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Construction', 560, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102802, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102803, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 680, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102804, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 870, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102805, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 570, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102806, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 750, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102807, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102808, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'Informal', '1', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102809, 'Male', 'Addis Ababa', '2018-09-24', 'Returnee', 'Construction', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102810, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102811, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102812, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 850, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102813, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102814, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 670, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102815, 'Male', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 730, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102816, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 680, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102817, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 870, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102818, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 730, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102819, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 850, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102820, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 570, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102821, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102822, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102823, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 690, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102824, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102825, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 580, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102826, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102827, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 740, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102828, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 600, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102829, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 850, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102830, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102831, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102832, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102833, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102834, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102835, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 600, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102836, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102837, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102838, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 870, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102839, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102840, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102841, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 720, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102842, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 740, 0, 'Informal', '1', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102843, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102844, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 750, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102845, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 650, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102846, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102847, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 650, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102848, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 560, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102849, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 750, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102850, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102851, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 580, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102852, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 690, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102853, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 600, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102854, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102855, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 570, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102856, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Metal Works', 720, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102857, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 740, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102858, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Construction', 750, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102859, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 670, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102860, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 730, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102861, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102862, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 700, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102863, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 800, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102864, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Construction', 580, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102865, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 670, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102866, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 720, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102867, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102868, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102869, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102870, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 650, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102871, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 870, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102872, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102873, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102874, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 560, 0, 'Informal', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102875, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 740, 0, 'Informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102876, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102877, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 2300, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102878, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102879, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102880, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 950, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102881, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102882, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102883, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102884, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 2300, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102885, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102886, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102887, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 2300, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102888, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102889, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102890, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102891, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102892, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 2300, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102893, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102894, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102895, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102896, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102897, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102898, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102899, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102900, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102901, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 2300, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102902, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102903, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102904, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102905, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102906, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102907, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102908, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102909, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102910, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 950, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102911, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102912, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102913, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102914, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102915, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102916, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102917, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102918, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102919, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102920, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102921, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102922, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102923, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 2300, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102924, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102925, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102926, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '1', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102927, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102928, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102929, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102930, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102931, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102932, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102933, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102934, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102935, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 2300, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102936, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102937, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 950, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102938, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102939, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102940, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102941, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102942, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102943, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102944, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102945, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102946, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102947, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 950, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102948, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102949, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102950, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102951, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102952, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102953, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102954, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102955, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102956, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102957, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 950, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102958, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102959, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102960, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102961, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102962, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102963, 'Male', 'Addis Ababa', '2018-09-04', 'Returnee', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102964, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102965, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102966, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102967, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102968, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102969, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 2300, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102970, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102971, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102972, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102973, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 2300, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102974, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102975, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102976, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 950, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102977, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102978, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102979, 'Female', 'Addis Ababa', '2018-09-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102980, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102981, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 950, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102982, 'Female', 'Addis Ababa', '2018-09-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102983, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1100, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102984, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102985, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 2300, 0, 'Informal', '', 1, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102986, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102987, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102988, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 950, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102989, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102990, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 2200, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102991, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102992, 'Female', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102993, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 950, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102994, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_CHADET_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102996, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102997, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102998, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102999, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103000, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103001, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103002, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '1', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103003, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103004, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103005, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103006, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103007, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103008, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103009, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103010, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103011, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 960, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103012, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103013, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103014, 'male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103015, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103016, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 10000, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103017, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103018, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103019, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103020, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '1', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103021, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103022, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '1', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103023, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103024, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103025, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 700, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103026, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 400, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103027, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103028, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 900, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103029, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103030, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '1', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103031, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103032, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 1000, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103033, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103034, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103035, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103036, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103037, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103038, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103039, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103040, 'male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103041, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 400, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(103042, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103043, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103044, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103045, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103046, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103047, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103048, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103049, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103050, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103051, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103052, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 500, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103053, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103054, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103055, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103056, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103057, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103058, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 200, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103059, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103060, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 960, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103061, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103062, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103063, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 6000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103064, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103065, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103066, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103067, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103068, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103069, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, '', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103070, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103071, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103072, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103073, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103074, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103075, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103076, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103077, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103078, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103079, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103080, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 500, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103081, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103082, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103083, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 960, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103084, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103085, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103086, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103087, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103088, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103089, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103090, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103091, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103092, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103093, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103094, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103095, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103096, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'informal', '1', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103097, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103098, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103099, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103100, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103101, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 700, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103102, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103103, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103104, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103105, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103106, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 200, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103107, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103108, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103109, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103110, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103111, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103112, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103113, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103114, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103115, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103116, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103117, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103118, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103119, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103120, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103121, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103122, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103123, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 960, 0, 'informal', '1', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103124, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103125, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103126, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103127, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103128, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103129, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103130, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103131, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103132, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103133, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103134, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103135, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103136, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '1', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103137, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103138, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103139, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103140, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103141, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103142, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103143, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 1100, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103144, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103145, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103146, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103147, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 2500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103148, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103149, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103150, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103151, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103152, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103153, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103154, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103155, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103156, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103157, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103158, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103159, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103160, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103161, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103162, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103163, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 1000, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103164, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103165, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103166, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103167, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103168, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103169, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103170, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103171, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103172, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103173, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103174, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103175, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103176, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103177, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103178, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103179, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103180, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103181, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103182, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103183, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103184, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 3000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103185, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103186, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103187, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 300, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103188, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103189, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103190, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103191, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103192, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103193, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103194, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 960, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103195, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103196, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103197, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103198, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103199, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103200, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103201, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103202, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 931743000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103203, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103204, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103205, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 300, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103206, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 700, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103207, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103208, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103209, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103210, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 3000, 0, 'informal', '1', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103211, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103212, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103213, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103214, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103215, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 3500, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103216, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103217, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103218, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103219, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103220, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103221, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103222, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103223, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103224, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103225, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 2000, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103226, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 300, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103227, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103228, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103229, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103230, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103231, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103232, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103233, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103234, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 900, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103235, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 2500, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103236, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103237, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103238, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103239, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103240, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103241, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103242, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103243, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103244, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103245, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103246, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103247, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 1, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103248, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103249, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103250, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103251, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103252, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103253, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103254, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103255, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Formal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103256, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103257, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103258, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 200, 0, 'informal', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103259, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103260, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 500, 0, '', '', 0, 'Lot_1_CWW_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743039, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743040, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743041, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'formal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743042, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743043, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743044, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743045, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743046, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743047, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743048, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743049, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743050, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743051, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743052, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743053, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743054, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743055, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743056, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743057, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743058, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743059, 'Female', 'Addis Ababa', '2018-07-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743060, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743061, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743062, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743063, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743064, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743065, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 500, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743066, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743067, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743068, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743069, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743070, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743071, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743072, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743073, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743074, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743075, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743076, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743077, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743078, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743079, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743080, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743081, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743082, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743083, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743084, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743085, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743086, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743087, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743088, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, '', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743089, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743090, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743091, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743092, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743093, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743094, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743095, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743096, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743097, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743098, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(931743099, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743100, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743101, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743102, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743103, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743104, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743105, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743106, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743107, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743108, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743109, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743110, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743111, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743112, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743113, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '1', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743114, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743115, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743116, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743117, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743118, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743119, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743120, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743121, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743122, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743123, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743124, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743125, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743126, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743127, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743128, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743129, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743130, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743131, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743132, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743133, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743134, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743135, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743136, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743137, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743138, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743139, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743140, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743141, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743142, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743143, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743144, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743145, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743146, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743147, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743148, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743149, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743150, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743151, 'Male', 'Addis Ababa', '2019-03-02', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743152, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743153, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743154, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743155, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743156, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743157, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743158, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743159, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743160, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743161, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743162, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743163, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743164, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743165, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743166, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743167, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743168, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743169, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743170, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743171, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743172, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743173, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743174, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743175, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743176, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743177, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743178, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743179, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743180, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743181, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743182, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743183, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743184, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743185, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743186, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743187, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743188, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743189, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743190, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743191, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743192, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743193, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743194, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743195, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743196, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743197, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743198, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743199, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743200, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743201, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743202, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743203, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743204, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743205, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743206, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743207, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743208, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743209, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743210, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743211, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743212, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743213, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743214, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743215, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743216, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743217, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743218, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743219, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743220, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743221, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743222, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743223, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743224, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743225, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743226, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743227, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743228, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743229, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743230, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743231, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743232, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743233, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743234, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743235, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743236, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743237, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743238, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743239, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743240, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743241, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743242, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743243, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743244, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743245, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743246, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743247, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743248, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743249, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743250, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743251, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743252, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743253, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743254, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743255, 'Female', 'Addis Ababa', '2019-04-01', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743256, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743257, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743258, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743259, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743260, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743261, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743262, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743263, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743264, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743265, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743266, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743267, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743268, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743269, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743270, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743271, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743272, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743273, 'Male', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743274, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743275, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743276, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743277, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743278, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743279, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743280, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743281, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743282, 'Male', 'Addis Ababa', '2019-03-02', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743283, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743284, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743285, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743286, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743287, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743288, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743289, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743290, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743291, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743292, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743293, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743294, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743295, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743296, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743297, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743298, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743299, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743300, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743301, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743302, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743303, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743304, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743305, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, '', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743306, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743307, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743308, 'Female', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743309, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743310, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743311, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743312, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743313, 'Male', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743314, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743315, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743316, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743317, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743318, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743319, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743320, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743321, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743322, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743323, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743324, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743325, 'Male', 'Addis Ababa', '2019-03-02', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743326, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743327, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743328, 'Male', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743329, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743330, 'Female', 'Addis Ababa', '2018-07-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743331, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743332, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743333, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743334, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743335, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743336, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743337, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743338, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_VIS_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743339, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743340, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743341, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743342, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743343, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743344, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743345, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743346, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743347, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743348, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743349, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743350, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743351, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743352, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743353, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 300, 0, 'Informal', '1', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743354, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743355, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743356, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743357, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743358, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743359, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743360, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743361, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743362, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743363, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743364, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743365, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743366, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743367, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743368, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743369, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743370, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743371, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743372, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743373, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(931743374, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743375, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743376, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743377, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743378, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743379, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743380, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743381, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743382, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743383, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743384, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743385, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743386, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743387, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743388, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743389, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743390, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743391, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743392, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743393, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743394, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743395, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743396, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743397, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743398, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743399, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743400, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743401, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743402, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743403, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743404, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743405, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 400, 0, 'Informal', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743406, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743407, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743408, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743409, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743410, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743411, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743412, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743413, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '1', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743414, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743415, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743416, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743417, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743418, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743419, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743420, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743421, 'Female', 'Addis Ababa', '2019-03-04', 'returnee', 'Leather', 900, 0, 'Formal', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743422, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743423, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743424, 'Female', 'Addis Ababa', '2019-03-04', 'returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743425, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743426, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743427, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743428, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 300, 0, 'Informal', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743429, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743430, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743431, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743432, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743433, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743434, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743435, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', 0, 'Lot_1_CHADET_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743436, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743437, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743438, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743439, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743440, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1250, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743441, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1680, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743442, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 2100, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743443, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 2300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743444, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36 (Potential Migrant)', 'Leather', 850, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743445, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1350, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743446, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743447, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1500, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743448, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743449, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2450, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743450, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743451, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1750, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743452, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743453, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743454, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743455, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743456, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743457, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1600, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743458, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1400, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743459, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743460, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743461, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743462, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743463, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743464, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743465, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743466, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743467, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743468, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743469, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743470, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743471, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743472, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743473, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743474, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1450, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743475, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1600, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743476, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743477, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743478, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743479, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1450, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743480, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743481, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1600, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743482, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1600, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743483, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1350, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743484, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1500, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743485, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743486, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743487, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1350, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743488, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743489, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1600, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743490, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743491, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743492, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743493, 'Female', 'Addis Ababa', '2019-03-28', 'Women beyond 36 (Potential Migrant)', 'Leather', 1400, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743494, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743495, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2100, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743496, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743497, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1600, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743498, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743499, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743500, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1800, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743501, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 2100, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743502, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743503, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743504, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743505, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743506, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743507, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743508, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743509, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1450, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743510, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1600, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743511, 'Female', 'Addis Ababa', '2019-03-28', 'Women beyond 36 (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743512, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1600, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743513, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743514, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 2000, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743515, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743516, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 2700, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743517, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743518, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743519, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743520, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743521, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743522, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1850, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743523, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743524, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743525, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743526, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743527, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743528, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36 (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743529, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36 (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743530, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 2100, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743531, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743532, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743533, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743534, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743535, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743536, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1900, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743537, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743538, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 2300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743539, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743540, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743541, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743542, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2100, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743543, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743544, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743545, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2800, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743546, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1450, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743547, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 2300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743548, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743549, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 4500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743550, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 2500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743551, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743552, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1600, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743553, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743554, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743555, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743556, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743557, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36 (Potential Migrant)', 'Leather', 2000, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743558, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743559, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743560, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743561, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743562, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1350, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743563, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743564, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1550, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743565, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 2000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743566, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743567, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36 (Potential Migrant)', 'Leather', 1500, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743568, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743569, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 2100, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743570, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743571, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743572, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1900, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743573, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743574, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743575, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743576, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1300, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743577, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1500, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743578, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743579, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743580, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743581, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743582, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743583, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1450, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743584, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1800, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743585, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1900, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743586, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1600, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743587, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743588, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 2300, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743589, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36 (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743590, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743591, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 2000, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743592, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2100, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743593, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743594, 'Female', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743595, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743596, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743597, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1900, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743598, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743599, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743600, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743601, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743602, 'Male', 'Addis Ababa', '2018-09-24', 'Women beyond 36 (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743603, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1600, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743604, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743605, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743606, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36 (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743607, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743608, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743609, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743610, 'Female', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743611, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'Informal', '', 0, 'Lot_1_PIN_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743613, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743614, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743615, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743616, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743617, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743618, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 1100, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743619, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743620, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743621, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 960, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743622, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Metal Works', 900, 0, 'Formal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743623, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 400, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743624, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743625, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743626, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743627, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743628, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743629, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743630, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743631, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 600, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743632, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743633, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743634, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743635, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743636, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743637, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743638, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743639, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743640, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 200, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743641, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(931743642, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743643, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743644, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743645, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743646, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743647, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743648, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743649, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743650, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743651, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743652, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743653, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743654, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743655, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743656, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743657, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743658, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743659, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743660, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743661, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743662, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743663, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743664, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743665, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743666, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743667, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743668, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743669, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743670, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743671, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743672, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743673, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743674, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743675, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743676, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743677, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743678, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743679, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743680, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743681, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743682, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743683, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743684, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743685, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743686, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743687, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743688, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743689, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743690, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743691, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743692, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743693, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743694, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743695, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743696, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743697, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743698, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743699, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743700, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743701, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743702, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743703, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743704, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743705, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743706, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743707, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743708, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743709, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743710, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743711, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743712, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743713, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743714, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743715, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743716, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743717, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743718, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743719, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743720, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743721, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743722, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743723, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743724, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743725, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743726, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743727, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743728, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743729, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743730, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743731, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 200, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743732, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743733, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743734, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743735, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743736, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743737, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743738, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743739, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743740, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743741, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743742, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743743, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743744, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743745, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743746, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743747, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743748, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743749, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743750, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743751, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743752, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743753, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743754, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743755, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743756, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743757, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743758, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743759, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743760, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743761, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743762, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743763, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743764, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743765, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743766, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743767, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743768, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743769, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743770, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743771, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743772, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743773, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743774, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743775, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743776, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743777, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743778, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743779, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743780, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743781, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743782, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743783, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743784, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743785, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743786, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743787, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743788, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743789, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743790, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743791, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743792, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743793, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743794, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743795, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 400, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743796, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 200, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743797, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743798, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743799, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743800, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743801, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743802, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743803, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743804, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743805, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743806, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743807, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743808, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743809, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743810, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743811, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743812, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743813, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743814, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743815, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743816, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743817, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 1500, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743818, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743819, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743820, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743821, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743822, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743823, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743824, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743825, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743826, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743827, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743828, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743829, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743830, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743831, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743832, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743833, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743834, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743835, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743836, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743837, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743838, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743839, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743840, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743841, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743842, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743843, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743844, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743845, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743846, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743847, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743848, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743849, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743850, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743851, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743852, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743853, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743854, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743855, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743856, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743857, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743858, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743859, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743860, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743861, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743862, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743863, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743864, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743865, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743866, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', 0, 'Lot_1_CWW_2nd_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743868, 'FEMALE', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 1200, 0, 'Informal Income', '', 1, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743869, 'FEMALE', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743870, 'FEMALE', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743871, 'MALE', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', 0, 'Lot_1_PIN_1st_batch', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_beneficiaries_bkp`
--

CREATE TABLE `xls_import_beneficiaries_bkp` (
  `beneficiary_id` bigint(20) NOT NULL,
  `sex` varchar(12) NOT NULL,
  `region` varchar(45) NOT NULL,
  `entry_date_to_since` date NOT NULL,
  `target_group` varchar(65) NOT NULL,
  `value_chain` varchar(45) NOT NULL,
  `entry_point_income` float NOT NULL,
  `endline_income` float NOT NULL,
  `type_of_income` varchar(20) NOT NULL,
  `disabled` varchar(15) NOT NULL,
  `Employed` varchar(15) DEFAULT NULL,
  `consortium` varchar(30) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_beneficiary_trainings`
--

CREATE TABLE `xls_import_beneficiary_trainings` (
  `beneficiary_id` bigint(20) NOT NULL,
  `tvet_id` int(7) NOT NULL,
  `training_module` varchar(65) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `Certificate` varchar(65) DEFAULT NULL,
  `Is_Training_completed` tinyint(1) NOT NULL,
  `Region` varchar(65) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_beneficiary_trainings`
--

INSERT INTO `xls_import_beneficiary_trainings` (`beneficiary_id`, `tvet_id`, `training_module`, `start_date`, `end_date`, `Certificate`, `Is_Training_completed`, `Region`, `status`, `postdate`, `file_name`) VALUES
(0, 0, '', '1970-01-01', '1970-01-01', '', 0, '', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102499, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102500, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102501, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102502, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102503, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102504, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102505, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102506, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102507, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102508, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102509, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102510, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102511, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102512, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102513, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102514, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102515, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102516, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102517, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102518, 100000, 'leather Garment-1-VIS', '2018-11-12', '2018-03-13', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102519, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102520, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102521, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102522, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102523, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102524, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102525, 100001, 'Leather Goods-1-VIS', '2018-11-12', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102526, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102527, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102528, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102529, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102530, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102531, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102532, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102533, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102534, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102535, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102536, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102537, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102538, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102539, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102540, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102541, 100001, 'Footwear -1-VIS', '2018-11-12', '2018-03-08', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102542, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102543, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102544, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102545, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102546, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102547, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102548, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102549, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102550, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102551, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102552, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102553, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102554, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102555, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102556, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102557, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102558, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102559, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102560, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102561, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102562, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102563, 100001, 'Footwear -1-VIS', '2018-11-12', '2018-03-08', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102564, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102565, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102566, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102567, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102568, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102569, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102570, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102571, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102572, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102573, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102574, 100001, 'Footwear -1-VIS', '2018-11-12', '2018-03-08', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102575, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102576, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102577, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102578, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102579, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102580, 100001, 'Leather Goods-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102581, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102582, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102583, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102584, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102585, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102586, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102587, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102588, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102589, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102590, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102591, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102592, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102593, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102594, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102595, 100001, 'Footwear -1-VIS', '2018-11-12', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102596, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102597, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102598, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102599, 100001, 'Leather Goods-1-VIS', '2018-11-12', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102600, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102601, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102602, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102603, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102604, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102605, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102606, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102607, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102608, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102609, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102610, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102611, 100001, 'Footwear -1-VIS', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102612, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102613, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102614, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102615, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102616, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102617, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102618, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102619, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102620, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102621, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102622, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102623, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102624, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102625, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102626, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102627, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102628, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102629, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102630, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102631, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102632, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102633, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102634, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102635, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102636, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102637, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102638, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102639, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102640, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102641, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102642, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102643, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102644, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102645, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102646, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102647, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102648, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102649, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102650, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102651, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102652, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102653, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102654, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102655, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102656, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102657, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102658, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102659, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102660, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102661, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102662, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102663, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102664, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102665, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102666, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102667, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102668, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102669, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102670, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102671, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102672, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102673, 100000, 'leather Garment-1-VIS', '2018-11-26', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102674, 100001, 'Footwear -1-VIS', '2018-11-12', '2019-02-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102675, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102676, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102677, 100000, 'leather Garment-1-VIS', '2018-11-26', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102678, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102679, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102680, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102681, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102682, 100000, 'leather Garment-1-VIS', '2018-11-12', '2018-03-13', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102683, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102684, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102685, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102686, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102687, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102688, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102689, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102690, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102691, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-09', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102692, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102693, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102694, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102695, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102696, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102697, 100000, 'Finishing  construction on plastering  gypsum and painting-1-VIS', '2018-11-12', '2019-02-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102698, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102699, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102700, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102701, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102702, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102703, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102704, 100001, 'Leather Goods-1-VIS', '2018-11-26', '2019-02-23', '', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102705, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102706, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102707, 100000, 'Metal Manufacturing-1-VIS', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102708, 100000, 'Installation   construction on electric and sanitery-1-vis', '2018-11-12', '2019-02-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102709, 100000, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102710, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102711, 100000, 'leather Garment-1-VIS', '2018-11-12', '2019-03-13', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102712, 100001, 'Footwear -1-VIS', '2018-11-26', '2019-02-23', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102713, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102714, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102715, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102716, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102717, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102718, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102719, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102720, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102721, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102722, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102723, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102724, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102725, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102726, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102727, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102728, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102729, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102730, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102731, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102732, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102733, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102734, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102735, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102736, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102737, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102738, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102739, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102740, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102741, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102742, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102743, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102744, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102745, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102746, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102747, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102748, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102749, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102750, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102751, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102752, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102753, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102754, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102755, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102756, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102757, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102758, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102759, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102760, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102761, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102762, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102763, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102764, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102765, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102766, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102767, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102768, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102769, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102770, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102771, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102772, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102773, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102774, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102775, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102776, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102777, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102778, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102779, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102780, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102781, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102782, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102783, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102784, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102785, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102786, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102787, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102788, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102789, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102790, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102791, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102792, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102793, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102794, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102795, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_beneficiary_trainings` (`beneficiary_id`, `tvet_id`, `training_module`, `start_date`, `end_date`, `Certificate`, `Is_Training_completed`, `Region`, `status`, `postdate`, `file_name`) VALUES
(102796, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102797, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102798, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102799, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102800, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102801, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102802, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102803, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102804, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102805, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102806, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102807, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102808, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102809, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102810, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102811, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102812, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102813, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102814, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102815, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102816, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102817, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102818, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102819, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102820, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102821, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102822, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102823, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102824, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102825, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102826, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102827, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102828, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102829, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102830, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102831, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102832, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102833, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102834, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102835, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102836, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102837, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102838, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102839, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102840, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102841, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102842, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102843, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102844, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102845, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102846, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102847, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102848, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102849, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102850, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102851, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102852, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102853, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102854, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102855, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102856, 100002, 'Metal Manufacturing-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102857, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102858, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102859, 100001, 'Finishing  construction on plastering  gypsum and painting-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102860, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102861, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102862, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102863, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102864, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102865, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102866, 100002, 'BCW  on concreting barbending and carpentry-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102867, 100002, 'leather Garment-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102868, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102869, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102870, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102871, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102872, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102873, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102874, 100002, 'Footwear-1-PIN', '2018-11-02', '2019-02-01', 'Not yet certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102875, 100002, 'Installation   construction on electric and sanitery-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102876, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102877, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102878, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102879, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102880, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102881, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102882, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102883, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102884, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102885, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102886, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102887, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102888, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102889, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102890, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102891, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102892, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102893, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102894, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102895, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102896, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102897, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102898, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102899, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102900, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102901, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102902, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102903, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102904, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102905, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102906, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102907, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102908, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102909, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102910, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102911, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102912, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102913, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102914, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102915, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102916, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102917, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102918, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102919, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102920, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102921, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102922, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102923, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102924, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102925, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102926, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102927, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102928, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102929, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102930, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102931, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102932, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102933, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102934, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102935, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102936, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102937, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102938, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102939, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102940, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102941, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102942, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102943, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102944, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102945, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102946, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102947, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102948, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102949, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102950, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102951, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102952, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102953, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102954, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102955, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102956, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102957, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102958, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102959, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102960, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102961, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102962, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102963, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102964, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102965, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102966, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102967, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102968, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102969, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102970, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102971, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102972, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102973, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102974, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102975, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102976, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102977, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102978, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102979, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102980, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102981, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102982, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102983, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102984, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102985, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102986, 100001, 'Leather Goods-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102987, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102988, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102989, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102990, 100001, 'Finishing  construction on plastering  gypsum and painting-1-chad', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102991, 100001, 'Installation   construction on electric and sanitery-1-chadet', '2018-11-12', '2019-03-12', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102992, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102993, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102994, 100001, 'Footwear-1-Chadet', '2018-11-12', '2019-03-12', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102996, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102997, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102998, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(102999, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103000, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103001, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103002, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103003, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103004, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103005, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103006, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103007, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103008, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103009, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103010, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103011, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103012, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103013, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103014, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103015, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103016, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103017, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103018, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103019, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103020, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103021, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103022, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103023, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103024, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103025, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103026, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103027, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103028, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103029, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103030, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103031, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103032, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103033, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103034, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103035, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103036, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103037, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103038, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103039, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103040, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103041, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103042, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103043, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103044, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103045, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103046, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103047, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103048, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103049, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103050, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103051, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103052, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103053, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103054, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103055, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103056, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103057, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103058, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103059, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103060, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103061, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103062, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103063, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103064, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103065, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103066, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103067, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103068, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103069, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103070, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103071, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103072, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103073, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103074, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103075, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103076, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103077, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103078, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103079, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103080, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103081, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103082, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103083, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103084, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103085, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103086, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103087, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103088, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103089, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103090, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103091, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103092, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103093, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103094, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103095, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103096, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103097, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103098, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103099, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103100, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103101, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_beneficiary_trainings` (`beneficiary_id`, `tvet_id`, `training_module`, `start_date`, `end_date`, `Certificate`, `Is_Training_completed`, `Region`, `status`, `postdate`, `file_name`) VALUES
(103102, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103103, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103104, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103105, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103106, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103107, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103108, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103109, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103110, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103111, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103112, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103113, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103114, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103115, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103116, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103117, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103118, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103119, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103120, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103121, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103122, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103123, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103124, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103125, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103126, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103127, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103128, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103129, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103130, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103131, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103132, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103133, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103134, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103135, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103136, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103137, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103138, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103139, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103140, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103141, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103142, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103143, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103144, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103145, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103146, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103147, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103148, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103149, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103150, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103151, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103152, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103153, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103154, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103155, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103156, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103157, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103158, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103159, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103160, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103161, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103162, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103163, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103164, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103165, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103166, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103167, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103168, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103169, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103170, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103171, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103172, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103173, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103174, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103175, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103176, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103177, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103178, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103179, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103180, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103181, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103182, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103183, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103184, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103185, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103186, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103187, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103188, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103189, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103190, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103191, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103192, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103193, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103194, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103195, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103196, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103197, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103198, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103199, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103200, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103201, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103202, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103203, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103204, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103205, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103206, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103207, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103208, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103209, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103210, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103211, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103212, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103213, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103214, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103215, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103216, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103217, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103218, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103219, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103220, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103221, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103222, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103223, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103224, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103225, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103226, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103227, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103228, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103229, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103230, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103231, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103232, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103233, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103234, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103235, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103236, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103237, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103238, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103239, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103240, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103241, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103242, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103243, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103244, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103245, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103246, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103247, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103248, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103249, 100001, 'Finishing  construction on plastering  gypsum and painting-1-conc', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103250, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103251, 100001, 'Installation   construction on electric and sanitery-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103252, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103253, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103254, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103255, 100001, 'finishing construction on plastering tilling and cement screerd-1', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103256, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103257, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103258, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103259, 100001, 'Leather Goods-1-concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(103260, 100001, 'Footwear-1-Concern', '2018-11-12', '2019-02-10', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743039, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-06-10', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743040, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743041, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743042, 100000, 'Metal Manufacturing-2-VIS', '2019-06-10', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743043, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743044, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743045, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743046, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743047, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743048, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743049, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743053, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743054, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743055, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743056, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743057, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743060, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743061, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743062, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743063, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743064, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743065, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743066, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743067, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743068, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743069, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743070, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743072, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743073, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743074, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743075, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743076, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743077, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743079, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743080, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743081, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743082, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743083, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743085, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743087, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743088, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743089, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743090, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743091, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743092, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743094, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743095, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743096, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743097, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743098, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743099, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743101, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743102, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743103, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743105, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743106, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743107, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743108, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743109, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743110, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743111, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743113, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743114, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743115, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743116, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743117, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743118, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743120, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743121, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743122, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743123, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743124, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743125, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743126, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743127, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743128, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743129, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743131, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743132, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743133, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743134, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743136, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743137, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743138, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743139, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743140, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743141, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743142, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743143, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743145, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743146, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743147, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743148, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743149, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743150, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743151, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743152, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743153, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743154, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743155, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743156, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743157, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743159, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743162, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743163, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743164, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743165, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743166, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743168, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743169, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743170, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743172, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743173, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743174, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743175, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743176, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743177, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743178, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743180, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743182, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743186, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743187, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743188, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743189, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743190, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743191, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743193, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743194, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743195, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743196, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743197, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743198, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743199, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743200, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743201, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743203, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743204, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743205, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743206, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743207, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743208, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743209, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_beneficiary_trainings` (`beneficiary_id`, `tvet_id`, `training_module`, `start_date`, `end_date`, `Certificate`, `Is_Training_completed`, `Region`, `status`, `postdate`, `file_name`) VALUES
(931743210, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743212, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743213, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743214, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743215, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743216, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743217, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743218, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743219, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743220, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743221, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743222, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743224, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743225, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743226, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743228, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743229, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743231, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743233, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743234, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743235, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743236, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743237, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743241, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743242, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743244, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743245, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743246, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743247, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743249, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743250, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743253, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743254, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743256, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743257, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743258, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743259, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743260, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743261, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743262, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743264, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743265, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743267, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743268, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743269, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743270, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743271, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743272, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743273, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743275, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743276, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743277, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743278, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743279, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743283, 100000, 'Metal Manufacturing-2-VIS', '2019-06-10', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743284, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743285, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743286, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743287, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743288, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743289, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743290, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743291, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743293, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743294, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743296, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743298, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743299, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743300, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743301, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743302, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743303, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743305, 100000, 'Metal Manufacturing-2-VIS', '2019-06-10', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743306, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743307, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743308, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743309, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743310, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743311, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743314, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743315, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743316, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743317, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743318, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743321, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743322, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743323, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743324, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743325, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743326, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743328, 100000, 'Installation   construction on electric and sanitery-2-vis', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743330, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743331, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743332, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743333, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743334, 100000, 'leather Garment-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743335, 100000, 'Footwear -2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743336, 100000, 'Metal Manufacturing-2-VIS', '2019-07-08', '2019-09-09', 'Not Yet Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743337, 100000, 'Finishing  construction on plastering  gypsum and painting-2-VIS', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743338, 100000, 'finishing construction on plastering tilling and cement screerd-2', '2019-07-08', '2019-09-09', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743339, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743340, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743341, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743342, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743343, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743344, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743345, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743346, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743347, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743348, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743349, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743350, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743351, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743352, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743353, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743354, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743355, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743356, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743357, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743358, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743359, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743360, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743361, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743362, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743363, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743364, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743365, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743366, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743367, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743368, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743369, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743370, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743371, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743372, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743373, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743374, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743375, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743376, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743377, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743378, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743379, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743380, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743381, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743382, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743383, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743384, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743385, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743386, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743387, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743388, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743389, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743390, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743391, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743392, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743393, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743394, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743395, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743396, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743397, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743398, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743399, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743400, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743401, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743402, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743403, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743404, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743405, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743406, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743407, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743408, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743409, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743410, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743411, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743412, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743413, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743414, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'Not Yet Certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743415, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743416, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743417, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743418, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'None', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743419, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743420, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743421, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743422, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743423, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743424, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743425, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743426, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743427, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743428, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743429, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743430, 100009, 'Leather Goods-2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743431, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743432, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743433, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743434, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743435, 100009, 'Footwear -2-chadet', '2019-04-09', '2019-08-16', 'COC Certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743436, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743437, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743438, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743439, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743440, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743441, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743442, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743443, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743444, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743445, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743446, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743447, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743448, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743449, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743450, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743451, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743452, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743453, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743454, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743455, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-06-16', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743456, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743457, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743458, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743459, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743460, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743461, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743462, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743463, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743464, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743465, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743466, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-06-20', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743467, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743468, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743469, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743470, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743471, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743472, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-06-16', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743473, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743474, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743475, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743476, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743477, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743478, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-06-22', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743479, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743480, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743481, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743482, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743483, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743484, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743485, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743486, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743487, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743488, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743489, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-06-16', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743490, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743491, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743492, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-06-06', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743493, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743494, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743495, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743496, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743497, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-06-04', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743498, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743499, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743500, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743501, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743502, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743503, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743504, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743505, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743506, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743507, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743508, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743509, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743510, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743511, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743512, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743513, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-06-16', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743514, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743515, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743516, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743517, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743518, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743519, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743520, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743521, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743522, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743523, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743524, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743525, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743526, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743527, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743528, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743529, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743530, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743531, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743532, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743533, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743534, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743535, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743536, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743537, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743538, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743539, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743540, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_beneficiary_trainings` (`beneficiary_id`, `tvet_id`, `training_module`, `start_date`, `end_date`, `Certificate`, `Is_Training_completed`, `Region`, `status`, `postdate`, `file_name`) VALUES
(931743541, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743542, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743543, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743544, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743545, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-06-10', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743546, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743547, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743548, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743549, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-06-16', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743550, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743551, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743552, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743553, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743554, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-06-16', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743555, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743556, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743557, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743558, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743559, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743560, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-06-16', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743561, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743562, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743563, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743564, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743565, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743566, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743567, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743568, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743569, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743570, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743571, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743572, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743573, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743574, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743575, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743576, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743577, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743578, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743579, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743580, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743581, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743582, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743583, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743584, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-07', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743585, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743586, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743587, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743588, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743589, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743590, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743591, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-06-18', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743592, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743593, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743594, 100002, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743595, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743596, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743597, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743598, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-06-18', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743599, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743600, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743601, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743602, 100002, 'Finishing  construction on plastering  gypsum and painting-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743603, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743604, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743605, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743606, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743607, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743608, 100002, 'Installation   construction on electric and sanitery-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743609, 100005, 'Leather Goods -2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743610, 100005, 'Footwear-2-PIN', '2019-05-15', '2019-07-26', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743611, 100002, 'BCW  on concreting barbending and carpentry-2-PIN', '2019-05-15', '2019-07-26', 'Not yet certified', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743613, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743614, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743615, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743616, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743617, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743618, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743619, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743620, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743621, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743622, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743623, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743624, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743625, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743626, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743627, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743628, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743629, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743630, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743631, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743632, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743633, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743634, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743635, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743636, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743637, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743638, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743639, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743640, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743641, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743642, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743643, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743644, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743645, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743646, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743647, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743648, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743649, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743650, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743651, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743652, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743653, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743654, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743655, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743656, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743657, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743658, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743659, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743660, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743661, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743662, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743663, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743664, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743665, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743666, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743667, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743668, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743669, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743670, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743671, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743672, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743673, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743674, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743675, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743676, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743677, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743678, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743679, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743680, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743681, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743682, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743683, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743684, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743685, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743686, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743687, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743688, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743689, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743690, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743691, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743692, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743693, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743694, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743695, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743696, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743697, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743698, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743699, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743700, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743701, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743702, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743703, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743704, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743705, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743706, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743707, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743708, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743709, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743710, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743711, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743712, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743713, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743714, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743715, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743716, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743717, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743718, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743719, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743720, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743721, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743722, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743723, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743724, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743725, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743726, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743727, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743728, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743729, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743730, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743731, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743732, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743733, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743734, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743735, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743736, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743737, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743738, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743739, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743740, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743741, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743742, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743743, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743744, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743745, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743746, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743747, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743748, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743749, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743750, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743751, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743752, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743753, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743754, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743755, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743756, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743757, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743758, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743759, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743760, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743761, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743762, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743763, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743764, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743765, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743766, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743767, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743768, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743769, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743770, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743771, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743772, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743773, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743774, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743775, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743776, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743777, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743778, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743779, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743780, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743781, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743782, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743783, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743784, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743785, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743786, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743787, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743788, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743789, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743790, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743791, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743792, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743793, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743794, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743795, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743796, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743797, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743798, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743799, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743800, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743801, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743802, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743803, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743804, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743805, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743806, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743807, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743808, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743809, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743810, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743811, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743812, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743813, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743814, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743815, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743816, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743817, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743818, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743819, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743820, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743821, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743822, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743823, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743824, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743825, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743826, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743827, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743828, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743829, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743830, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743831, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743832, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743833, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743834, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743835, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743836, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743837, 100001, 'Finishing  construction on plastering  gypsum and painting-2-conc', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743838, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743839, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743840, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743841, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743842, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743843, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743844, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743845, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743846, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_beneficiary_trainings` (`beneficiary_id`, `tvet_id`, `training_module`, `start_date`, `end_date`, `Certificate`, `Is_Training_completed`, `Region`, `status`, `postdate`, `file_name`) VALUES
(931743847, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743848, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743849, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743850, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743851, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743852, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743853, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743854, 100001, 'Metal Manufacturing-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743855, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743856, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743857, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743858, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743859, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743860, 100001, 'Installation   construction on electric and sanitery-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743861, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743862, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743863, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743864, 100001, 'Leather Goods-2-concern', '2019-04-10', '2019-08-23', '', 0, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743865, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743866, 100001, 'Footwear-2-Concern', '2019-04-10', '2019-08-23', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743868, 100002, 'Leather Goods-1-PIN', '2018-11-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743869, 100002, 'Footwear-1-PIN', '2018-10-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743870, 100002, 'Leather Goods-1-PIN', '2018-10-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743871, 100002, 'Leather Goods-1-PIN', '2018-10-02', '2019-02-01', 'COC certified', 1, 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_beneficiary_trainings_bkp`
--

CREATE TABLE `xls_import_beneficiary_trainings_bkp` (
  `beneficiary_id` bigint(20) NOT NULL,
  `tvet_id` int(7) NOT NULL,
  `training_module` varchar(65) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `Certificate` varchar(65) DEFAULT NULL,
  `Is_Training_completed` tinyint(1) NOT NULL,
  `Region` varchar(65) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_extra_indicators`
--

CREATE TABLE `xls_import_extra_indicators` (
  `Years` varchar(2012) NOT NULL,
  `Quarter` varchar(25) NOT NULL,
  `No_trainees` int(7) NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `No_multi_stackeholder` varchar(5) NOT NULL,
  `Region` varchar(65) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `post_date` date NOT NULL,
  `file_name` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_extra_indicators`
--

INSERT INTO `xls_import_extra_indicators` (`Years`, `Quarter`, `No_trainees`, `Sex`, `No_multi_stackeholder`, `Region`, `status`, `post_date`, `file_name`) VALUES
('2012', 'Quarter_3', 1970, 'Male', '40', 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_extra_indicators_bkp`
--

CREATE TABLE `xls_import_extra_indicators_bkp` (
  `Years` varchar(2012) NOT NULL,
  `Quarter` varchar(25) NOT NULL,
  `No_trainees` int(7) NOT NULL,
  `Sex` varchar(10) NOT NULL,
  `No_multi_stackeholder` varchar(5) NOT NULL,
  `Region` varchar(65) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `post_date` date NOT NULL,
  `file_name` varchar(65) NOT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_extra_indicators_bkp`
--

INSERT INTO `xls_import_extra_indicators_bkp` (`Years`, `Quarter`, `No_trainees`, `Sex`, `No_multi_stackeholder`, `Region`, `status`, `post_date`, `file_name`, `backup_postdate`) VALUES
('2012', 'Quarter_3', 1970, 'Male', '40', 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2020-02-17 13:49:54'),
('2012', 'Quarter_3', 1970, 'Male', '40', 'Addis Ababa', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2020-02-17 13:51:29');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_job_placement`
--

CREATE TABLE `xls_import_job_placement` (
  `beneficiary_id` bigint(20) NOT NULL,
  `job_placed` varchar(15) DEFAULT NULL,
  `placement_type` varchar(25) NOT NULL,
  `sme_or_cpmpany_id` int(7) NOT NULL,
  `wage` float NOT NULL,
  `consortium` varchar(30) NOT NULL,
  `EmploymentDate` date NOT NULL,
  `End_Date` date NOT NULL,
  `Region` varchar(65) NOT NULL,
  `cust_status` varchar(15) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_job_placement`
--

INSERT INTO `xls_import_job_placement` (`beneficiary_id`, `job_placed`, `placement_type`, `sme_or_cpmpany_id`, `wage`, `consortium`, `EmploymentDate`, `End_Date`, `Region`, `cust_status`, `status`, `postdate`, `file_name`) VALUES
(102500, NULL, 'Employment', 100044, 2240, 'LOT_1_VIS', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102501, NULL, 'Apprenticeship', 100046, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102502, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102506, NULL, 'Apprenticeship', 100047, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102507, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102508, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102510, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102511, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102512, NULL, 'Employment', 100079, 1500, 'LOT_1_VIS', '2019-08-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102513, NULL, 'Employment', 100050, 1000, 'LOT_1_VIS', '2019-08-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102514, NULL, 'Apprenticeship', 100051, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102515, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102516, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102517, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102521, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102522, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102523, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102527, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102528, NULL, 'Apprenticeship', 100054, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102530, NULL, 'Apprenticeship', 100051, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102531, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102532, NULL, 'Apprenticeship', 100053, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102533, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102535, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102538, NULL, 'Employment', 100044, 2240, 'LOT_1_VIS', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102540, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102541, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102542, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102544, NULL, 'Employment', 100084, 2600, 'LOT_1_VIS', '2019-09-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102545, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102546, NULL, 'Apprenticeship', 100053, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102547, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102548, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102549, NULL, 'Apprenticeship', 100046, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102550, NULL, 'Apprenticeship', 100046, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102551, NULL, 'Apprenticeship', 100051, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102552, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102553, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102554, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102555, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102556, NULL, 'Employment', 100079, 1500, 'LOT_1_VIS', '2019-08-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102558, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102559, NULL, 'Employment', 100084, 2600, 'LOT_1_VIS', '2019-09-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102560, NULL, 'Apprenticeship', 100056, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102562, NULL, 'Apprenticeship', 100057, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102563, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102564, NULL, 'Apprenticeship', 100044, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102565, NULL, 'Employment', 100079, 1500, 'LOT_1_VIS', '2019-08-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102567, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102568, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102569, NULL, 'Employment', 100044, 2240, 'LOT_1_VIS', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102570, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102571, NULL, 'Apprenticeship', 100058, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102572, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102573, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102574, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102575, NULL, 'Employment', 100044, 2240, 'LOT_1_VIS', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102576, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102578, NULL, 'Apprenticeship', 100044, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102579, NULL, 'Employment', 100051, 3000, 'LOT_1_VIS', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102580, NULL, 'Employment', 100050, 1200, 'LOT_1_VIS', '2019-08-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102581, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102582, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102583, NULL, 'Employment', 100084, 2600, 'LOT_1_VIS', '2019-09-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102584, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102585, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102586, NULL, 'Apprenticeship', 100053, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102588, NULL, 'Employment', 100079, 1500, 'LOT_1_VIS', '2019-08-26', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102589, NULL, 'Apprenticeship', 100053, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102591, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102593, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102594, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102595, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102597, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102598, NULL, 'Apprenticeship', 100053, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102599, NULL, 'Employment', 100084, 2600, 'LOT_1_VIS', '2019-09-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102600, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102601, NULL, 'Apprenticeship', 100051, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102602, NULL, 'Apprenticeship', 100056, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102603, NULL, 'Employment', 100044, 2240, 'LOT_1_VIS', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102604, NULL, 'Apprenticeship', 100051, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102605, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102607, NULL, 'Apprenticeship', 100054, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102608, NULL, 'Apprenticeship', 100057, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102610, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102611, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102612, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102613, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102614, NULL, 'Employment', 100045, 1600, 'LOT_1_VIS', '2019-09-30', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102615, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102616, NULL, 'Apprenticeship', 100053, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102617, NULL, 'Apprenticeship', 100055, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102618, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102619, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102620, NULL, 'Apprenticeship', 100059, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102622, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102623, NULL, 'Apprenticeship', 100051, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102624, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102625, NULL, 'Employment', 100050, 1000, 'LOT_1_VIS', '2019-08-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102626, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102627, NULL, 'Apprenticeship', 100047, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102629, NULL, 'Apprenticeship', 100060, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102630, NULL, 'Apprenticeship', 100056, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102631, NULL, 'Apprenticeship', 100058, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102633, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102636, NULL, 'Apprenticeship', 100053, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102637, NULL, 'Apprenticeship', 100046, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102638, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102639, NULL, 'Apprenticeship', 100051, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102640, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102641, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102642, NULL, 'Employment', 100044, 2240, 'LOT_1_VIS', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102643, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102645, NULL, 'Apprenticeship', 100044, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102648, NULL, 'Apprenticeship', 100046, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102650, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102652, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102653, NULL, 'Apprenticeship', 100056, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102654, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102656, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102657, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102658, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102659, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102661, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102662, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102664, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102665, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102667, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102668, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102669, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102671, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102672, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102673, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102674, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102675, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102677, NULL, 'Apprenticeship', 100061, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102678, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102679, NULL, 'Apprenticeship', 100062, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102681, NULL, 'Apprenticeship', 100060, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102682, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102683, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102684, NULL, 'Apprenticeship', 100062, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102685, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102686, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102687, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102691, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102692, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102693, NULL, 'Apprenticeship', 100061, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102694, NULL, 'Apprenticeship', 100062, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102695, NULL, 'Apprenticeship', 100052, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102696, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102697, NULL, 'Apprenticeship', 100053, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102699, NULL, 'Apprenticeship', 100044, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102700, NULL, 'Employment', 100079, 1500, 'LOT_1_VIS', '2019-08-26', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102702, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102703, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS', '2019-03-25', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102706, NULL, 'Apprenticeship', 100047, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102708, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS', '2019-03-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102710, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS', '2019-03-14', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102712, NULL, 'Apprenticeship', 100063, 0, 'LOT_1_VIS', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102713, NULL, 'Employment', 100320, 2700, 'LOT_1_PIN', '2019-07-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102714, NULL, 'Employment', 100071, 2650, 'LOT_1_PIN', '2019-08-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102715, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102716, NULL, 'Employment', 100318, 2800, 'LOT_1_PIN', '2019-08-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102717, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102718, NULL, 'Employment', 100327, 3100, 'LOT_1_PIN', '2019-05-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102719, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102720, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102721, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102722, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102723, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102724, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-05-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102725, NULL, 'Apprenticeship', 100076, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102726, NULL, 'Employment', 100321, 1800, 'LOT_1_PIN', '2019-08-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102727, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102729, NULL, 'Employment', 0, 2300, 'LOT_1_PIN_1ST', '2019-05-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102731, NULL, 'Apprenticeship', 100076, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102733, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102734, NULL, 'Apprenticeship', 100074, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102735, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102736, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102737, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102738, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102739, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102741, NULL, 'Employment', 0, 1800, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102742, NULL, 'Employment', 0, 1800, 'LOT_1_PIN_1ST', '2019-05-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102743, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102744, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102746, NULL, 'Employment', 0, 3000, 'LOT_1_PIN_1ST', '2019-05-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102748, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102749, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102750, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102751, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102753, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102754, NULL, 'Employment', 100083, 1600, 'LOT_1_PIN', '2019-06-20', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102757, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102758, NULL, 'Apprenticeship', 100077, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102759, NULL, 'Apprenticeship', 100078, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102760, NULL, 'Employment', 100077, 2250, 'LOT_1_PIN', '2019-06-26', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102761, NULL, 'Employment', 100077, 2250, 'LOT_1_PIN', '2019-06-26', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102762, NULL, 'Apprenticeship', 0, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102763, NULL, 'Employment', 100329, 1500, 'LOT_1_PIN', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102764, NULL, 'Apprenticeship', 100077, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102765, NULL, 'Apprenticeship', 100076, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102766, NULL, 'Apprenticeship', 100078, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102767, NULL, 'Employment', 100331, 2600, 'LOT_1_PIN', '2019-10-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102769, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102770, NULL, 'Apprenticeship', 100073, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102771, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102772, NULL, 'Employment', 0, 1800, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102774, NULL, 'Apprenticeship', 0, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102775, NULL, 'Apprenticeship', 100078, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102776, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102777, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102778, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102779, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102780, NULL, 'Apprenticeship', 100077, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102781, NULL, 'Employment', 0, 1800, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102782, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-05-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102783, NULL, 'Apprenticeship', 100071, 2500, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102784, NULL, 'Employment', 100319, 2500, 'LOT_1_PIN', '2019-08-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102785, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102786, NULL, 'Apprenticeship', 100074, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102789, NULL, 'Apprenticeship', 100074, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102791, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102792, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102793, NULL, 'Apprenticeship', 100077, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102794, NULL, 'Employment', 0, 1800, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102795, NULL, 'Apprenticeship', 0, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102796, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102797, NULL, 'Apprenticeship', 100077, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102798, NULL, 'Employment', 100322, 0, 'LOT_1_PIN', '2019-05-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102799, NULL, 'Apprenticeship', 100076, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102800, NULL, 'Employment', 100077, 2990, 'LOT_1_PIN', '2019-06-11', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102801, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102802, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102803, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102804, NULL, 'Employment', 100077, 2340, 'LOT_1_PIN', '2019-06-11', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102805, NULL, 'Employment', 100083, 1500, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102806, NULL, 'Apprenticeship', 100078, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102807, NULL, 'Employment', 100330, 3200, 'LOT_1_PIN', '2019-07-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102809, NULL, 'Apprenticeship', 100078, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102810, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102811, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102812, NULL, 'Apprenticeship', 0, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102813, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102814, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102815, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102816, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102817, NULL, 'Apprenticeship', 100076, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102818, NULL, 'Apprenticeship', 0, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102820, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102821, NULL, 'Employment', 100328, 3380, 'LOT_1_PIN', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102822, NULL, 'Employment', 100323, 1600, 'LOT_1_PIN', '2019-05-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102823, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102824, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102825, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102826, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102827, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102830, NULL, 'Apprenticeship', 100074, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102832, NULL, 'Employment', 100320, 2600, 'LOT_1_PIN', '2019-09-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102833, NULL, 'Employment', 100078, 2700, 'LOT_1_PIN', '2019-08-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102834, NULL, 'Employment', 0, 1800, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102835, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102836, NULL, 'Apprenticeship', 100077, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102837, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102839, NULL, 'Apprenticeship', 100074, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102840, NULL, 'Apprenticeship', 100074, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102841, NULL, 'Employment', 100077, 2250, 'LOT_1_PIN', '2019-06-26', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102842, NULL, 'Employment', 100326, 2400, 'LOT_1_PIN', '2019-05-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102843, NULL, 'Apprenticeship', 100078, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102844, NULL, 'Employment', 100077, 2990, 'LOT_1_PIN', '2019-06-11', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102845, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102846, NULL, 'Employment', 100324, 2600, 'LOT_1_PIN', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102847, NULL, 'Employment', 100083, 1500, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102848, NULL, 'Apprenticeship', 100078, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102849, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102850, NULL, 'Employment', 100077, 2250, 'LOT_1_PIN', '2019-06-26', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102851, NULL, 'Employment', 100077, 2990, 'LOT_1_PIN', '2019-06-11', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102852, NULL, 'Employment', 100077, 2250, 'LOT_1_PIN', '2019-06-26', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102853, NULL, 'Apprenticeship', 100073, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102854, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102855, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102856, NULL, 'Apprenticeship', 100074, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102857, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102859, NULL, 'Apprenticeship', 100071, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102860, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102861, NULL, 'Apprenticeship', 0, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102862, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102863, NULL, 'Employment', 0, 2500, 'LOT_1_PIN', '2019-05-09', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102865, NULL, 'Employment', 0, 1800, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102867, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102868, NULL, 'Apprenticeship', 100078, 0, 'LOT_1_PIN', '2019-02-12', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102869, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102870, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102871, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102872, NULL, 'Apprenticeship', 100072, 0, 'LOT_1_PIN', '2019-02-05', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102873, NULL, 'Employment', 100325, 1500, 'LOT_1_PIN', '2019-06-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102874, NULL, 'Employment', 0, 2300, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102875, NULL, 'Apprenticeship', 100076, 0, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102876, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102877, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102879, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102881, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102882, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102883, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102884, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102885, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102886, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102887, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_job_placement` (`beneficiary_id`, `job_placed`, `placement_type`, `sme_or_cpmpany_id`, `wage`, `consortium`, `EmploymentDate`, `End_Date`, `Region`, `cust_status`, `status`, `postdate`, `file_name`) VALUES
(102888, NULL, 'Employment', 100065, 3120, 'LOT_1_CHADET', '2019-03-18', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102889, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102890, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102892, NULL, 'Employment', 100065, 3120, 'LOT_1_CHADET', '2019-03-18', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102893, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102894, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102895, NULL, 'Employment', 100065, 3120, 'LOT_1_CHADET', '2019-03-18', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102896, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102897, NULL, 'Employment', 100068, 3000, 'LOT_1_CHADET', '2019-08-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102898, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102901, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102902, NULL, 'Employment', 100068, 3000, 'LOT_1_CHADET', '2019-08-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102903, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102904, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102905, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102906, NULL, 'Employment', 100065, 3120, 'LOT_1_CHADET', '2019-03-18', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102907, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102908, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102909, NULL, 'Employment', 100065, 3120, 'LOT_1_CHADET', '2019-03-18', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102910, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102911, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102912, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102913, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102914, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102915, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102916, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102917, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102918, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102919, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102920, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102921, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102922, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102923, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102924, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102925, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102926, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102927, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102928, NULL, 'Employment', 100068, 3000, 'LOT_1_CHADET', '2019-07-29', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102929, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102930, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102931, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102932, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102933, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102934, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102936, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102937, NULL, 'Employment', 100251, 961, 'LOT_1_CHADET_REPORTED IN Q4_20', '2019-08-16', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102938, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102939, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102940, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102941, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102942, NULL, 'Employment', 100068, 3000, 'LOT_1_CHADET', '2019-07-29', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102943, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102944, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102945, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102946, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102947, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102948, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102949, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102950, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102951, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102952, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102953, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102954, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102955, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102956, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102957, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102958, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102959, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102960, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102961, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102962, NULL, 'Employment', 100068, 3000, 'LOT_1_CHADET', '2019-07-29', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102963, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102964, NULL, 'Employment', 100069, 2052, 'LOT_1_CHADET', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102965, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102966, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102967, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102968, NULL, 'Employment', 100069, 2052, 'LOT_1_CHADET', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102969, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102970, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102971, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102972, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102973, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102974, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102975, NULL, 'Employment', 100252, 2500, 'LOT_1_CHADET_REPORTED IN Q4_20', '2019-04-11', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102976, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102977, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102978, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102979, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102980, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102981, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102982, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102983, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102984, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102985, NULL, 'Employment', 100069, 2052, 'LOT_1_CHADET', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102986, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102987, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102988, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102989, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102990, NULL, 'Apprenticeship', 100068, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102991, NULL, 'Apprenticeship', 100065, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102992, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102993, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102994, NULL, 'Apprenticeship', 0, 0, 'LOT_1_CHADET', '2019-02-13', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102996, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102997, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(102999, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103000, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103001, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103002, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103003, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103004, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103006, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103007, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103008, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103009, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103010, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103011, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103012, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103014, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103015, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103016, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103017, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103018, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103019, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103022, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103023, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103025, NULL, 'Employment', 100069, 1608, 'LOT_1_CWW', '2019-10-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103026, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103027, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103028, NULL, 'Employment', 0, 1400, 'LOT_1_CWW', '2019-07-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103029, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103030, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103031, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103032, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103033, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103034, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103036, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103037, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103038, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103040, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103041, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103042, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103043, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103044, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103045, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103046, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103048, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103049, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103050, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103051, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103052, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103053, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103054, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103055, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103056, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103057, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103058, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103059, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103060, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103061, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103062, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103063, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103066, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103067, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103068, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103069, NULL, 'Employment', 100070, 1820, 'LOT_1_CWW', '2019-06-28', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103070, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103071, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103072, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103073, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103074, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103075, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103076, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103077, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103079, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103080, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103081, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103082, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103083, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103084, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103085, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103086, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103087, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103088, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103089, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103090, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103091, NULL, 'Employment', 100070, 1950, 'LOT_1_CWW', '2019-06-28', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103092, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103093, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103094, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103095, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103096, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103098, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103099, NULL, 'Employment', 100070, 2600, 'LOT_1_CWW', '2019-05-29', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103100, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103101, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103102, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103103, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103104, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103105, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103106, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103107, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103109, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103110, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103111, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103113, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103114, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103115, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103116, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103117, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103118, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103119, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103120, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103122, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103123, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103124, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103125, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103126, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103128, NULL, 'Employment', 100070, 1950, 'LOT_1_CWW', '2019-06-28', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103129, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103130, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103131, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103132, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103133, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103135, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103137, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103138, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103139, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103140, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103141, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103142, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103143, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103146, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103147, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103148, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103149, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103150, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103151, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103152, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103153, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103154, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103155, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103156, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103157, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103158, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103159, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103160, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103161, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103162, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103163, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103164, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103165, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103166, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103168, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103169, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103170, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103171, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103172, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103173, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103174, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103175, NULL, 'Employment', 100070, 2600, 'LOT_1_CWW', '2019-05-29', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103176, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103177, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103178, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103180, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103181, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103182, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103183, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103184, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103185, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103186, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103187, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103188, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103189, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103190, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103191, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103192, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103194, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103196, NULL, 'Employment', 100070, 1820, 'LOT_1_CWW', '2019-06-28', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103197, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103198, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103200, NULL, 'Employment', 100070, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103201, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103202, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103203, NULL, 'Employment', 100262, 2000, 'LOT_1_CWW', '2019-07-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103204, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103205, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103206, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103207, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103208, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103209, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103211, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103212, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103213, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103214, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103215, NULL, 'Employment', 100070, 2600, 'LOT_1_CWW', '2019-05-29', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103216, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103217, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103218, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103219, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103220, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103221, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103222, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103223, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103224, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103225, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103227, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103228, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx');
INSERT INTO `xls_import_job_placement` (`beneficiary_id`, `job_placed`, `placement_type`, `sme_or_cpmpany_id`, `wage`, `consortium`, `EmploymentDate`, `End_Date`, `Region`, `cust_status`, `status`, `postdate`, `file_name`) VALUES
(103229, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103230, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103231, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103232, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103233, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103234, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103235, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103236, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103237, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103238, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103239, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103240, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103242, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103243, NULL, 'Employment', 100263, 2500, 'LOT_1_CWW', '2019-07-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103244, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103245, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103246, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103247, NULL, 'Employment', 100069, 2052, 'LOT_1_CWW', '2019-07-22', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103248, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103249, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103250, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103251, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103252, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103253, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103254, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103255, NULL, 'Apprenticeship', 100070, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103256, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103257, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103258, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103259, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(103260, NULL, 'Apprenticeship', 100069, 0, 'LOT_1_CWW', '2019-02-23', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743039, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743040, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743041, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743045, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743046, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743047, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743054, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743056, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743057, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743060, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743061, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743063, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743067, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743072, NULL, 'Apprenticeship', 100236, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743074, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743075, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743076, NULL, 'Apprenticeship', 100236, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743077, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743079, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743082, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743085, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743087, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743089, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743091, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743092, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743094, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743099, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743101, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743102, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743103, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743106, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743107, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743108, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743109, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743111, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743118, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743123, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743125, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743126, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743127, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743128, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743129, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743131, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743136, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743137, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743140, NULL, 'Apprenticeship', 100237, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743141, NULL, 'Apprenticeship', 100237, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743142, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743143, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743146, NULL, 'Apprenticeship', 100236, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743147, NULL, 'Apprenticeship', 100050, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743151, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743153, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743154, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743155, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743156, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743157, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743163, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743164, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743166, NULL, 'Apprenticeship', 100237, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743168, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743172, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743174, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743176, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743177, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743187, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743189, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743191, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743196, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743198, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743199, NULL, 'Apprenticeship', 100236, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743200, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743201, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743203, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743206, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743207, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743208, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743210, NULL, 'Apprenticeship', 100236, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743214, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743215, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743221, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743222, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743225, NULL, 'Apprenticeship', 100237, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743226, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743228, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743229, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743233, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743234, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743237, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743244, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743245, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743246, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743247, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743250, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743253, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743256, NULL, 'Apprenticeship', 100050, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743257, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743258, NULL, 'Apprenticeship', 100050, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743260, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743261, NULL, 'Apprenticeship', 100237, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743262, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743264, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743272, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743273, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743275, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743277, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743278, NULL, 'Apprenticeship', 100236, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743284, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743286, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743287, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743291, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743300, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743302, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743303, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743306, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743309, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743311, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743317, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743318, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743322, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743323, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743324, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743325, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743328, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743330, NULL, 'Apprenticeship', 100050, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743331, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743333, NULL, 'Apprenticeship', 100237, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743335, NULL, 'Apprenticeship', 100045, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743337, NULL, 'Apprenticeship', 100048, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743338, NULL, 'Apprenticeship', 100049, 0, 'LOT_1_VIS_2nd', '2019-09-30', '2019-12-20', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743868, NULL, 'Employment', 100083, 1500, 'LOT_1_PIN', '2019-02-07', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(931743870, NULL, 'Employment', 100315, 2100, 'LOT_1_PIN_1ST', '2019-08-01', '1970-01-01', 'Addis Ababa', NULL, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_job_placement_bkp`
--

CREATE TABLE `xls_import_job_placement_bkp` (
  `beneficiary_id` bigint(20) NOT NULL,
  `job_placed` varchar(15) DEFAULT NULL,
  `placement_type` varchar(25) NOT NULL,
  `sme_or_cpmpany_id` int(7) NOT NULL,
  `wage` float NOT NULL,
  `consortium` varchar(30) NOT NULL,
  `EmploymentDate` date NOT NULL,
  `End_Date` date NOT NULL,
  `Region` varchar(65) NOT NULL,
  `cust_status` varchar(15) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_oo_indicators12`
--

CREATE TABLE `xls_import_oo_indicators12` (
  `region` varchar(65) NOT NULL,
  `expr1001` varchar(45) DEFAULT NULL,
  `age_group` varchar(15) NOT NULL,
  `sex` varchar(15) NOT NULL,
  `irregular_migration` int(6) NOT NULL,
  `propensity` int(8) NOT NULL,
  `data_entry_point` varchar(25) NOT NULL,
  `Consortium` varchar(45) NOT NULL,
  `Is_overall` tinyint(1) NOT NULL,
  `By_age` tinyint(1) NOT NULL,
  `By_sex` tinyint(1) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_oo_indicators12`
--

INSERT INTO `xls_import_oo_indicators12` (`region`, `expr1001`, `age_group`, `sex`, `irregular_migration`, `propensity`, `data_entry_point`, `Consortium`, `Is_overall`, `By_age`, `By_sex`, `status`, `postdate`, `file_name`) VALUES
('Addis Ababa', '', '', 'Female', 5, 6, 'Baseline', '', 0, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
('Addis Ababa', '', '', 'Male', 10, 20, 'Baseline', '', 0, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
('Addis Ababa', '', '18-34', '', 0, 0, 'Baseline', '', 0, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_oo_indicators12_bkp`
--

CREATE TABLE `xls_import_oo_indicators12_bkp` (
  `region` varchar(65) NOT NULL,
  `expr1001` varchar(45) DEFAULT NULL,
  `age_group` varchar(15) NOT NULL,
  `sex` varchar(15) NOT NULL,
  `irregular_migration` int(6) NOT NULL,
  `propensity` int(8) NOT NULL,
  `data_entry_point` varchar(25) NOT NULL,
  `Consortium` varchar(45) NOT NULL,
  `Is_overall` tinyint(1) NOT NULL,
  `By_age` tinyint(1) NOT NULL,
  `By_sex` tinyint(1) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_oo_indicators34`
--

CREATE TABLE `xls_import_oo_indicators34` (
  `region` varchar(45) NOT NULL,
  `consortium` varchar(45) NOT NULL,
  `age_group` varchar(15) DEFAULT NULL,
  `sex` varchar(15) DEFAULT NULL,
  `Income_baseline` int(7) NOT NULL,
  `Income_Endline` int(7) NOT NULL,
  `Unemployment_Base` int(7) NOT NULL,
  `Unemployment_End` int(7) NOT NULL,
  `Is_overall` tinyint(1) NOT NULL,
  `By_age` tinyint(1) NOT NULL,
  `By_sex` tinyint(1) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_oo_indicators34`
--

INSERT INTO `xls_import_oo_indicators34` (`region`, `consortium`, `age_group`, `sex`, `Income_baseline`, `Income_Endline`, `Unemployment_Base`, `Unemployment_End`, `Is_overall`, `By_age`, `By_sex`, `status`, `postdate`, `file_name`) VALUES
('Addis Ababa', '', '', '', 1696, 0, 21, 0, 0, 0, 0, 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_oo_indicators34_bkp`
--

CREATE TABLE `xls_import_oo_indicators34_bkp` (
  `region` varchar(45) NOT NULL,
  `consortium` varchar(45) NOT NULL,
  `age_group` varchar(15) DEFAULT NULL,
  `sex` varchar(15) DEFAULT NULL,
  `Income_baseline` int(7) NOT NULL,
  `Income_Endline` int(7) NOT NULL,
  `Unemployment_Base` int(7) NOT NULL,
  `Unemployment_End` int(7) NOT NULL,
  `Is_overall` tinyint(1) NOT NULL,
  `By_age` tinyint(1) NOT NULL,
  `By_sex` tinyint(1) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_pp`
--

CREATE TABLE `xls_import_pp` (
  `value_Chain` varchar(65) NOT NULL,
  `consortium` varchar(45) NOT NULL,
  `agr_date` date NOT NULL,
  `decent_work_principles` varchar(15) NOT NULL,
  `Region` varchar(65) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_pp`
--

INSERT INTO `xls_import_pp` (`value_Chain`, `consortium`, `agr_date`, `decent_work_principles`, `Region`, `status`, `postdate`, `file_name`) VALUES
('Leather', 'LOT_1', '2019-02-25', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-08', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Metal Works', 'LOT_1', '2019-03-24', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-21', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-03-23', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-03-20', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-08', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-03-20', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-04-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-03-20', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-31', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-08', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-08', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-08', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-08', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-08', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-08', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-08', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-03-08', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2018-11-09', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-09-30', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-09-30', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1_PIN', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-05-13', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-05-14', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-02-17', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-10', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-09-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Leather', 'LOT_1', '2019-01-26', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('Construction', 'LOT_1', '2019-10-01', '1', 'Addis Ababa', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', '', '1970-01-01', '', '', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', '', '1970-01-01', '', '', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_pp_bkp`
--

CREATE TABLE `xls_import_pp_bkp` (
  `value_Chain` varchar(65) NOT NULL,
  `consortium` varchar(45) NOT NULL,
  `agr_date` date NOT NULL,
  `decent_work_principles` varchar(15) NOT NULL,
  `Region` varchar(65) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_smecompanies`
--

CREATE TABLE `xls_import_smecompanies` (
  `enterprise_id` bigint(20) NOT NULL,
  `name` varchar(65) NOT NULL,
  `is_sme` varchar(10) NOT NULL,
  `region` varchar(25) NOT NULL,
  `consortium` varchar(25) NOT NULL,
  `since_supported` varchar(1) NOT NULL,
  `value_chain` varchar(30) NOT NULL,
  `end_line_capacity_level` int(2) NOT NULL,
  `entry_point_capacity_level` int(2) NOT NULL,
  `agr_decent_work_principle` tinyint(1) NOT NULL,
  `emp_no_entry_point` int(6) NOT NULL,
  `emp_no_end_line` int(6) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `entry_point_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_smecompanies`
--

INSERT INTO `xls_import_smecompanies` (`enterprise_id`, `name`, `is_sme`, `region`, `consortium`, `since_supported`, `value_chain`, `end_line_capacity_level`, `entry_point_capacity_level`, `agr_decent_work_principle`, `emp_no_entry_point`, `emp_no_end_line`, `status`, `postdate`, `file_name`, `entry_point_date`) VALUES
(100105, 'EIFCCOS', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, 1, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-01-26'),
(100106, 'EIFCCOS(Mesalemiya Branch)', 'SME', 'Addis Ababa', 'Lot_1_CHADET', '1', 'Leather', 0, 0, 1, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-01-26'),
(100107, 'Biniam', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 32, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100108, 'Abel Getnet', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100109, 'Mekuria Temesgen', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100110, 'Yonas Asrat1', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 200, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100111, 'Nesiru Kedir', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100112, 'Helen Niguse', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 4, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100113, 'Tesfanesh dame', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 8, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100114, 'Million Mamo', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 2, 1, 11, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100115, 'Kumneger Mesele', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100117, 'Bahiru Erfeto', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100118, 'Tewdros Adane', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100119, 'Wendimagegn Mesay', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100120, 'Melaku Tilahun', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 8, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100121, 'Nicolas Legesse', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 25, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100122, 'Admasu Getachew', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 8, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100123, 'Solomon Galgale', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 2, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100124, 'Seto Sitotaw', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 12, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100125, 'Minalebesh Mandefro', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 4, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100126, 'Yonas Sertsedingil', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100127, 'Gugsa Gurara', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100128, 'Kalkidan Getachew', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100129, 'Beshaw Habte', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100130, 'Sintayehu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 23, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100131, 'Tilahun', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100132, 'Yonel', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100133, 'Tamirat', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 2, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100134, 'Tadele Barecha', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100135, 'Bahiru Arego', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 1, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100136, 'Abera', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 11, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100137, 'Andamlak Endashaw', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 2, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100138, 'Fikat Mola', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 11, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100139, 'Sintayehu Sahile', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 2, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100140, 'Ejigu Abogosh', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 2, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100141, 'Adane Biratu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 4, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100142, 'Abera Shehamolo', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 1, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100143, 'Abreham Aseffa', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100144, 'Fantahun H/Wold', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100145, 'Eshetu Getachew', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 20, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100146, 'Bereket Negash', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 4, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100147, 'Adamsaged Deneke', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 4, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100148, 'Wendimagegn', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100149, 'Solomon Ayalkibet', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 2, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100150, 'Sirwana Adane', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 2, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100151, 'Birhanu Sema', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 3, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100152, 'Aschalew', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 11, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100153, 'Getu Desalegn', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 32, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100154, 'Betlehem Tusi', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 2, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100155, 'Shewalem Zergaye', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 4, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100156, 'Ayenew H/Silase', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 2, 1, 50, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-10'),
(100157, 'Tigistu Dermolo', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 2, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-11'),
(100158, 'Tesfaye Melese', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 12, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-12'),
(100159, 'Demeke Teka', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-13'),
(100160, 'Kasahun atinafu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-14'),
(100161, 'Teshale Worku', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-15'),
(100162, 'Melaku Alemu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 2, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-16'),
(100163, 'Tekle Feyiso', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 9, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-17'),
(100164, 'Mekonnen Talila', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 15, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-18'),
(100165, 'Teshome G/ Michael', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 4, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-19'),
(100166, 'Muluneh Alemu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-20'),
(100167, 'Kidane Haile', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 8, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-21'),
(100168, 'Woynishet Andiye', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 15, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-22'),
(100169, 'Esans Alemu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 20, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-23'),
(100170, 'Teshome Adnew', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 21, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-24'),
(100171, 'Isayas', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 8, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-25'),
(100172, 'Teshome', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 13, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-26'),
(100173, 'Tadesse', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 42, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-27'),
(100174, 'Zewude', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 120, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-28'),
(100175, 'Amare', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 20, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-29'),
(100176, 'Zeneb Tesfaye', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 3, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-30'),
(100177, 'Million Galaye', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 4, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-03-31'),
(100178, 'Belay Aseffa', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 18, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-01'),
(100179, 'Asmare H/mariam', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-02'),
(100180, 'Solomon Alemu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-03'),
(100181, 'Ayele Husen', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 11, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-04'),
(100182, 'Yonas Andiye', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 30, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-05'),
(100183, 'Endashaw Lema', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-06'),
(100184, 'Begashaw H/ Mariam', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-07'),
(100185, 'Nigusse Miskir', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 8, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-08'),
(100186, 'Yonas Sarko', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-09'),
(100187, 'Tesfanesh Nigusse', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 3, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-10'),
(100188, 'Tesfaye  Regasa', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-11'),
(100189, 'Thomas Shermolo', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-12'),
(100190, 'Mulugeta Sidamo', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-13'),
(100191, 'Gerume  Haile', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 1, 1, 3, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-14'),
(100192, 'Shifraw Mentesinot', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 12, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-15'),
(100193, 'Aboneh Sema', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 9, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-16'),
(100194, 'Belete Alemu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-17'),
(100195, 'Yonael G/Kidan', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 11, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-18'),
(100196, 'Takele Feyiso', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-19'),
(100197, 'Nigusse Demise', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 9, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-20'),
(100198, 'Tariku Zeregay/Esayas', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-21'),
(100199, 'Asebeha Abereha', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-22'),
(100200, 'Nuri Oremano', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-23'),
(100201, 'Fikire Denbele', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-24'),
(100202, 'Anduamlak Endashaw', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 8, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-25'),
(100203, 'Fikadu Sareko', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 8, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-26'),
(100204, 'Muluken Tadele', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 11, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-27'),
(100205, 'Showalem', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-28'),
(100206, 'Abebaw Teferi', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-04-29'),
(100207, 'Demisew and Getachew GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 14, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100208, 'Bethelhem ,Berket and and friends', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 22, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100209, 'Meaza Gebru GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 12, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100210, 'Teferi Geremew and Friends Sanitory', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 4, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100211, 'Berhane and Hirut Block Manufucturing', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100212, 'Gebretsadik and Akililu GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 23, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100213, 'Tesfalem Asaye and Friends GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 30, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100214, 'Mohamed Dewam', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 16, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100215, 'Ibrahim Andualem and Friends Co.', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 17, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100216, 'Abdulkerim,Solomon and Friends', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100217, 'Hailemariam,Elshaday and Frieds', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100218, 'Habtewold and Getnet E/Installation', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100219, 'Demeke,Mesfin and Friends Block Production', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 15, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100220, 'Tilahun,Dereje and Friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 12, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100221, 'Shimelis,Andebet,Hayder and Friends Terazo', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 24, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100222, 'Behailu and Hailesillasie BC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 12, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100223, 'Grow Up Construction', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 17, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100224, 'Kidane Aymut Construction Inputs SSer', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 11, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100225, 'Abeselom and Ermias BC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, 1, 52, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100226, 'Tsegaye Teklay and Friends Co.', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 9, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100227, 'Kidu G/Michael GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 4, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100228, 'Berhanu and Gebremichael GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100229, 'Samuel,Winta and Friends Co.', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 12, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100230, 'Melese,Anguach and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 19, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100231, 'Ezira,Hirut and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, 1, 26, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100232, 'Ebistie,Aregash and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 0, 1, 3, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100233, 'Abebaye,Gete and friends Co', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100234, 'Ermias,Mekdes and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, 1, 44, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100235, 'Minassie,Eshete and their friends  BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, 1, 12, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100236, 'Leykun,Endale,and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 11, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100237, 'Tamirat,Gezahegn and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 13, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100238, 'Dagnachew,Selamawit and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, 1, 53, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100239, 'Abebaw,Mahlet,Bekalu and their friends GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 17, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100240, 'Minilik,Gudina and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, 1, 37, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100241, 'Hiwot Hailemichael GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 20, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100242, 'Gelana Mekonnon GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 32, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100243, 'Bedru Arege Hamote GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 26, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100244, 'Duresa Abe GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 17, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100245, 'Yohannes,Tsega and their friends', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 20, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100246, 'FRANO GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 12, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100247, 'A to Z', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, 1, 29, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100248, 'Eleni and Ashenafi GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, 1, 6, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100249, 'Dream Big', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 23, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100250, 'Melaku,Sosina and friends GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 40, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100251, 'Wubayehuand Temesgen', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, 1, 30, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100252, 'Solomon and Daniel GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 15, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100253, 'Asefash,Rahel and their friends GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 33, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100254, 'Fitsum,Eyuel and their friends Stone Cutting', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, 1, 7, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100255, 'Yitbarek and Azimera GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100256, 'Berhanu,Bedilu and friens BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, 1, 13, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2018-03-11'),
(100257, 'Tsion Industrial Engineering & Metalwork Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100258, 'Tekso Mechanical Engineering Works', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100259, 'Tatek and Girma Metalwork Partnership', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100260, 'Woubishet, Tamirat and Friends Metalwork Partnership', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100261, 'Befekadu Netsanet and His Friends PLC', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100262, 'Demeke Daniel and His Friends Wood and Metal Works', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100263, 'Biotech/ Winsor Energy Saving Technology', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 4, 1, 15, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100264, 'Elfework PLC', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 4, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100265, 'Samy Machine and General Metalworks Private Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100266, 'Tamrat Demisse Metalworks', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 1, 15, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100267, 'Solomon Teka Private Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100268, 'Adane Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100269, 'Yewubdinber, Daniel and Friends Wood and Metal Work', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100270, 'Atkilt Desta Wood and Metalwork PLC', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100271, 'Tesfa Shum Maraki Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100272, 'Shura Getachew and Friends Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 0, 0, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100273, 'Abesolom Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100274, 'Zeritu Birhanu Wood and Metalwork', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 0, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100275, 'Melak, Andnet and Friends Metal and Woodwork', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100276, 'Dawit Ayalew Metalwork Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100277, 'Daniel Zerihun and Friends Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100278, 'Gete Abi and Friends Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100279, 'Belete Belay and Friends Metalwork Partnership', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100280, 'Gizachew, Wolde, Yohannes and Fiends enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100281, 'Biruk Kidus and Friends Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100282, 'Yohannes Abate Metalwork Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100283, 'Afework, Fetlework and Friends', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100284, 'Marta and Ayele Home and Office Furniture Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100285, 'Gebreyesus Amsalu and Friends Partnership', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 1, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100286, 'Zakir, Radila and Friens Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100287, 'Wondesen Hailu and Friends Metals and Woodwork', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100288, 'Yonas Nade Metalwork Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100289, 'Assefa Zeleke Metalwork Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100290, 'Elfwork Metalwork Partnership', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 3, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100291, 'Kibebew Abera Metalwork Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100292, 'Andnet Wood and Metalwork Partnership', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 0, 0, 0, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100293, 'Biruk, Asmarech and Friends Metalwork Partnership', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100294, 'Teshale Geda Private Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100295, 'Yonas Tefera Metalwork Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 1, 10, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100296, 'Yohannes, Samuel and Friends Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100297, 'Mesfin Mekonnen Woodwork and Metalwork Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100298, 'Sintayehu Mengistu Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 0, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100299, 'Tesfaye, Assefa and Friends Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100300, 'Tesfaye, Gezahegn and Genet Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100301, 'Samson, Tamirat and Daniel Metalwork Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100302, 'Tesfaye, Solomon and Friends Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 2, 1, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100303, 'Tadesse Shiferaw Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 0, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100304, 'Solomon Sileshi and Brothers\' Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100305, 'Alhamdu, Fetiha and Friends Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11'),
(100306, 'Tariku Kebede Woodwork and Metalwork Enterprise', 'SME', 'Addis Ababa', 'LOT_1_VIS', '', 'Metal Works', 0, 1, 0, 5, 0, 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx', '2019-06-11');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_smecompanies_bkp`
--

CREATE TABLE `xls_import_smecompanies_bkp` (
  `enterprise_id` bigint(20) NOT NULL,
  `name` varchar(65) NOT NULL,
  `is_sme` varchar(10) NOT NULL,
  `region` varchar(25) NOT NULL,
  `consortium` varchar(25) NOT NULL,
  `since_supported` varchar(10) NOT NULL,
  `value_chain` varchar(30) NOT NULL,
  `end_line_capacity_level` int(2) NOT NULL,
  `entry_point_capacity_level` int(2) NOT NULL,
  `agr_decent_work_principle` varchar(10) NOT NULL,
  `emp_no_entry_point` int(6) NOT NULL,
  `emp_no_end_line` int(6) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `entry_point_date` date NOT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_sme_support`
--

CREATE TABLE `xls_import_sme_support` (
  `sme_name` bigint(20) NOT NULL,
  `support_type` varchar(65) NOT NULL,
  `dataentry_date` date NOT NULL,
  `quarter` varchar(65) NOT NULL,
  `Region` varchar(65) NOT NULL,
  `consortium` varchar(45) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_sme_support`
--

INSERT INTO `xls_import_sme_support` (`sme_name`, `support_type`, `dataentry_date`, `quarter`, `Region`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(100105, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100106, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CHADET', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100107, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100108, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100109, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100110, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100111, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100112, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100113, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100114, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100115, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100117, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100118, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100119, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100120, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100121, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100122, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100123, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100124, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100125, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100126, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100127, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100128, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100129, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100130, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100131, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100132, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100133, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100134, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100135, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100136, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100137, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100138, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100139, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100140, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100141, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100142, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100143, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100144, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100145, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100146, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100147, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100148, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100149, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100150, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100151, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100152, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100153, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100154, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100155, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100156, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100157, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100158, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100159, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100160, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100161, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100162, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100163, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100164, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100165, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100166, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100167, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100168, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100169, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100170, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100171, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100172, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100173, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100174, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100175, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100176, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100177, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100178, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100179, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100180, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100181, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100182, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100183, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100184, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100185, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100186, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100187, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100188, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100189, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100190, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100191, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100192, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100193, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100194, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100195, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100196, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100197, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100198, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100199, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100200, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100201, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100202, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100203, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100204, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100205, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100206, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100207, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100208, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100209, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100210, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100211, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100212, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100213, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100214, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100215, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100216, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100217, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100218, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100219, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100220, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100221, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100222, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100223, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100224, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100225, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100226, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100227, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100228, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100229, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100230, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100231, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100232, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100233, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100234, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100235, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100236, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100237, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100238, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100239, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100240, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100241, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100242, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100243, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100244, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100245, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100246, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100247, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100248, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100249, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100250, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100251, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100252, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100253, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
(100254, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_sme_support_bkp`
--

CREATE TABLE `xls_import_sme_support_bkp` (
  `sme_name` bigint(20) NOT NULL,
  `support_type` varchar(65) NOT NULL,
  `dataentry_date` date NOT NULL,
  `quarter` varchar(65) NOT NULL,
  `Region` varchar(65) NOT NULL,
  `consortium` varchar(45) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_tvet`
--

CREATE TABLE `xls_import_tvet` (
  `tvet_id` int(7) NOT NULL,
  `tvet_name` varchar(65) NOT NULL,
  `region` varchar(45) NOT NULL,
  `tvet_type` varchar(25) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_tvet`
--

INSERT INTO `xls_import_tvet` (`tvet_id`, `tvet_name`, `region`, `tvet_type`, `status`, `postdate`, `file_name`) VALUES
(100000, 'General Wingate College', 'Addis Ababa', 'Public', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(100001, 'Lideta Manufacturing College', 'Addis Ababa', 'Public', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(100002, 'Misrak Polytechnic College', 'Addis Ababa', 'Public', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(100005, 'Yeka Industrial College', 'Addis Ababa', 'Public', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(100008, 'Entoto PTC', 'Addis Ababa', 'Public', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx'),
(100009, 'Addis Ketema Manufacturing College', 'Addis Ababa', 'Public', 1, '2020-02-17', 'Lot1_17Feb20_0939.xls.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_tvet_bkp`
--

CREATE TABLE `xls_import_tvet_bkp` (
  `tvet_id` int(7) NOT NULL,
  `tvet_name` varchar(65) NOT NULL,
  `region` varchar(45) NOT NULL,
  `tvet_type` varchar(25) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_tvet_training`
--

CREATE TABLE `xls_import_tvet_training` (
  `woreda` varchar(45) DEFAULT NULL,
  `region` varchar(45) NOT NULL,
  `entry_point_date` date NOT NULL,
  `training_name` varchar(45) NOT NULL,
  `training_type` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `tvet_name` bigint(20) NOT NULL,
  `valuechain` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `post_date` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_tvet_training`
--

INSERT INTO `xls_import_tvet_training` (`woreda`, `region`, `entry_point_date`, `training_name`, `training_type`, `start_date`, `end_date`, `tvet_name`, `valuechain`, `status`, `post_date`, `file_name`) VALUES
('', 'Addis Ababa', '2018-11-05', 'BCW  on concreting barbending and carpentry-1', 'Improved', '2018-11-02', '2019-02-01', 100002, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Metal Manufacturing-2-concern', 'Improved', '2019-04-10', '2019-08-20', 100001, '5', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Finishing  construction on plastering  gypsum', 'Improved', '2018-11-12', '2019-02-12', 100001, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-06', 'BCW  on concreting barbending and carpentry-2', 'Improved', '2018-11-05', '2019-07-26', 100002, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Installation   construction on electric and s', 'Improved', '2018-11-12', '2019-02-12', 100001, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Footwear-1-Chadet', 'Improved', '2018-11-12', '2019-02-12', 100001, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'leather Garment-1-PIN', 'Improved', '2018-11-02', '2019-02-01', 100002, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Leather Goods-1-chadet', 'Improved', '2018-11-12', '2019-01-12', 100001, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Metal Manufacturing-1-PIN', 'Improved', '2018-11-02', '2019-02-01', 100002, '5', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Leather Goods-2-chadet', 'Improved', '2019-04-09', '2019-07-09', 100009, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Installation   construction on electric and s', 'Improved', '2018-11-12', '2019-02-09', 100001, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Finishing  construction on plastering  gypsum', 'Improved', '2018-11-12', '2019-02-12', 100001, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-08-04', 'Footwear-1-Concern', 'Improved', '2018-12-11', '2019-02-09', 100001, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Metal Manufacturing-1-VIS', 'Improved', '2018-11-12', '2019-03-13', 100000, '5', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Metal Manufacturing-2-VIS', 'Improved', '2019-06-10', '2019-08-11', 100000, '5', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-04-15', 'Footwear-2-Concern', 'Improved', '2019-04-10', '2019-08-22', 100001, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Leather Goods-1-concern', 'Improved', '2018-11-12', '2019-02-09', 100001, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Finishing  construction on plastering  gypsum', 'Improved', '2019-04-10', '2019-08-20', 100001, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Installation   construction on electric and s', 'Improved', '2019-04-10', '2019-08-20', 100001, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Finishing  construction on plastering  gypsum', 'Improved', '2018-11-02', '2019-02-01', 100001, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Finishing  construction on plastering  gypsum', 'Improved', '2018-11-12', '2019-03-08', 100000, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Installation   construction on electric and s', 'Improved', '2018-11-02', '2019-02-01', 100002, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'leather Garment-1-VIS', 'Improved', '2018-11-12', '2019-03-08', 100000, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Leather Goods-2-concern', 'Improved', '2019-04-10', '2019-08-20', 100001, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Installation   construction on electric and s', 'Improved', '2018-11-12', '2019-03-08', 100000, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'leather Garment-2-VIS', 'Improved', '2019-06-10', '2019-08-11', 100000, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-06-10', 'finishing construction on plastering tilling ', 'Improved', '2018-11-12', '2019-02-12', 100001, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Leather Goods-1-PIN', 'Improved', '2018-11-02', '2019-02-01', 100002, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-04-15', 'Footwear-1-PIN', 'Improved', '2018-11-02', '2019-02-01', 100002, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-04-15', 'Footwear-2-PIN', 'Improved', '2019-04-22', '2019-07-31', 100002, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-04-15', 'Leather Goods -2-PIN', 'Improved', '2019-04-15', '2019-07-31', 100005, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-04-15', 'Footwear -1-VIS', 'Improved', '2018-11-27', '2019-02-22', 100001, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-04-15', 'Footwear -2-VIS', 'Improved', '2019-06-10', '2019-08-11', 100000, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', '', '1970-01-01', '', '', '1970-01-01', '1970-01-01', 0, '', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-04-15', 'Footwear -1-VIS', 'Improved', '2018-11-28', '2019-03-13', 100000, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Finishing  construction on plastering  gypsum', 'Improved', '2019-06-10', '2019-08-11', 100000, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-06-10', 'finishing construction on plastering tilling ', 'Improved', '2018-11-12', '2019-02-09', 100001, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-06-10', 'finishing construction on plastering tilling ', 'Improved', '2018-11-12', '2019-03-08', 100000, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-06-10', 'finishing construction on plastering tilling ', 'Improved', '2019-06-10', '2019-08-11', 100000, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Installation   construction on electric and s', 'Improved', '2019-06-10', '2019-08-11', 100000, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Leather Goods-1-VIS', 'Improved', '2018-11-27', '2019-02-22', 100001, '3', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', '', '1970-01-01', '', '', '1970-01-01', '1970-01-01', 0, '', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2019-04-15', 'Finishing  construction on plastering  gypsum', 'Improved', '2019-05-15', '2019-07-26', 100002, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx'),
('', 'Addis Ababa', '2018-11-05', 'Installation   construction on electric and s', 'Improved', '2019-05-15', '2019-07-26', 100002, '4', 1, '2020-02-17 00:00:00', 'Lot1_17Feb20_0939.xls.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_tvet_training_bkp`
--

CREATE TABLE `xls_import_tvet_training_bkp` (
  `woreda` varchar(45) DEFAULT NULL,
  `region` varchar(45) NOT NULL,
  `entry_point_date` date NOT NULL,
  `training_name` varchar(45) NOT NULL,
  `training_type` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `tvet_name` bigint(20) NOT NULL,
  `valuechain` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `post_date` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `year_master`
--

CREATE TABLE `year_master` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `value` varchar(25) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `year_master`
--

INSERT INTO `year_master` (`id`, `name`, `value`, `status`) VALUES
(1, '2018', '', 1),
(2, '2019', '', 1),
(3, '2020', '', 1),
(4, '2021', '', 1),
(5, '2022', '', 1),
(6, '2017', '', 1),
(7, '2016', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emptype`
--
ALTER TABLE `emptype`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `import_beneficiaries`
--
ALTER TABLE `import_beneficiaries`
  ADD PRIMARY KEY (`beneficiary_id`,`entry_date_to_since`),
  ADD KEY `id` (`id`),
  ADD KEY `beneficiary_id` (`beneficiary_id`),
  ADD KEY `beneficiary_id_2` (`beneficiary_id`);

--
-- Indexes for table `import_beneficiary_trainings`
--
ALTER TABLE `import_beneficiary_trainings`
  ADD PRIMARY KEY (`beneficiary_id`,`start_date`,`end_date`),
  ADD KEY `beneficiary_id` (`beneficiary_id`),
  ADD KEY `beneficiary_id_2` (`beneficiary_id`),
  ADD KEY `beneficiary_id_3` (`beneficiary_id`);

--
-- Indexes for table `import_job_placement`
--
ALTER TABLE `import_job_placement`
  ADD PRIMARY KEY (`beneficiary_id`,`sme_or_cpmpany_id`);

--
-- Indexes for table `import_smecompanies`
--
ALTER TABLE `import_smecompanies`
  ADD PRIMARY KEY (`enterprise_id`,`consortium`),
  ADD KEY `enterprise_id` (`enterprise_id`),
  ADD KEY `enterprise_id_2` (`enterprise_id`);

--
-- Indexes for table `import_tvet`
--
ALTER TABLE `import_tvet`
  ADD PRIMARY KEY (`tvet_id`,`region`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `tvet_id` (`tvet_id`),
  ADD KEY `tvet_id_2` (`tvet_id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lots_master`
--
ALTER TABLE `lots_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quarter_master`
--
ALTER TABLE `quarter_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tuser_type`
--
ALTER TABLE `tuser_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `mobile_no` (`mobile_no`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `valuechain_master`
--
ALTER TABLE `valuechain_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `xls_import_beneficiaries`
--
ALTER TABLE `xls_import_beneficiaries`
  ADD PRIMARY KEY (`beneficiary_id`,`entry_date_to_since`),
  ADD KEY `beneficiary_id` (`beneficiary_id`),
  ADD KEY `beneficiary_id_2` (`beneficiary_id`);

--
-- Indexes for table `xls_import_beneficiaries_bkp`
--
ALTER TABLE `xls_import_beneficiaries_bkp`
  ADD PRIMARY KEY (`beneficiary_id`,`entry_date_to_since`),
  ADD KEY `beneficiary_id` (`beneficiary_id`),
  ADD KEY `beneficiary_id_2` (`beneficiary_id`);

--
-- Indexes for table `xls_import_beneficiary_trainings`
--
ALTER TABLE `xls_import_beneficiary_trainings`
  ADD PRIMARY KEY (`beneficiary_id`,`training_module`,`start_date`);

--
-- Indexes for table `xls_import_beneficiary_trainings_bkp`
--
ALTER TABLE `xls_import_beneficiary_trainings_bkp`
  ADD PRIMARY KEY (`beneficiary_id`,`training_module`,`start_date`);

--
-- Indexes for table `xls_import_job_placement`
--
ALTER TABLE `xls_import_job_placement`
  ADD PRIMARY KEY (`beneficiary_id`,`sme_or_cpmpany_id`);

--
-- Indexes for table `xls_import_job_placement_bkp`
--
ALTER TABLE `xls_import_job_placement_bkp`
  ADD PRIMARY KEY (`beneficiary_id`,`sme_or_cpmpany_id`);

--
-- Indexes for table `xls_import_smecompanies`
--
ALTER TABLE `xls_import_smecompanies`
  ADD PRIMARY KEY (`enterprise_id`,`consortium`),
  ADD KEY `enterprise_id` (`enterprise_id`),
  ADD KEY `enterprise_id_2` (`enterprise_id`);

--
-- Indexes for table `xls_import_smecompanies_bkp`
--
ALTER TABLE `xls_import_smecompanies_bkp`
  ADD PRIMARY KEY (`enterprise_id`,`consortium`),
  ADD KEY `enterprise_id` (`enterprise_id`),
  ADD KEY `enterprise_id_2` (`enterprise_id`);

--
-- Indexes for table `xls_import_tvet`
--
ALTER TABLE `xls_import_tvet`
  ADD PRIMARY KEY (`tvet_id`,`region`),
  ADD KEY `tvet_id` (`tvet_id`),
  ADD KEY `tvet_id_2` (`tvet_id`);

--
-- Indexes for table `xls_import_tvet_bkp`
--
ALTER TABLE `xls_import_tvet_bkp`
  ADD PRIMARY KEY (`tvet_id`,`region`),
  ADD KEY `tvet_id` (`tvet_id`),
  ADD KEY `tvet_id_2` (`tvet_id`);

--
-- Indexes for table `year_master`
--
ALTER TABLE `year_master`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emptype`
--
ALTER TABLE `emptype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `import_beneficiaries`
--
ALTER TABLE `import_beneficiaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_tvet`
--
ALTER TABLE `import_tvet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=608;

--
-- AUTO_INCREMENT for table `lots`
--
ALTER TABLE `lots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lots_master`
--
ALTER TABLE `lots_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quarter_master`
--
ALTER TABLE `quarter_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tuser_type`
--
ALTER TABLE `tuser_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `valuechain_master`
--
ALTER TABLE `valuechain_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `year_master`
--
ALTER TABLE `year_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
