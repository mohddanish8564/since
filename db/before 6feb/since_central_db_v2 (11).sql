-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2020 at 08:05 AM
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
-- Database: `since_central_db_v2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `specifictargetgrp` (IN `custcolumn` VARCHAR(65), IN `Employment` VARCHAR(65), IN `Lot_1` VARCHAR(65))  BEGIN
   SELECT COUNT(job.`beneficiary_id`) FROM `xls_import_job_placement` as job  inner join xls_import_beneficiaries as bene on job.beneficiary_id=bene.beneficiary_id WHERE job.`placement_type` = Employment AND job.`consortium` like concat('%',Lot_1,'%') and  bene.target_group= custcolumn ;
END$$

DELIMITER ;

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
(327, 'xls_import_smecompanies', 152, 153, '2020-02-07 00:00:00');

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
  `status` int(1) NOT NULL DEFAULT 1,
  `postdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lots_master`
--

INSERT INTO `lots_master` (`id`, `lots_name`, `lots_id`, `region`, `status`, `postdate`) VALUES
(1, 'Lot1', 'Lot_1', 'Addis Ababa', 1, '2020-01-11'),
(2, 'Lot2', 'Lot_2', 'Amhara ', 1, '2020-01-12'),
(3, 'Lot3', 'Lot_3', 'Oromia', 0, '2020-01-30'),
(4, 'Lot4', 'Lot_4', 'SNNP', 0, '2020-01-30'),
(5, 'Lot5', 'Lot_5', 'Tigray', 0, '2020-01-30');

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
  `Employed` varchar(15) DEFAULT NULL,
  `consortium` varchar(30) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_beneficiaries`
--

INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(102499, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102500, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102501, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102502, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102503, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102504, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102505, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102506, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102507, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102508, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 2000, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102509, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102510, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102511, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102512, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102513, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102514, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102515, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102516, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102517, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102518, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102519, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Metal Works', 1000, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102520, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102521, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102522, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102523, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102524, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102525, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 4000, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102526, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102527, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102528, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102529, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102530, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102531, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102532, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102533, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102534, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102535, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102536, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102537, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102538, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102539, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Construction', 0, 0, 'Formal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102540, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 250, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102541, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102542, 'Female', 'Addis Ababa', '2018-08-31', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102543, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102544, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102545, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102546, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102547, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 200, 0, 'Informal', '1', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102548, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102549, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 750, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102550, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102551, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102552, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 300, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102553, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102554, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102555, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102556, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102557, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102558, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102559, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102560, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102561, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102562, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102563, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102564, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 550, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102565, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102566, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102567, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102568, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102569, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Formal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102570, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102571, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102572, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102573, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102574, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102575, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Formal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102576, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102577, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102578, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 200, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102579, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102580, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102581, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102582, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102583, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102584, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102585, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102586, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102587, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, '', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102588, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102589, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102590, 'Female', 'Addis Ababa', '2018-08-31', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102591, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102592, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102593, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102594, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102595, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102596, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102597, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102598, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102599, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102600, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102601, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102602, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102603, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102604, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102605, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102606, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102607, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102608, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102609, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102610, 'female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102611, 'female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102612, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102613, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102614, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102615, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102616, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 500, 0, 'Formal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102617, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102618, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102619, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102620, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102621, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102622, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102623, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'formal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102624, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102625, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102626, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102627, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102628, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102629, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102630, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102631, 'Male', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102632, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102633, 'Male', 'Addis Ababa', '2018-09-20', 'Returnee', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102634, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102635, 'Female', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102636, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102637, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Formal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102638, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102639, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102640, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102641, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102642, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '1', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102643, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102644, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102645, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102646, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102647, 'Male', 'Addis Ababa', '1970-01-01', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102648, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102649, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102650, 'Female', 'Addis Ababa', '1970-01-01', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102651, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102652, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102653, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102654, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102655, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102656, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102657, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102658, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102659, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102660, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102661, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102662, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102663, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102664, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102665, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102666, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102667, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102668, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102669, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102670, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102671, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102672, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102673, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102674, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102675, 'Male', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102676, 'female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102677, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 200, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102678, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102679, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102680, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102681, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102682, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102683, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102684, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102685, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102686, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102687, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102688, 'Female', 'Addis Ababa', '2018-09-20', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102689, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102690, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102691, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102692, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 650, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102693, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102694, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102695, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 1500, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102696, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102697, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102698, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102699, 'Female', 'Addis Ababa', '2018-08-31', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102700, 'Female', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102701, 'Female', 'Addis Ababa', '2018-08-31', 'Women beyond 36 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102702, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102703, 'Female', 'Addis Ababa', '2018-09-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102704, 'Female', 'Addis Ababa', '2018-08-31', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102705, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102706, 'Male', 'Addis Ababa', '2018-08-31', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102707, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102708, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102709, 'Male', 'Addis Ababa', '2018-09-20', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102710, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102711, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102712, 'Female', 'Addis Ababa', '2018-09-20', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102713, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102714, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 760, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102715, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 800, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102716, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102717, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 800, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102718, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 850, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102719, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 670, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102720, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 600, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102721, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Construction', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102722, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 560, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102723, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102724, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 580, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102725, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 570, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102726, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 560, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102727, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102728, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102729, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102730, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102731, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 600, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102732, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102733, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102734, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 720, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102735, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102736, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 900, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102737, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102738, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 750, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102739, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102740, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Construction', 560, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102741, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 800, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102742, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102743, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 850, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102744, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102745, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102746, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 600, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102747, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 690, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102748, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Construction', 730, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102749, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 690, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102750, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102751, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102752, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 680, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102753, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 730, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102754, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 670, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102755, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 690, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102756, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 870, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102757, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 850, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102758, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 580, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102759, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102760, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 900, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102761, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 700, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102762, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 850, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102763, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102764, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102765, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102766, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 570, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102767, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 720, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102768, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 600, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102769, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 600, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102770, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls');
INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(102771, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 560, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102772, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Construction', 720, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102773, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 680, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102774, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102775, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 600, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102776, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 560, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102777, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102778, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 850, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102779, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 760, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102780, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102781, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 600, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102782, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 850, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102783, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102784, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102785, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 500, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102786, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 850, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102787, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 670, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102788, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 690, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102789, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 740, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102790, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102791, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 900, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102792, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 900, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102793, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 680, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102794, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 900, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102795, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102796, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Construction', 870, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102797, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 750, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102798, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 850, 0, 'Informal', '1', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102799, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 600, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102800, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102801, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Construction', 560, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102802, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102803, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 680, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102804, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 870, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102805, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 570, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102806, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 750, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102807, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102808, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 800, 0, 'Informal', '1', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102809, 'Male', 'Addis Ababa', '2018-09-24', 'Returnee', 'Construction', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102810, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102811, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102812, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 850, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102813, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102814, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 670, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102815, 'Male', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 730, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102816, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 680, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102817, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 870, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102818, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 730, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102819, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 850, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102820, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 570, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102821, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102822, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102823, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 690, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102824, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102825, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 580, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102826, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102827, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 740, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102828, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 600, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102829, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 850, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102830, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102831, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102832, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102833, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102834, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 500, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102835, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 600, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102836, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102837, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102838, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 870, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102839, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102840, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102841, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 720, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102842, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 740, 0, 'Informal', '1', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102843, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102844, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 750, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102845, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 650, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102846, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102847, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 650, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102848, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 560, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102849, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 750, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102850, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 500, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102851, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 580, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102852, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 690, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102853, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 600, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102854, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102855, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 570, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102856, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Metal Works', 720, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102857, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 740, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102858, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Construction', 750, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102859, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 670, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102860, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 730, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102861, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102862, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 700, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102863, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 800, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102864, 'Female', 'Addis Ababa', '2018-09-24', 'Returnee', 'Construction', 580, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102865, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 670, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102866, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 720, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102867, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 800, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102868, 'Male', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102869, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102870, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 650, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102871, 'Female', 'Addis Ababa', '2018-09-24', 'Women aged  35 and above', 'Leather', 870, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102872, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102873, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102874, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Leather', 560, 0, 'Informal', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102875, 'Female', 'Addis Ababa', '2018-09-24', 'Youth/Potential Migrant', 'Construction', 740, 0, 'Informal', '', '', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102876, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102877, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 2300, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102878, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102879, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102880, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 950, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102881, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102882, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102883, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102884, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 2300, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102885, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102886, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102887, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 2300, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102888, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102889, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102890, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102891, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102892, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Construction', 2300, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102893, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102894, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102895, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102896, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102897, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102898, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102899, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102900, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102901, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 2300, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102902, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102903, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102904, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102905, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102906, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102907, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102908, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102909, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102910, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 950, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102911, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102912, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102913, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102914, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102915, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102916, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102917, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102918, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102919, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102920, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102921, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102922, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102923, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 2300, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102924, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102925, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102926, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '1', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102927, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102928, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102929, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102930, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102931, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102932, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102933, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102934, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102935, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 2300, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102936, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102937, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 950, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102938, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102939, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102940, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102941, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102942, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102943, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102944, 'Male', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102945, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102946, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102947, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 950, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102948, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102949, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102950, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102951, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102952, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102953, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102954, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102955, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102956, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102957, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 950, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102958, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102959, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102960, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102961, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102962, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102963, 'Male', 'Addis Ababa', '2018-09-04', 'Returnee', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102964, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102965, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102966, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102967, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102968, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102969, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 2300, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102970, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102971, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102972, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102973, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 2300, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102974, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102975, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102976, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 950, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102977, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102978, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102979, 'Female', 'Addis Ababa', '2018-09-04', 'Women beyond 36(Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102980, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102981, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 950, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102982, 'Female', 'Addis Ababa', '2018-09-04', 'Women beyond 36(Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102983, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1100, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102984, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102985, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 2300, 0, 'Informal', '', '1', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102986, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102987, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102988, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 950, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102989, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102990, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 2200, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102991, 'Male', 'Addis Ababa', '2018-09-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102992, 'Female', 'Addis Ababa', '2018-09-04', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102993, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 950, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102994, 'Female', 'Addis Ababa', '2018-09-04', 'Returnee', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_CHADET_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102996, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102997, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102998, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(102999, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103000, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103001, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103002, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '1', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103003, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 1000, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103004, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103005, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103006, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103007, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103008, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103009, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103010, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103011, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 960, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103012, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103013, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103014, 'male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103015, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103016, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 10000, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103017, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103018, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103019, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103020, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '1', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103021, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103022, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '1', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103023, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103024, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103025, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 700, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103026, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 400, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103027, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103028, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 900, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103029, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103030, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '1', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103031, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103032, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 1000, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103033, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103034, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103035, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103036, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103037, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103038, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 800, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103039, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103040, 'male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103041, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 400, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103042, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls');
INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(103043, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103044, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103045, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103046, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103047, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103048, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103049, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103050, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103051, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103052, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 500, 0, 'informal', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103053, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103054, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103055, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103056, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103057, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103058, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 200, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103059, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 800, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103060, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 960, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103061, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103062, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103063, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 6000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103064, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103065, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103066, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103067, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103068, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103069, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, '', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103070, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103071, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103072, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103073, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103074, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103075, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103076, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103077, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103078, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103079, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103080, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 500, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103081, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103082, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103083, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 960, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103084, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103085, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103086, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103087, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103088, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103089, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103090, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103091, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103092, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103093, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103094, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103095, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103096, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'informal', '1', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103097, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103098, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103099, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103100, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103101, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 700, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103102, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103103, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103104, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103105, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103106, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 200, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103107, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103108, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103109, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103110, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103111, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103112, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103113, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103114, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 800, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103115, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103116, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103117, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103118, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103119, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103120, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103121, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103122, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103123, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 960, 0, 'informal', '1', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103124, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103125, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103126, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103127, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103128, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, '', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103129, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103130, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103131, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103132, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103133, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103134, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103135, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103136, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '1', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103137, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103138, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103139, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103140, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103141, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103142, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103143, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 1100, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103144, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103145, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103146, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103147, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 2500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103148, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103149, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103150, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103151, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103152, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103153, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103154, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103155, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103156, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103157, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103158, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103159, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103160, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103161, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103162, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103163, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 1000, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103164, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103165, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103166, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103167, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103168, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103169, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103170, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103171, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103172, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103173, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103174, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103175, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103176, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103177, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103178, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103179, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103180, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103181, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103182, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103183, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103184, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 3000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103185, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103186, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103187, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 300, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103188, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103189, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103190, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Construction', 2000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103191, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103192, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103193, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103194, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 960, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103195, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103196, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103197, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103198, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103199, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103200, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103201, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103202, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 931743000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103203, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103204, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103205, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 300, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103206, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 700, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103207, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103208, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103209, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103210, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 3000, 0, 'informal', '1', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103211, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103212, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103213, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103214, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103215, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 3500, 0, 'informal', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103216, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103217, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103218, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103219, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103220, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103221, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103222, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103223, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103224, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103225, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 2000, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103226, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 300, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103227, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103228, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103229, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103230, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103231, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103232, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 900, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103233, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103234, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 900, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103235, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 2500, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103236, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103237, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103238, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103239, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103240, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103241, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103242, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103243, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103244, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103245, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103246, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103247, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'informal', '', '1', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103248, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103249, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103250, 'Male', 'Addis Ababa', '2018-04-08', 'Returnee', 'Construction', 0, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103251, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103252, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103253, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103254, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103255, 'Male', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Formal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103256, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103257, 'Female', 'Addis Ababa', '2018-04-08', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103258, 'Female', 'Addis Ababa', '2018-04-08', 'Returnee', 'Leather', 200, 0, 'informal', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103259, 'Female', 'Addis Ababa', '2018-04-08', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(103260, 'Female', 'Addis Ababa', '2018-04-08', 'Youth (Potential Migrant)', 'Leather', 500, 0, '', '', '', 'Lot_1_CWW_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743039, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743040, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743041, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'formal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743042, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743043, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743044, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743045, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743046, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743047, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743048, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743049, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743050, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743051, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743052, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743053, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743054, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743055, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743056, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743057, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743058, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743059, 'Female', 'Addis Ababa', '2018-07-20', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743060, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743061, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743062, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743063, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743064, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743065, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 500, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743066, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743067, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743068, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743069, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743070, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743071, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743072, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743073, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743074, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743075, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743076, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743077, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743078, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743079, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743080, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743081, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743082, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743083, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743084, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743085, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743086, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743087, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743088, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, '', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743089, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743090, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743091, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743092, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743093, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743094, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743095, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743096, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743097, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743098, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls');
INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(931743099, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743100, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743101, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743102, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743103, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743104, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743105, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743106, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743107, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743108, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743109, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743110, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743111, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743112, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 600, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743113, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '1', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743114, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743115, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, '', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743116, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743117, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743118, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743119, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743120, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743121, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743122, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743123, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743124, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743125, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743126, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743127, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743128, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743129, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743130, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743131, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743132, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743133, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743134, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743135, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743136, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743137, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743138, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743139, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743140, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743141, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743142, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743143, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743144, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743145, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743146, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743147, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743148, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743149, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743150, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743151, 'Male', 'Addis Ababa', '2019-03-02', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743152, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743153, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743154, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743155, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743156, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743157, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743158, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743159, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743160, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743161, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743162, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743163, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743164, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743165, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743166, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743167, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743168, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743169, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743170, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743171, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743172, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743173, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743174, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743175, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743176, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743177, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743178, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743179, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743180, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743181, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743182, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743183, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743184, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743185, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743186, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743187, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743188, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743189, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743190, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743191, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743192, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743193, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743194, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743195, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743196, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743197, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743198, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743199, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743200, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743201, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743202, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743203, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743204, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743205, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743206, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743207, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743208, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743209, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743210, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743211, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743212, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743213, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743214, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743215, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743216, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743217, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743218, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743219, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743220, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743221, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743222, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743223, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743224, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743225, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743226, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743227, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743228, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743229, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743230, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743231, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743232, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743233, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743234, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743235, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743236, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743237, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743238, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743239, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743240, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743241, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743242, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743243, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743244, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743245, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743246, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743247, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743248, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743249, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743250, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743251, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743252, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743253, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743254, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743255, 'Female', 'Addis Ababa', '2019-04-01', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743256, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743257, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743258, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743259, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743260, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743261, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743262, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743263, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743264, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743265, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743266, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743267, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743268, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743269, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743270, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743271, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743272, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743273, 'Male', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743274, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743275, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743276, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743277, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743278, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743279, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743280, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743281, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743282, 'Male', 'Addis Ababa', '2019-03-02', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743283, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743284, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743285, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743286, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743287, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743288, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743289, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743290, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743291, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743292, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743293, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743294, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743295, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743296, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743297, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743298, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743299, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743300, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743301, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743302, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743303, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743304, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743305, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Metal Works', 0, 0, '', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743306, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743307, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743308, 'Female', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743309, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743310, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743311, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743312, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743313, 'Male', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743314, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743315, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743316, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743317, 'Male', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743318, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743319, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743320, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743321, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743322, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743323, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743324, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743325, 'Male', 'Addis Ababa', '2019-03-02', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743326, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743327, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743328, 'Male', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743329, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743330, 'Female', 'Addis Ababa', '2018-07-20', 'Youth Potential Migrant', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743331, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743332, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743333, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743334, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743335, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743336, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743337, 'Female', 'Addis Ababa', '2019-03-02', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743338, 'Female', 'Addis Ababa', '2018-07-20', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_VIS_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743339, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743340, 'Female', 'Addis Ababa', '2019-03-04', 'Women 15-35 (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743341, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743342, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743343, 'Female', 'Addis Ababa', '2019-03-04', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743344, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743345, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743346, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743347, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743348, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743349, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743350, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743351, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743352, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743353, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36(Potential Migrant)', 'Leather', 300, 0, 'Informal', '1', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743354, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743355, 'Female', 'Addis Ababa', '2019-03-04', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743356, 'Female', 'Addis Ababa', '2019-03-04', 'Women 15-35 (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743357, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743358, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743359, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743360, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 600, 0, 'Informal', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743361, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743362, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743363, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743364, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743365, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743366, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743367, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743368, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743369, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743370, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743371, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743372, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743373, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743374, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743375, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743376, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls');
INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(931743377, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743378, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743379, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36(Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743380, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743381, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743382, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743383, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743384, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743385, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743386, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743387, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743388, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743389, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743390, 'Female', 'Addis Ababa', '2019-03-04', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743391, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743392, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743393, 'Female', 'Addis Ababa', '2019-03-04', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743394, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743395, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743396, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743397, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743398, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743399, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743400, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743401, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743402, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743403, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743404, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743405, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 400, 0, 'Informal', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743406, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743407, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743408, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743409, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743410, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743411, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743412, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743413, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '1', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743414, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743415, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743416, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743417, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743418, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743419, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743420, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36(Potential Migrant)', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743421, 'Female', 'Addis Ababa', '2019-03-04', 'returnee', 'Leather', 900, 0, 'Formal', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743422, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743423, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743424, 'Female', 'Addis Ababa', '2019-03-04', 'returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743425, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743426, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743427, 'Female', 'Addis Ababa', '2019-03-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743428, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 300, 0, 'Informal', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743429, 'Female', 'Addis Ababa', '2019-03-04', 'Women 15-35 (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743430, 'Female', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743431, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743432, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743433, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743434, 'Male', 'Addis Ababa', '2019-03-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743435, 'Female', 'Addis Ababa', '2019-03-04', 'Returnee', 'Leather', 0, 0, '', '', '', 'Lot_1_CHADET_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743436, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743437, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743438, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743439, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743440, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1250, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743441, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1680, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743442, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 2100, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743443, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 2300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743444, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36(Potential Migrant)', 'Leather', 850, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743445, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1350, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743446, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743447, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1500, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743448, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743449, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2450, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743450, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743451, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1750, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743452, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743453, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743454, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743455, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743456, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743457, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1600, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743458, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1400, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743459, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743460, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743461, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743462, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1700, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743463, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743464, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743465, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743466, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1700, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743467, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743468, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743469, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743470, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743471, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743472, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743473, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743474, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1450, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743475, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1600, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743476, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743477, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743478, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743479, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1450, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743480, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743481, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1600, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743482, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1600, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743483, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1350, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743484, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1500, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743485, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743486, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743487, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1350, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743488, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743489, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1600, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743490, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743491, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743492, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743493, 'Female', 'Addis Ababa', '2019-03-28', 'Women beyond 36(Potential Migrant)', 'Leather', 1400, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743494, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743495, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2100, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743496, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743497, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1600, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743498, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1700, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743499, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743500, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1800, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743501, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 2100, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743502, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743503, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743504, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743505, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743506, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743507, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743508, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743509, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1450, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743510, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1600, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743511, 'Female', 'Addis Ababa', '2019-03-28', 'Women beyond 36(Potential Migrant)', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743512, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1600, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743513, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743514, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 2000, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743515, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743516, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 2700, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743517, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743518, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 3000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743519, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743520, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743521, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743522, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1850, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743523, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743524, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743525, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743526, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743527, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743528, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36(Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743529, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36(Potential Migrant)', 'Leather', 1100, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743530, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 2100, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743531, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1700, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743532, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743533, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743534, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1100, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743535, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743536, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1900, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743537, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Construction', 2000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743538, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Construction', 2300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743539, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Construction', 1800, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743540, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743541, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743542, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2100, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743543, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743544, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743545, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2800, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743546, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1450, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743547, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 2300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743548, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743549, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 4500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743550, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 2500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743551, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743552, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1600, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743553, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743554, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743555, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743556, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743557, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36(Potential Migrant)', 'Leather', 2000, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743558, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743559, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743560, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743561, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743562, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1350, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743563, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743564, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1550, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743565, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 2000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743566, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743567, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36(Potential Migrant)', 'Leather', 1500, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743568, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743569, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 2100, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743570, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743571, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Construction', 1800, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743572, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1900, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743573, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743574, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743575, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743576, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1300, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743577, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1500, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743578, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743579, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743580, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743581, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743582, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743583, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1450, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743584, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1800, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743585, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Construction', 1900, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743586, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1600, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743587, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743588, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 2300, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743589, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36(Potential Migrant)', 'Leather', 1800, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743590, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743591, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 2000, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743592, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 2100, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743593, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Construction', 1500, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743594, 'Female', 'Addis Ababa', '2019-03-28', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743595, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743596, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1300, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743597, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1900, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743598, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743599, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1400, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743600, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743601, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1800, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743602, 'Male', 'Addis Ababa', '2018-09-24', 'Women beyond 36(Potential Migrant)', 'Construction', 1100, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743603, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Construction', 1600, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743604, 'Male', 'Addis Ababa', '2019-03-28', 'Youth (Potential Migrant)', 'Leather', 1900, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743605, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743606, 'Female', 'Addis Ababa', '2018-09-24', 'Women beyond 36(Potential Migrant)', 'Leather', 1100, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743607, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Leather', 1700, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743608, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743609, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1200, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743610, 'Female', 'Addis Ababa', '2018-09-24', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1700, 0, 'informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743611, 'Male', 'Addis Ababa', '2018-09-24', 'Youth (Potential Migrant)', 'Construction', 1800, 0, 'Informal', '', '', 'Lot_1_PIN_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743613, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 900, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743614, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743615, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743616, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743617, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743618, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 1100, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743619, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743620, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743621, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 960, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743622, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Metal Works', 900, 0, 'Formal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743623, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 400, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743624, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743625, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743626, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743627, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743628, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743629, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743630, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743631, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 600, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743632, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743633, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743634, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743635, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743636, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743637, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743638, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743639, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743640, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 200, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743641, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743642, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls');
INSERT INTO `xls_import_beneficiaries` (`beneficiary_id`, `sex`, `region`, `entry_date_to_since`, `target_group`, `value_chain`, `entry_point_income`, `endline_income`, `type_of_income`, `disabled`, `Employed`, `consortium`, `status`, `postdate`, `file_name`) VALUES
(931743643, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743644, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743645, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743646, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743647, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743648, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743649, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743650, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743651, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743652, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743653, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743654, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743655, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743656, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743657, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743658, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743659, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743660, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743661, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743662, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743663, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743664, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743665, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743666, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743667, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743668, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743669, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743670, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743671, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743672, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743673, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743674, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743675, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743676, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743677, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743678, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743679, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743680, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 500, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743681, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743682, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743683, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743684, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743685, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743686, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743687, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743688, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743689, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743690, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743691, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743692, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743693, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743694, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743695, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743696, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743697, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743698, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743699, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743700, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743701, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743702, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743703, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743704, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743705, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743706, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743707, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743708, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743709, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743710, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743711, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743712, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743713, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743714, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743715, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743716, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743717, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743718, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743719, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743720, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743721, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743722, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743723, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743724, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743725, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743726, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743727, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743728, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743729, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743730, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743731, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 200, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743732, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743733, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743734, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743735, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743736, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743737, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743738, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743739, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743740, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743741, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743742, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743743, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743744, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743745, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743746, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743747, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743748, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1500, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743749, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743750, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743751, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743752, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743753, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743754, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743755, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743756, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743757, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743758, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743759, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743760, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743761, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743762, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743763, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743764, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743765, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743766, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743767, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743768, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743769, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743770, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743771, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743772, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743773, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743774, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743775, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743776, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743777, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743778, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743779, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743780, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743781, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743782, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743783, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743784, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743785, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743786, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743787, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743788, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743789, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743790, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743791, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743792, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743793, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743794, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743795, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 400, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743796, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 200, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743797, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743798, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743799, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743800, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743801, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743802, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743803, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743804, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743805, 'MALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743806, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743807, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743808, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743809, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743810, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743811, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 800, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743812, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743813, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743814, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743815, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743816, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743817, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 1500, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743818, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743819, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743820, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743821, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743822, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743823, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743824, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743825, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743826, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 500, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743827, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743828, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743829, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743830, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743831, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743832, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743833, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743834, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743835, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743836, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743837, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743838, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743839, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743840, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743841, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 800, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743842, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743843, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743844, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743845, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 1000, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743846, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743847, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743848, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743849, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women beyond 36(Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743850, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743851, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743852, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743853, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743854, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Metal Works', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743855, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743856, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743857, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 1200, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743858, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 900, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743859, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743860, 'MALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Construction', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743861, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Returnee', 'Leather', 1200, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743862, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Youth (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743863, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743864, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743865, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743866, 'FEMALE', 'Addis Ababa', '2018-08-04', 'Women 15 - 35 (Potential Migrant)', 'Leather', 0, 0, 'Informal', '', '', 'Lot_1_CWW_2nd_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743868, 'FEMALE', 'Addis Ababa', '2018-09-24', 'Returnee', 'Leather', 1200, 0, 'Informal Income', '', '1', 'Lot_1_PIN_1st_batch', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743870, 'Female', 'Addis Ababa', '2019-12-18', 'Women 15 - 35 (Potential Migrant)', 'Construction', 0, 0, '', '', '', '', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743872, 'Male', 'Addis Ababa', '2020-01-26', 'Women 15 - 35 (Potential Migrant)', 'Construction', 11, 11, 'Formal Income', '', '', '', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(931743873, 'Male', 'Addis Ababa', '2020-02-02', 'Women 15 - 35 (Potential Migrant)', 'Construction', 0, 0, '', '', '', '', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls');

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
  `status` int(1) NOT NULL,
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
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Is_Training_completed` varchar(15) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `avreage_income` int(8) NOT NULL,
  `unemployment` int(8) NOT NULL,
  `data_entry_point` varchar(25) NOT NULL,
  `Consortium` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `avreage_income` int(8) NOT NULL,
  `unemployment` int(8) NOT NULL,
  `data_entry_point` varchar(25) NOT NULL,
  `Consortium` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_oo_indicators34`
--

CREATE TABLE `xls_import_oo_indicators34` (
  `region` varchar(45) NOT NULL,
  `consortium` varchar(45) NOT NULL,
  `avreage_income_base` varchar(7) NOT NULL,
  `average_income_end` int(7) NOT NULL,
  `unemployment_base` int(7) NOT NULL,
  `unemployment_end` int(7) NOT NULL,
  `age_group` varchar(15) DEFAULT NULL,
  `sex` varchar(15) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_oo_indicators34_bkp`
--

CREATE TABLE `xls_import_oo_indicators34_bkp` (
  `region` varchar(45) NOT NULL,
  `consortium` varchar(45) NOT NULL,
  `avreage_income_base` varchar(7) NOT NULL,
  `average_income_end` int(7) NOT NULL,
  `unemployment_base` int(7) NOT NULL,
  `unemployment_end` int(7) NOT NULL,
  `age_group` varchar(20) DEFAULT NULL,
  `sex` varchar(15) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
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
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_pp_bkp`
--

CREATE TABLE `xls_import_pp_bkp` (
  `value_Chain` varchar(65) NOT NULL,
  `consortium` varchar(45) NOT NULL,
  `agr_date` date NOT NULL,
  `decent_work_principles` varchar(15) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` datetime NOT NULL,
  `file_name` varchar(65) DEFAULT NULL,
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
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
  `since_supported` varchar(10) NOT NULL,
  `value_chain` varchar(30) NOT NULL,
  `end_line_capacity_level` int(2) NOT NULL,
  `entry_point_capacity_level` int(2) NOT NULL,
  `agr_decent_work_principle` varchar(10) NOT NULL,
  `emp_no_entry_point` int(6) NOT NULL,
  `emp_no_end_line` int(6) NOT NULL,
  `status` int(1) NOT NULL,
  `postdate` date NOT NULL,
  `file_name` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xls_import_smecompanies`
--

INSERT INTO `xls_import_smecompanies` (`enterprise_id`, `name`, `is_sme`, `region`, `consortium`, `since_supported`, `value_chain`, `end_line_capacity_level`, `entry_point_capacity_level`, `agr_decent_work_principle`, `emp_no_entry_point`, `emp_no_end_line`, `status`, `postdate`, `file_name`) VALUES
(100105, 'EIFCCOS', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 0, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100106, 'EIFCCOS(Mesalemiya Branch)', 'SME', 'Addis Ababa', 'Lot_1_CHADET', '1', 'Leather', 0, 0, '1', 0, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100107, 'Biniam', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 32, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100108, 'Abel Getnet', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100109, 'Mekuria Temesgen', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 10, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100110, 'Yonas Asrat', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 200, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100111, 'Nesiru Kedir', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 0, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100112, 'Helen Niguse', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 4, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100113, 'Tesfanesh dame', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 8, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100114, 'Million Mamo', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 11, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100115, 'Kumneger Mesele', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100116, 'Getachew Teka', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 3, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100117, 'Bahiru Erfeto', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100118, 'Tewdros Adane', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100119, 'Wendimagegn Mesay', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100120, 'Melaku Tilahun', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 8, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100121, 'Nicolas Legesse', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 25, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100122, 'Admasu Getachew', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 8, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100123, 'Solomon Galgale', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 2, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100124, 'Seto Sitotaw', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 12, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100125, 'Minalebesh Mandefro', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 4, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100126, 'Yonas Sertsedingil', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100127, 'Gugsa Gurara', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100128, 'Kalkidan Getachew', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100129, 'Beshaw Habte', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100130, 'Sintayehu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 23, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100131, 'Tilahun', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100132, 'Yonel', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100133, 'Tamirat', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 2, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100134, 'Tadele Barecha', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100135, 'Bahiru Arego', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 1, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100136, 'Abera', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 11, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100137, 'Andamlak Endashaw', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100138, 'Fikat Mola', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 11, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100139, 'Sintayehu Sahile', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 2, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100140, 'Ejigu Abogosh', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 2, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100141, 'Adane Biratu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 4, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100142, 'Abera Shehamolo', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 1, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100143, 'Abreham Aseffa', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100144, 'Fantahun H/Wold', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 10, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100145, 'Eshetu Getachew', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 20, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100146, 'Bereket Negash', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 4, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100147, 'Adamsaged Deneke', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 4, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100148, 'Wendimagegn', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100149, 'Solomon Ayalkibet', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 2, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100150, 'Sirwana Adane', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 2, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100151, 'Birhanu Sema', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 3, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100152, 'Aschalew', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 11, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100153, 'Getu Desalegn', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 32, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100154, 'Betlehem Tusi', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 2, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100155, 'Shewalem Zergaye', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 4, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100156, 'Ayenew H/Silase', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 50, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100157, 'Tigistu Dermolo', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 2, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100158, 'Tesfaye Melese', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 12, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100159, 'Demeke Teka', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100160, 'Kasahun atinafu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 0, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100161, 'Teshale Worku', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100162, 'Melaku Alemu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 2, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100163, 'Tekle Feyiso', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 9, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100164, 'Mekonnen Talila', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 15, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100165, 'Teshome G/ Michael', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 4, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100166, 'Muluneh Alemu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 10, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100167, 'Kidane Haile', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 8, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100168, 'Woynishet Andiye', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 15, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100169, 'Esans Alemu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 20, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100170, 'Teshome Adnew', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 21, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100171, 'Isayas', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 8, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100172, 'Teshome', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 13, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100173, 'Tadesse', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 42, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100174, 'Zewude', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 120, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100175, 'Amare', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 20, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100176, 'Zeneb Tesfaye', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 3, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100177, 'Million Galaye', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 4, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100178, 'Belay Aseffa', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 18, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100179, 'Asmare H/mariam', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 10, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100180, 'Solomon Alemu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100181, 'Ayele Husen', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 11, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100182, 'Yonas Andiye', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 30, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100183, 'Endashaw Lema', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 10, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100184, 'Begashaw H/ Mariam', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 10, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100185, 'Nigusse Miskir', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 8, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100186, 'Yonas Sarko', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100187, 'Tesfanesh Nigusse', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 3, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100188, 'Tesfaye  Regasa', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100189, 'Thomas Shermolo', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100190, 'Mulugeta Sidamo', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100191, 'Gerume  Haile', 'SME', 'Addis Ababa', 'Lot_1_PIN', '1', 'Leather', 0, 0, '1', 3, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100192, 'Shifraw Mentesinot', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 12, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100193, 'Aboneh Sema', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 9, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100194, 'Belete Alemu', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100195, 'Yonael G/Kidan', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 11, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100196, 'Takele Feyiso', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100197, 'Nigusse Demise', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 9, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100198, 'Tariku Zeregay/Esayas', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100199, 'Asebeha Abereha', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100200, 'Nuri Oremano', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100201, 'Fikire Denbele', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100202, 'Anduamlak Endashaw', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 8, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100203, 'Fikadu Sareko', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 8, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100204, 'Muluken Tadele', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 11, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100205, 'Showalem', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100206, 'Abebaw Teferi', 'SME', 'Addis Ababa', 'Lot_1_PIN', '', 'Leather', 0, 0, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100207, 'Demisew and Getachew GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 14, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100208, 'Bethelhem ,Berket and and friends', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 22, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100209, 'Meaza Gebru GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 12, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100210, 'Teferi Geremew and Friends Sanitory', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 4, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100211, 'Berhane and Hirut Block Manufucturing', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 10, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100212, 'Gebretsadik and Akililu GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 23, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100213, 'Tesfalem Asaye and Friends GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 30, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100214, 'Mohamed Dewam', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 16, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100215, 'Ibrahim Andualem and Friends Co.', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 17, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100216, 'Abdulkerim,Solomon and Friends', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 10, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100217, 'Hailemariam,Elshaday and Frieds', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 10, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100218, 'Habtewold and Getnet E/Installation', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100219, 'Demeke,Mesfin and Friends Block Production', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 15, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100220, 'Tilahun,Dereje and Friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 12, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100221, 'Shimelis,Andebet,Hayder and Friends Terazo', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 24, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100222, 'Behailu and Hailesillasie BC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 12, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100223, 'Grow Up Construction', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 17, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100224, 'Kidane Aymut Construction Inputs SSer', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 11, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100225, 'Abeselom and Ermias BC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, '1', 52, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100226, 'Tsegaye Teklay and Friends Co.', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 9, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100227, 'Kidu G/Michael GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 4, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100228, 'Berhanu and Gebremichael GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100229, 'Samuel,Winta and Friends Co.', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 12, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100230, 'Melese,Anguach and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 19, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100231, 'Ezira,Hirut and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, '1', 26, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100232, 'Ebistie,Aregash and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 0, '1', 3, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100233, 'Abebaye,Gete and friends Co', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100234, 'Ermias,Mekdes and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, '1', 44, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100235, 'Minassie,Eshete and their friends  BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, '1', 12, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100236, 'Leykun,Endale,and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 11, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100237, 'Tamirat,Gezahegn and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 13, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100238, 'Dagnachew,Selamawit and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, '1', 53, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100239, 'Abebaw,Mahlet,Bekalu and their friends GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 17, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100240, 'Minilik,Gudina and their friends BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, '1', 37, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100241, 'Hiwot Hailemichael GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 20, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100242, 'Gelana Mekonnon GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 32, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100243, 'Bedru Arege Hamote GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 26, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100244, 'Duresa Abe GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 17, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100245, 'Yohannes,Tsega and their friends', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 20, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100246, 'FRANO GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 12, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100247, 'A to Z', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, '1', 29, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100248, 'Eleni and Ashenafi GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, '1', 6, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100249, 'Dream Big', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 23, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100250, 'Melaku,Sosina and friends GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 40, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100251, 'Wubayehuand Temesgen', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, '1', 30, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100252, 'Solomon and Daniel GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 15, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100253, 'Asefash,Rahel and their friends GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 33, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100254, 'Fitsum,Eyuel and their friends Stone Cutting', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 3, '1', 7, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100255, 'Yitbarek and Azimera GC', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 2, '1', 5, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100256, 'Berhanu,Bedilu and friens BP', 'SME', 'Addis Ababa', 'Lot_1_CWW', '1', 'Construction', 0, 1, '1', 13, 0, 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls');

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
(100105, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100106, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CHADET', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100107, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100108, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100109, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100110, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100111, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100112, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100113, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100114, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100115, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100116, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100117, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100118, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100119, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100120, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100121, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100122, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100123, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100124, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100125, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100126, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100127, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100128, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100129, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100130, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100131, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100132, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100133, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100134, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100135, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100136, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100137, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100138, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100139, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100140, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100141, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100142, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100143, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100144, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100145, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100146, 'Managerial Training', '2019-03-10', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100147, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100148, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100149, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100150, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100151, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100152, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100153, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100154, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100155, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100156, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100157, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100158, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100159, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100160, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100161, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100162, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100163, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100164, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100165, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100166, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100167, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100168, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100169, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100170, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100171, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100172, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100173, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100174, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100175, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100176, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100177, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100178, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100179, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100180, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100181, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100182, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100183, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100184, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100185, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100186, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100187, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100188, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100189, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100190, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100191, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100192, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100193, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100194, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100195, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100196, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100197, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100198, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100199, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100200, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100201, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100202, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100203, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100204, 'Managerial Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100205, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100206, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100207, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100208, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100209, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100210, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100211, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100212, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100213, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100214, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100215, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100216, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100217, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100218, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100219, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100220, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100221, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100222, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100223, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100224, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100225, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100226, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100227, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100228, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100229, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100230, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100231, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100232, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100233, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100234, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100235, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100236, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100237, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100238, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100239, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100240, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100241, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100242, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100243, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100244, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100245, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100246, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100247, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100248, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100249, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100250, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100251, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100252, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100253, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100254, 'Market Training', '2019-09-29', 'Quarter 3 (2019)', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100233, 'Market Training', '2019-12-17', '', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100233, 'Market Training', '2019-12-17', '', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100175, 'vx b', '2020-01-01', '', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100206, '', '1970-01-01', '', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100247, 'assxz', '2020-01-06', '', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100239, 'Linkages Facilitation', '1970-01-01', '', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100142, 'dx', '2020-01-08', '', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100108, 'Sub Contracting', '2020-01-23', '', 'Addis Ababa', 'Lot_1_PIN', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100239, 'Managerial Training', '1970-01-01', '', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls'),
(100239, 'Linkages Facilitation', '2020-01-21', '', 'Addis Ababa', 'Lot_1_CWW', 1, '2020-02-07 00:00:00', 'Lot1_6Feb20_1641 (2).xls');

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
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
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
(100000, 'General Wingate College11', 'Addis Ababa', 'Public', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100001, 'Lideta Manufacturing College', 'Addis Ababa', 'Public', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100002, 'Misrak Polytechnic College', 'Addis Ababa', 'Public', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100005, 'Yeka Industrial College', 'Addis Ababa', 'Public', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100008, 'Entoto PTC', 'Addis Ababa', 'Public', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100009, 'Addis Ketema Manufacturing College', 'Addis Ababa', 'Public', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100010, 'General Wingate College', 'Addis Ababa', '', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls'),
(100011, 'General Wingate College', 'Addis Ababa', 'Public', 1, '2020-02-07', 'Lot1_6Feb20_1641 (2).xls');

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
  `backup_postdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_tvet_training`
--

CREATE TABLE `xls_import_tvet_training` (
  `woreda` varchar(45) DEFAULT NULL,
  `region` varchar(45) NOT NULL,
  `consortium` varchar(15) DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `xls_import_tvet_training_bkp`
--

CREATE TABLE `xls_import_tvet_training_bkp` (
  `woreda` varchar(45) DEFAULT NULL,
  `region` varchar(45) NOT NULL,
  `consortium` varchar(15) DEFAULT NULL,
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
  ADD PRIMARY KEY (`beneficiary_id`,`start_date`,`end_date`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
