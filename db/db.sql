-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 08, 2010 at 10:26 ã
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `soccersite`
--

-- --------------------------------------------------------

--
-- Table structure for table `clubplayers`
--

CREATE TABLE IF NOT EXISTS `clubplayers` (
  `ClubPlayersID` int(11) NOT NULL AUTO_INCREMENT,
  `Players_PlayerID` int(11) NOT NULL,
  `Clubs_ClubID` int(11) NOT NULL,
  `DateFrom` date NOT NULL,
  `DateTo` date NOT NULL,
  PRIMARY KEY (`ClubPlayersID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE IF NOT EXISTS `clubs` (
  `ClubID` int(11) NOT NULL AUTO_INCREMENT,
  `ClubName` text NOT NULL,
  PRIMARY KEY (`ClubID`),
  KEY `ClubID` (`ClubID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `competition`
--

CREATE TABLE IF NOT EXISTS `competition` (
  `CompetitionID` int(11) NOT NULL AUTO_INCREMENT,
  `CompetitionName` varchar(50) NOT NULL,
  `ShortName` varchar(4) NOT NULL,
  PRIMARY KEY (`CompetitionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Table structure for table `competitionbyseason`
--

CREATE TABLE IF NOT EXISTS `competitionbyseason` (
  `CompBySeasonID` int(11) NOT NULL AUTO_INCREMENT,
  `Competition_CompetitionID` int(11) NOT NULL,
  `Season_SeasonID` int(11) NOT NULL,
  `Teams` text,
  PRIMARY KEY (`CompBySeasonID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `competitionteams`
--

CREATE TABLE IF NOT EXISTS `competitionteams` (
  `CompetitionTeamsID` int(11) NOT NULL AUTO_INCREMENT,
  `CompetitionBySeason_Season_SeasonID` int(11) NOT NULL,
  `CompetitionBySeason_Competition_CompetitionID` int(11) NOT NULL,
  `CompetitionBySeason_CompBySeasonID` int(11) NOT NULL,
  `TeamNames_TeamNameID` int(11) NOT NULL,
  PRIMARY KEY (`CompetitionTeamsID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `MatchID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `HomeTeamID` int(11) NOT NULL,
  `AwayTeamID` int(11) NOT NULL,
  `HomeScore` int(11) NOT NULL,
  `AwayScore` int(11) NOT NULL,
  `Attendance` int(11) NOT NULL,
  `LeagueSeasonID` int(11) NOT NULL,
  PRIMARY KEY (`MatchID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;


-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `PlayerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Nationality` varchar(50) NOT NULL,
  `PreferredName` varchar(50) NOT NULL,
  `DateOfBirth` date NOT NULL,
  PRIMARY KEY (`PlayerID`),
  KEY `DateOfBirth` (`DateOfBirth`),
  KEY `DateOfBirth_2` (`DateOfBirth`),
  KEY `DateOfBirth_3` (`DateOfBirth`),
  KEY `DateOfBirth_4` (`DateOfBirth`),
  KEY `DateOfBirth_5` (`DateOfBirth`),
  KEY `DateOfBirth_6` (`DateOfBirth`),
  KEY `DateOfBirth_7` (`DateOfBirth`),
  KEY `DateOfBirth_8` (`DateOfBirth`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE IF NOT EXISTS `season` (
  `SeasonID` int(11) NOT NULL AUTO_INCREMENT,
  `SeasonName` varchar(9) NOT NULL,
  `SeasonStart` date NOT NULL,
  `SeasonEnd` date NOT NULL,
  PRIMARY KEY (`SeasonID`),
  UNIQUE KEY `SeasonName` (`SeasonName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `stadiums`
--

CREATE TABLE IF NOT EXISTS `stadiums` (
  `StadiumID` int(11) NOT NULL AUTO_INCREMENT,
  `StadiumName` varchar(60) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Address1` varchar(60) NOT NULL,
  `Address2` varchar(60) NOT NULL,
  PRIMARY KEY (`StadiumID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `teamnames`
--

CREATE TABLE IF NOT EXISTS `teamnames` (
  `TeamNameID` int(11) NOT NULL AUTO_INCREMENT,
  `Clubs_ClubID` int(11) NOT NULL,
  `TeamName` varchar(50) NOT NULL,
  `DateFrom` date NOT NULL,
  `DateTo` date NOT NULL,
  PRIMARY KEY (`TeamNameID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `teamsstadiums`
--

CREATE TABLE IF NOT EXISTS `teamsstadiums` (
  `TeamsStadiumsID` int(11) NOT NULL AUTO_INCREMENT,
  `Clubs_ClubID` int(11) NOT NULL,
  `Stadiums_StadiumID` int(11) NOT NULL,
  `DateFrom` date NOT NULL,
  `DateTo` date NOT NULL,
  PRIMARY KEY (`TeamsStadiumsID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `teamsstadiums`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
