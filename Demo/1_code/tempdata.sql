-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2022 at 04:19 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tempdata`
--
CREATE DATABASE IF NOT EXISTS `tempdata` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tempdata`;

-- --------------------------------------------------------

--
-- Table structure for table `accesslevel`
--

CREATE TABLE `accesslevel` (
  `AccessLevel` int(11) NOT NULL DEFAULT 1,
  `AccessName` varchar(45) NOT NULL,
  `AccessDescription` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='WebUsers access level';

--
-- Dumping data for table `accesslevel`
--

INSERT INTO `accesslevel` (`AccessLevel`, `AccessName`, `AccessDescription`) VALUES
(1, 'Quality Assurance', 'Views current sensor data'),
(2, 'Quality Management', 'Views sensor trend data'),
(3, 'Application Support', 'Creates users and views sensors health'),
(9, 'IT Admin', 'Access to everything / troubleshooter');

-- --------------------------------------------------------

--
-- Table structure for table `modulehealth`
--

CREATE TABLE `modulehealth` (
  `Hostname` varchar(45) NOT NULL,
  `CPUTemp` int(11) DEFAULT NULL,
  `Uptime` datetime DEFAULT NULL,
  `Cpu Usage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Sensor module health';

-- --------------------------------------------------------

--
-- Table structure for table `sensorrecords`
--

CREATE TABLE `sensorrecords` (
  `recordID` int(11) NOT NULL,
  `temperature` decimal(10,0) DEFAULT NULL,
  `humidity` decimal(10,0) DEFAULT NULL,
  `sensorID` int(11) NOT NULL,
  `dateTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sensorrecords`
--

INSERT INTO `sensorrecords` (`recordID`, `temperature`, `humidity`, `sensorID`, `dateTime`) VALUES
(6, '74', '29', 1, '2022-03-09 02:38:44'),
(7, '73', '30', 2, '2022-03-09 21:47:44'),
(8, '77', '80', 1, '2022-03-09 02:40:06'),
(9, '56', '54', 2, '2022-03-09 02:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `sensorsinfo`
--

CREATE TABLE `sensorsinfo` (
  `SensorID` int(11) NOT NULL,
  `Hostname` varchar(45) NOT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `SensorName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maintains information associated with the individual sensors. ';

--
-- Dumping data for table `sensorsinfo`
--

INSERT INTO `sensorsinfo` (`SensorID`, `Hostname`, `DateAdded`, `Description`, `SensorName`) VALUES
(1, 'RaspberrySensor01', '2022-03-03 01:19:05', 'Test sensor in living room', 'Living Room'),
(2, 'RaspberrySensor02', '2022-03-05 22:41:49', 'Second Test Sensor', 'Deck');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_mostrecentrecords`
-- (See below for the actual view)
--
CREATE TABLE `view_mostrecentrecords` (
`SensorName` varchar(45)
,`humidity` decimal(10,0)
,`temperature` decimal(10,0)
,`DateTimeStamp` datetime
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_recorddetails`
-- (See below for the actual view)
--
CREATE TABLE `view_recorddetails` (
`temperature` decimal(10,0)
,`humidity` decimal(10,0)
,`sensorID` int(11)
,`dateTime` datetime
,`SensorName` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_trenddata`
-- (See below for the actual view)
--
CREATE TABLE `view_trenddata` (
`SensorName` varchar(45)
,`avg_temperature` decimal(14,4)
,`avg_humidity` decimal(14,4)
,`max_temperature` decimal(10,0)
,`min_temperature` decimal(10,0)
,`max_humidity` decimal(10,0)
,`min_humidity` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_userinfo`
-- (See below for the actual view)
--
CREATE TABLE `view_userinfo` (
`UserName` varchar(20)
,`UserPassword` varchar(45)
,`FirstName` varchar(45)
,`LastName` varchar(45)
,`AccessLevel` int(11)
,`Notes` varchar(45)
,`CreationDate` datetime
,`AccessName` varchar(45)
,`AccessDescription` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `webcomments`
--

CREATE TABLE `webcomments` (
  `UserName` varchar(20) NOT NULL,
  `DateTime` datetime DEFAULT current_timestamp(),
  `Comment` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `webusers`
--

CREATE TABLE `webusers` (
  `UserName` varchar(20) NOT NULL,
  `UserPassword` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `AccessLevel` int(11) NOT NULL DEFAULT 1,
  `Notes` varchar(45) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Holds sign in information for users';

--
-- Dumping data for table `webusers`
--

INSERT INTO `webusers` (`UserName`, `UserPassword`, `FirstName`, `LastName`, `AccessLevel`, `Notes`, `CreationDate`) VALUES
('appsupport', 'password', 'Application', 'Support', 3, 'Application Support Test Account', '2022-03-11 02:45:20'),
('ekreider', 'password', 'Eric', 'Kreider', 9, 'This is my test account', '2022-02-28 22:17:24'),
('qualassurance', 'password', 'Quality', 'AssuranceTest', 1, 'Test Account Quality Assurance', '2022-03-11 02:44:20'),
('qualmanagement', 'password', 'Quality', 'ManagementTest', 2, 'Test Account Quality Management', '2022-03-11 02:44:20');

-- --------------------------------------------------------

--
-- Structure for view `view_mostrecentrecords`
--
DROP TABLE IF EXISTS `view_mostrecentrecords`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Eric`@`%` SQL SECURITY DEFINER VIEW `view_mostrecentrecords`  AS SELECT `si`.`SensorName` AS `SensorName`, `sr`.`humidity` AS `humidity`, `sr`.`temperature` AS `temperature`, max(`sr`.`dateTime`) AS `DateTimeStamp` FROM (`sensorrecords` `sr` join `sensorsinfo` `si` on(`sr`.`sensorID` = `si`.`SensorID`)) GROUP BY `si`.`SensorID` ;

-- --------------------------------------------------------

--
-- Structure for view `view_recorddetails`
--
DROP TABLE IF EXISTS `view_recorddetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Eric`@`%` SQL SECURITY DEFINER VIEW `view_recorddetails`  AS SELECT `r`.`temperature` AS `temperature`, `r`.`humidity` AS `humidity`, `r`.`sensorID` AS `sensorID`, `r`.`dateTime` AS `dateTime`, `i`.`SensorName` AS `SensorName` FROM (`sensorrecords` `r` join `sensorsinfo` `i` on(`r`.`sensorID` = `i`.`SensorID`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_trenddata`
--
DROP TABLE IF EXISTS `view_trenddata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_trenddata`  AS SELECT `si`.`SensorName` AS `SensorName`, avg(`sr`.`temperature`) AS `avg_temperature`, avg(`sr`.`humidity`) AS `avg_humidity`, max(`sr`.`temperature`) AS `max_temperature`, min(`sr`.`temperature`) AS `min_temperature`, max(`sr`.`humidity`) AS `max_humidity`, min(`sr`.`humidity`) AS `min_humidity` FROM (`sensorrecords` `sr` join `sensorsinfo` `si` on(`sr`.`sensorID` = `si`.`SensorID`)) GROUP BY `sr`.`sensorID` ;

-- --------------------------------------------------------

--
-- Structure for view `view_userinfo`
--
DROP TABLE IF EXISTS `view_userinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`Eric`@`%` SQL SECURITY DEFINER VIEW `view_userinfo`  AS SELECT `wu`.`UserName` AS `UserName`, `wu`.`UserPassword` AS `UserPassword`, `wu`.`FirstName` AS `FirstName`, `wu`.`LastName` AS `LastName`, `wu`.`AccessLevel` AS `AccessLevel`, `wu`.`Notes` AS `Notes`, `wu`.`CreationDate` AS `CreationDate`, `al`.`AccessName` AS `AccessName`, `al`.`AccessDescription` AS `AccessDescription` FROM (`webusers` `wu` join `accesslevel` `al` on(`wu`.`AccessLevel` = `al`.`AccessLevel`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesslevel`
--
ALTER TABLE `accesslevel`
  ADD PRIMARY KEY (`AccessLevel`);

--
-- Indexes for table `modulehealth`
--
ALTER TABLE `modulehealth`
  ADD PRIMARY KEY (`Hostname`);

--
-- Indexes for table `sensorrecords`
--
ALTER TABLE `sensorrecords`
  ADD PRIMARY KEY (`recordID`,`dateTime`),
  ADD KEY `FK_SensorID_idx` (`sensorID`);

--
-- Indexes for table `sensorsinfo`
--
ALTER TABLE `sensorsinfo`
  ADD PRIMARY KEY (`SensorID`,`Hostname`,`SensorName`);

--
-- Indexes for table `webusers`
--
ALTER TABLE `webusers`
  ADD PRIMARY KEY (`UserName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sensorrecords`
--
ALTER TABLE `sensorrecords`
  MODIFY `recordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sensorsinfo`
--
ALTER TABLE `sensorsinfo`
  MODIFY `SensorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sensorrecords`
--
ALTER TABLE `sensorrecords`
  ADD CONSTRAINT `FK_SensorID` FOREIGN KEY (`sensorID`) REFERENCES `sensorsinfo` (`SensorID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
