-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 16, 2021 at 04:01 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `military`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(2, 'Clive Dela Cruz', 'clive@yahoo.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-12-16 20:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `tblauthors`
--

CREATE TABLE IF NOT EXISTS `tblauthors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` varchar(250) DEFAULT NULL,
  `ename` varchar(250) DEFAULT NULL,
  `etype` varchar(250) DEFAULT NULL,
  `esalary` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `eid`, `ename`, `etype`, `esalary`) VALUES
(19, '2', 'a', 'b', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbldoctor`
--

CREATE TABLE IF NOT EXISTS `tbldoctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `did` varchar(100) DEFAULT NULL,
  `dname` varchar(120) DEFAULT NULL,
  `mid` varchar(120) DEFAULT NULL,
  `mname` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `StudentId` (`did`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `tbldoctor`
--

INSERT INTO `tbldoctor` (`id`, `did`, `dname`, `mid`, `mname`) VALUES
(20, '11', 'aa', '11', 'aa');

-- --------------------------------------------------------

--
-- Table structure for table `tblsoldier`
--

CREATE TABLE IF NOT EXISTS `tblsoldier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(150) DEFAULT NULL,
  `sname` varchar(150) DEFAULT NULL,
  `sage` int(2) NOT NULL,
  `ssalary` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `tblsoldier`
--

INSERT INTO `tblsoldier` (`id`, `sid`, `sname`, `sage`, `ssalary`) VALUES
(19, '1', 'a', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbltransport`
--

CREATE TABLE IF NOT EXISTS `tbltransport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) DEFAULT NULL,
  `tname` varchar(150) DEFAULT NULL,
  `ttype` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `tbltransport`
--

INSERT INTO `tbltransport` (`id`, `tid`, `tname`, `ttype`) VALUES
(13, 1, 'a', 'a'),
(14, 2, 'a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE IF NOT EXISTS `tbluser` (
  `uid` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`uid`, `FullName`, `EmailId`, `MobileNumber`, `Password`) VALUES
('1', 'Niranjan', 'niranjan@gmail.com', '1111111111', '47bce5c74f589f4867dbd57e9ca9f808');

-- --------------------------------------------------------

--
-- Table structure for table `tblweapons`
--

CREATE TABLE IF NOT EXISTS `tblweapons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` varchar(255) DEFAULT NULL,
  `wname` varchar(250) DEFAULT NULL,
  `issued` varchar(250) DEFAULT NULL,
  `types` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tblweapons`
--

INSERT INTO `tblweapons` (`id`, `wid`, `wname`, `issued`, `types`) VALUES
(12, '1', 'a', 'niranjan', 'a');
