-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 20, 2018 at 02:15 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `addcourse`
--

CREATE TABLE IF NOT EXISTS `addcourse` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(50) NOT NULL,
  `Semester` varchar(50) NOT NULL,
  `Status` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CourseName` (`CourseName`,`Semester`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `addcourse`
--

INSERT INTO `addcourse` (`id`, `CourseName`, `Semester`, `Status`) VALUES
(25, 'mca', '6', 1),
(29, 'B.tech', '8', 1),
(30, 'atmm', '4', 1),
(31, 'BA', '6', 0),
(32, 'humanvalue', '2', 1),
(33, 'b.pharma', '8', 1),
(34, 'BBA', '6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addexamination`
--

CREATE TABLE IF NOT EXISTS `addexamination` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `ExaminationName` varchar(50) NOT NULL,
  `Status` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ExaminationName` (`ExaminationName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `addexamination`
--

INSERT INTO `addexamination` (`id`, `ExaminationName`, `Status`) VALUES
(31, 'CT1', 0),
(34, 'CT2', 1),
(36, 'h111', 1),
(37, 'vvvvvv', 1),
(38, 'ffgfgfgtyrsrtrser', 0),
(39, 'cctt22', 0),
(40, 'PRESEM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addfaculty`
--

CREATE TABLE IF NOT EXISTS `addfaculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `MobileNumber` bigint(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `CourseName` int(11) NOT NULL,
  `Semester` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `addfaculty`
--

INSERT INTO `addfaculty` (`id`, `Name`, `Email`, `MobileNumber`, `UserName`, `Password`, `Role`, `Status`, `CourseName`, `Semester`) VALUES
(1, 'ravi panda', 'ravipanda@gmail.com', 123456789, 'ravipanda@gmail.com', '12345', 1, 1, 0, 0),
(2, 'ravi panda', 'ravipanda@gmail.com', 123456789, 'ravipanda@gmail.com', '12345', 1, 1, 0, 0),
(3, 'Ms.tanusi', 'tanusi@gmail.com', 123456789, 'tanusi@gmail.com', '12345', 1, 1, 25, 3);

-- --------------------------------------------------------

--
-- Table structure for table `addmarks`
--

CREATE TABLE IF NOT EXISTS `addmarks` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(50) NOT NULL,
  `Semester` int(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `StudentName` varchar(50) NOT NULL,
  `ExaminationName` varchar(50) NOT NULL,
  `EnterTotalMarks` int(50) NOT NULL,
  `EnterObtainMarks` int(50) NOT NULL,
  `Remarks` varchar(50) NOT NULL,
  `Status` int(50) NOT NULL,
  `Section` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `addmarks`
--

INSERT INTO `addmarks` (`id`, `CourseName`, `Semester`, `Subject`, `StudentName`, `ExaminationName`, `EnterTotalMarks`, `EnterObtainMarks`, `Remarks`, `Status`, `Section`) VALUES
(1, '25', 2, '47', '', '34', 100, 605, ' 6r', 1, 1),
(2, '25', 1, '44', '14', '31', 100, 50, ' ', 1, 0),
(3, '25', 1, '44', '13', '31', 100, 70, ' ', 1, 0),
(4, '25', 1, '44', '12', '31', 100, 75, ' ', 1, 0),
(5, '25', 1, '44', '15', '34', 100, 60, ' ', 1, 0),
(6, '25', 1, '44', '14', '34', 100, 70, ' ', 1, 0),
(7, '25', 1, '44', '13', '34', 100, 80, ' ', 1, 0),
(8, '25', 4, '53', '24', '34', 100, 233, ' ', 0, 0),
(9, '29', 1, '57', '33', '31', 100, 70, ' ', 1, 0),
(10, '25', 2, '45', '9', '31', 100, 234, ' ', 1, 0),
(11, '25', 2, '46', '9', '31', 100, 56, ' ', 1, 0),
(12, '25', 2, '45', '8', '34', 100, 56, ' ', 1, 0),
(13, '29', 2, '63', '38', '31', 100, 44, ' ', 0, 0),
(14, '25', 2, '45', '8', '31', 100, 45, 'jkl', 0, 0),
(15, '25', 1, '44', '15', '34', 100, 57, ' reeeee', 1, 0),
(16, '29', 1, '57', '34', '34', 100, 55, '55', 1, 1),
(17, '25', 1, '44', '15', '34', 100, 52, '52', 1, 1),
(18, '25', 1, '44', '15', '34', 100, 52, '52', 1, 1),
(19, '25', 1, '44', '15', '34', 100, 19, '10jkfdh', 1, 1),
(20, '25', 1, '44', '55', '34', 100, 10, 'dsbhd', 1, 1),
(21, '25', 1, '44', '55', '34', 100, 10, 'cc', 1, 1),
(22, '25', 1, '44', '55', '34', 100, 10, 'hjhj', 1, 1),
(23, '25', 1, '44', '55', '34', 100, 10, 'hjhj', 1, 1),
(24, '34', 1, '85', '60', '34', 100, 86, '86', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `addrole`
--

CREATE TABLE IF NOT EXISTS `addrole` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `Hidden` varchar(512) NOT NULL,
  `Role` varchar(40) NOT NULL,
  `Status` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Hidden` (`Hidden`,`Role`,`Status`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `addrole`
--

INSERT INTO `addrole` (`id`, `Hidden`, `Role`, `Status`) VALUES
(3, '1,2,2,21,2,22,3,3,31,3,32,4,4,41,4,42,5,5,51,5,52,6,6,61,6,62,7,7,71,8,8,81', 'Admin', 1),
(2, '2,2,21,2,22,4,4,41,4,42,5,5,51,5,52,6,6,61,6,62,7,7,71', 'Faculty', 1),
(1, '5,52,6,62,7,7,71', 'Student', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addstudent`
--

CREATE TABLE IF NOT EXISTS `addstudent` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(50) NOT NULL,
  `Semester` int(50) NOT NULL,
  `StudentName` varchar(50) NOT NULL,
  `RollNumber` int(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` bigint(50) NOT NULL,
  `Birthday` varchar(80) NOT NULL,
  `Status` int(30) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` int(11) NOT NULL,
  `Section` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CourseName` (`CourseName`,`Semester`,`Email`,`Phone`),
  KEY `Name` (`StudentName`,`Birthday`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `addstudent`
--

INSERT INTO `addstudent` (`id`, `CourseName`, `Semester`, `StudentName`, `RollNumber`, `Email`, `Phone`, `Birthday`, `Status`, `UserName`, `Password`, `Role`, `Section`) VALUES
(8, '25', 2, 'arunaaaaabbb', 23456, 'chauhanvarun120@gmail.com', 8604, '04-08-1993', 0, '', '', 0, 0),
(9, '25', 2, 'karannn', 54321666, 'chauhanvarun120@gmail.comm', 9876543456, '04-January-2018', 0, '', '', 0, 0),
(12, '29', 1, 'VARUNCH', 1, 'chauhanvarun120@gmail.com', 8604205328, '04-08-1993', 1, 'chauhanvarun120@gmail.com', '8604205328', 1, 1),
(13, '25', 1, 'VARUN1', 2346543, 'chauhanvarun120@gmail.com', 5555555555, '04-08-1993', 1, '', '', 0, 0),
(14, '25', 1, 'VARUN3', 3456643, 'chauhanvarun120@gmail.com', 3455332223, '04-08-1993', 1, '', '', 0, 0),
(15, '25', 1, 'VARUN4', 984435667, 'chauhanvarun120@gmail.com', 876533455, '04-08-1993', 1, '', '', 0, 0),
(16, '25', 2, 'DEEPAK', 3435786, 'chauhanvarun120@gmail.com', 67899765443, '04-08-1993', 1, '', '', 0, 0),
(17, '25', 2, 'DEEPAK2', 45678887, 'chauhanvarun120@gmail.com', 55567532355, '04-08-1993', 1, '', '', 0, 0),
(18, '25', 3, 'AAA', 234567, 'chauhanvarun120@gmail.com', 7889754, '04-08-1993', 1, '', '', 0, 0),
(19, '25', 3, 'AAA1', 322234, 'chauhanvarun120@gmail.com', 4322211, '04-08-1993', 1, '', '', 0, 0),
(20, '25', 3, 'AAA2', 566777, 'chauhanvarun120@gmail.com', 56677655, '04-08-1993', 1, '', '', 0, 0),
(21, '25', 3, 'AAA3', 4536367, 'chauhanvarun120@gmail.com', 676433345, '04-08-1993', 1, '', '', 0, 0),
(22, '25', 4, 'QQQ', 2221122, 'chauhanvarun120@gmail.com', 23432234, '04-08-1993', 1, '', '', 0, 0),
(23, '25', 4, 'QQQ1', 345544, 'chauhanvarun120@gmail.com', 4322233, '04-08-1993', 1, '', '', 0, 0),
(24, '25', 4, 'QQQ2', 455433, 'chauhanvarun120@gmail.com', 2344322, '04-08-1993', 1, '', '', 0, 0),
(25, '25', 4, 'QQQ4', 4554335, 'chauhanvarun120@gmail.com', 2344532, '04-08-1993', 1, '', '', 0, 0),
(26, '25', 5, 'DDD', 43222, 'chauhanvarun120@gmail.com', 543323445, '04-08-1993', 1, '', '', 0, 0),
(27, '25', 5, 'DDDD', 335452324, 'chauhanvarun120@gmail.com', 45432345, '04-08-1993', 1, '', '', 0, 0),
(28, '25', 5, 'DSGFD', 345433, 'chauhanvarun120@gmail.com', 243545, '04-08-1993', 1, '', '', 0, 0),
(29, '25', 5, 'DDDDD', 34545, 'chauhanvarun120@gmail.com', 343454343, '04-08-1993', 1, '', '', 0, 0),
(30, '29', 1, 'rohan', 23334, 'chauhanvarun120@gmail.com', 43324455, '04-08-1993', 1, '', '', 0, 0),
(31, '29', 1, 'mohan', 343545, 'chauhanvarun120@gmail.com', 24354656, '04-08-1993', 1, '', '', 0, 0),
(32, '29', 1, 'sohan', 233242, 'chauhanvarun120@gmail.com', 12443354, '04-08-1993', 1, '', '', 0, 0),
(33, '29', 1, 'ram', 232434, 'chauhanvarun120@gmail.com', 343545, '04-08-1993', 1, '', '', 0, 0),
(34, '29', 1, 'das', 2344545, 'chauhanvarun120@gmail.com', 34325, '04-08-1993', 1, '', '', 0, 0),
(35, '29', 2, 'w1', 32443, 'chauhanvarun120@gmail.com', 23443545, '04-08-1993', 1, '', '', 0, 0),
(36, '29', 2, 'w2', 12343, 'chauhanvarun120@gmail.com', 2343545, '04-08-1993', 1, '', '', 0, 0),
(37, '29', 2, 'w3', 213435, 'c', 123434, '04-08-1993', 1, '', '', 0, 0),
(38, '29', 2, 'w4', 234355, 'chauhanvarun120@gmail.com', 234545, '04-08-1993', 1, '', '', 0, 0),
(39, '29', 2, 'w5', 3454657, 'chauhanvarun120@gmail.com', 56434344, '04-08-1993', 1, '', '', 0, 0),
(40, '29', 2, 'w6', 23435, 'chauhanvarun120@gmail.com', 2343543, '04-08-1993', 1, '', '', 0, 0),
(41, '29', 3, 'dev1', 323243, 'chauhanvarun120@gmail.com', 342345, '04-08-1993', 1, '', '', 0, 0),
(42, '29', 3, 'dev1', 343454, 'chauhanvarun120@gmail.com', 234325, '04-08-1993', 1, '', '', 0, 0),
(43, '29', 3, 'dev2', 4456565, 'chauhanvarun120@gmail.com', 3345466, '04-08-1993', 1, '', '', 0, 0),
(44, '29', 3, 'dev3', 2344546, 'chauhanvarun120@gmail.com', 344546, '04-08-1993', 1, '', '', 0, 0),
(45, '29', 3, 'dev4', 344554, 'c', 123435, '04-08-1993', 1, '', '', 0, 0),
(46, '29', 3, 'dev5', 234344, 'chauhanvarun120@gmail.com', 343546, '04-08-1993', 1, '', '', 0, 0),
(47, '29', 3, 'dev6', 3435, 'chauhanvarun120@gmail.com', 2344354, '04-08-1993', 1, '', '', 0, 0),
(48, '29', 4, 'geeta', 34354, 'chauhanvarun120@gmail.com', 4534546, '04-08-1993', 1, '', '', 0, 0),
(49, '29', 4, 'g2', 45455, 'chauhanvarun120@gmail.com', 3545454, '04-08-1993', 1, '', '', 0, 0),
(50, '29', 4, 'g3', 4542344, 'chauhanvarun120@gmail.com', 343545, '04-08-1993', 1, '', '', 0, 0),
(51, '29', 4, 'g4', 32444, 'chauhanvarun120@gmail.com', 234324, '04-08-1993', 1, '', '', 0, 0),
(52, '29', 4, 'g5', 453456, 'chauhanvarun120@gmail.com', 34354, '04-08-1993', 0, '', '', 0, 0),
(53, '25', 3, 'kkkkk', 456123789, 'aniket.com', 789456, '04-08-1993', 0, '', '', 0, 0),
(54, '25', 2, 'karan ch', 54321666, 'chauhanvarun120@gmail.com', 987654345666, '04-08-1993', 1, '', '', 0, 0),
(55, '25', 1, 'karannnbb', 54, 'chauhanvarun120@gmail.com', 98, '04-08-1993', 1, '', '', 0, 0),
(56, '25', 1, 'VARUNch', 12345, 'chauhanvarun120@gmail.commm', 8604205328, '03-January-2018', 1, '', '', 0, 0),
(57, '25', 1, 'deepak', 12345, 'dee@gmail.com', 12345, '04-08-1993', 1, 'dee@gmail.com', '12345', 1, 1),
(58, '33', 1, 'bbbb', 39, 'vvvv', 123, '04-08-1993', 1, 'vvvv', '123', 1, 1),
(59, '33', 1, 'bbbb', 39, 'bbbbb', 123, '04-08-1993', 1, 'bbbbb', '123', 1, 1),
(60, '34', 1, 'Amul', 55, 'amul@gmail.com', 4556687778, '04-08-1993', 1, 'amul@gmail.com', '4556687778', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `addsubject`
--

CREATE TABLE IF NOT EXISTS `addsubject` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(50) NOT NULL,
  `Semster` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `EnterTotalMarks` int(50) NOT NULL,
  `Status` int(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CourseName` (`CourseName`,`Semster`,`Subject`),
  KEY `EnterTotalMarks` (`EnterTotalMarks`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Dumping data for table `addsubject`
--

INSERT INTO `addsubject` (`id`, `CourseName`, `Semster`, `Subject`, `EnterTotalMarks`, `Status`) VALUES
(41, '25', '1', 'C LANGUAGE', 100, 0),
(42, '25', '1', 'COA', 100, 0),
(43, '25', '1', 'D.M', 100, 0),
(44, '25', '1', 'ACCOUNTS', 100, 0),
(45, '29', '2', 'DataStructh', 100, 1),
(46, '25', '2', 'HUMAN VALUE', 100, 1),
(47, '25', '2', 'CBNST', 100, 1),
(48, '25', '2', 'INNOVATION', 100, 1),
(49, '25', '3', 'WEB', 100, 1),
(50, '25', '3', 'OS', 100, 1),
(51, '25', '3', 'OT', 100, 1),
(52, '25', '3', 'JAVA', 100, 1),
(53, '25', '4', 'DBMS', 100, 1),
(54, '25', '4', 'PHP', 100, 1),
(55, '25', '4', 'SYBER SECURITY', 100, 1),
(56, '25', '5', '.NET', 100, 1),
(57, '29', '1', 'X1', 100, 1),
(58, '29', '1', 'X2', 100, 1),
(59, '29', '1', 'X3', 100, 1),
(60, '29', '1', 'X4', 100, 1),
(61, '29', '1', 'X5', 100, 1),
(62, '29', '2', 'XX1', 100, 1),
(63, '29', '2', 'XX2', 100, 1),
(64, '29', '2', 'XX3', 100, 1),
(65, '29', '2', 'XX4', 100, 1),
(66, '29', '1', 'Y1', 100, 1),
(67, '29', '3', 'Y2', 100, 1),
(68, '29', '3', 'Y3', 100, 1),
(69, '29', '3', 'Y4', 100, 1),
(70, '29', '4', 'Y5', 100, 1),
(71, '29', '4', 'Z1', 100, 1),
(72, '29', '4', 'Z2', 100, 1),
(73, '29', '4', 'Z3', 100, 1),
(74, '29', '4', 'Z4', 100, 1),
(75, '29', '4', 'Z5', 100, 0),
(76, '25', '2', 'daa', 100, 0),
(77, '29', '4', 'cboat', 100, 0),
(78, '25', '2', 'DataStructureee', 100, 0),
(79, '25', '1', 'DataStructureee', 120, 0),
(80, '25', '2', 'DataSt', 100, 0),
(81, '25', '2', 'DataStruct', 100, 0),
(82, '25', '2', 'DataStructurex', 100, 0),
(83, '25', '2', 'DataStructurexx', 100, 1),
(84, '33', '1', 'ec', 100, 1),
(85, '34', '1', 'finance', 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuname` varchar(255) NOT NULL,
  `menuid` int(11) NOT NULL,
  `pagename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `menuname`, `menuid`, `pagename`) VALUES
(1, 'Examination', 2, ''),
(2, 'Course', 3, ''),
(3, 'Subject', 4, ''),
(4, 'Student', 5, ''),
(5, 'Marks', 6, ''),
(6, 'Report', 7, ''),
(7, 'Role', 8, '');

-- --------------------------------------------------------

--
-- Table structure for table `submenu`
--

CREATE TABLE IF NOT EXISTS `submenu` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  `menuname` varchar(255) NOT NULL,
  `pagename` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `submenu`
--

INSERT INTO `submenu` (`Id`, `parentid`, `menuid`, `menuname`, `pagename`) VALUES
(1, 2, 21, 'Add Examination', 'AddExamination.jsp'),
(2, 2, 22, 'View Examination', 'ViewExamination.jsp'),
(3, 3, 31, 'Course Name', 'AddCourse.jsp'),
(4, 3, 32, 'View Course', 'ViewCourse.jsp'),
(5, 4, 41, 'Add Subject', 'AddSubject.jsp'),
(6, 4, 42, 'View Subject', 'ViewSubject.jsp'),
(7, 5, 51, 'Add Student', 'AddStudent.jsp'),
(8, 5, 52, 'View Student', 'ViewStudent.jsp'),
(9, 6, 61, 'Add Marks', 'AddMarks.jsp'),
(10, 7, 71, 'Report', 'Report.jsp'),
(11, 8, 81, 'Role', 'AddRole.jsp'),
(12, 6, 62, 'View Marks', 'ViewMarks.jsp');
