-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 31, 2020 at 05:41 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `veterinarska_ambulanta`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambulanta`
--

DROP TABLE IF EXISTS `ambulanta`;
CREATE TABLE IF NOT EXISTS `ambulanta` (
  `AmbulantaID` int(11) NOT NULL,
  `Adresa` varchar(50) DEFAULT NULL,
  `Naziv` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AmbulantaID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ambulanta`
--

INSERT INTO `ambulanta` (`AmbulantaID`, `Adresa`, `Naziv`) VALUES
(1, 'Ivana_Kosancica_1', 'Family_Vet'),
(2, 'Vojvode_Misica_5', 'Primarius_vet'),
(3, 'Sumska_8', 'Tim_Vet');

-- --------------------------------------------------------

--
-- Table structure for table `doktor`
--

DROP TABLE IF EXISTS `doktor`;
CREATE TABLE IF NOT EXISTS `doktor` (
  `Br_Licence` int(11) NOT NULL,
  `Ime` varchar(10) DEFAULT NULL,
  `Prezime` varchar(15) DEFAULT NULL,
  `AmbulantaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Br_Licence`),
  KEY `AmbulantaID` (`AmbulantaID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doktor`
--

INSERT INTO `doktor` (`Br_Licence`, `Ime`, `Prezime`, `AmbulantaID`) VALUES
(9, 'Ivan', 'Ivic', 1),
(16, 'Milica', 'Milic', 1),
(17, 'Tamara', 'Spasic', 3),
(32, 'Jelena', 'Jelic', 2),
(8, 'Zika', 'Zivanovic', 2),
(5, 'Milan', 'Mitic', 1),
(7, 'Jovan', 'Lazic', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lecenje`
--

DROP TABLE IF EXISTS `lecenje`;
CREATE TABLE IF NOT EXISTS `lecenje` (
  `ZivotinjaID` int(11) NOT NULL,
  `Br_Licence` int(11) NOT NULL,
  `Vrsta_bolesti` varchar(30) DEFAULT NULL,
  `Datum_lecenja` date DEFAULT NULL,
  PRIMARY KEY (`ZivotinjaID`,`Br_Licence`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecenje`
--

INSERT INTO `lecenje` (`ZivotinjaID`, `Br_Licence`, `Vrsta_bolesti`, `Datum_lecenja`) VALUES
(2, 17, 'dermatitis', '2018-02-17'),
(150, 16, 'e.colli', '2018-01-07');

-- --------------------------------------------------------

--
-- Table structure for table `vlasnik`
--

DROP TABLE IF EXISTS `vlasnik`;
CREATE TABLE IF NOT EXISTS `vlasnik` (
  `VlasnikID` int(11) NOT NULL AUTO_INCREMENT,
  `Ime` varchar(50) DEFAULT NULL,
  `Prezime` varchar(50) NOT NULL,
  `E-mail` varchar(50) NOT NULL,
  `Sifra` varchar(10) NOT NULL,
  PRIMARY KEY (`VlasnikID`)
) ENGINE=MyISAM AUTO_INCREMENT=501 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zivotinja`
--

DROP TABLE IF EXISTS `zivotinja`;
CREATE TABLE IF NOT EXISTS `zivotinja` (
  `ZivotinjaID` int(11) NOT NULL,
  `Vrsta` varchar(15) DEFAULT NULL,
  `VlasnikID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZivotinjaID`),
  KEY `VlasnikID` (`VlasnikID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zivotinja`
--

INSERT INTO `zivotinja` (`ZivotinjaID`, `Vrsta`, `VlasnikID`) VALUES
(2, 'Pas', 200),
(50, 'Macka', 200),
(11, 'Zec', 100),
(150, 'Hrcak', 500);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
