-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Waktu pembuatan: 25. Oktober 2012 jam 06:59
-- Versi Server: 5.5.16
-- Versi PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fdsi_football_statistic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `clubs`
--

CREATE TABLE IF NOT EXISTS `clubs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text NOT NULL COMMENT 'max 40 chars',
  `FoundingDate` date NOT NULL COMMENT 'Y-m-d',
  `Owner` varchar(30) NOT NULL,
  `Fk_Stadium` int(11) NOT NULL COMMENT 'foreign key of stadium table',
  `Contact_person` varchar(30) NOT NULL COMMENT 'max 30 chars',
  `Address` text NOT NULL COMMENT 'max 50 chars',
  `City` varchar(30) NOT NULL COMMENT 'max 30',
  `Province` varchar(30) NOT NULL COMMENT 'max 30',
  `PhoneNumber` varchar(30) DEFAULT NULL COMMENT '30',
  `Fax` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Website` text,
  `IsSoccerSchool` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is this a SSB (soccer school club) or not',
  `manager` varchar(30) DEFAULT NULL COMMENT '30 char max',
  `technical_director` varchar(30) DEFAULT NULL COMMENT '30 char max',
  `medical_director` varchar(30) DEFAULT NULL COMMENT '30 char max',
  `youth_team_manager` varchar(30) DEFAULT NULL COMMENT '30 char max',
  `academy_manager` varchar(30) DEFAULT NULL COMMENT '30 char max',
  `Additional_Information` text,
  PRIMARY KEY (`ID`),
  KEY `idx_club_name` (`Name`(30)),
  KEY `clubs_fk_stadium` (`Fk_Stadium`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `leagues`
--

CREATE TABLE IF NOT EXISTS `leagues` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'League ID',
  `Name` varchar(60) NOT NULL COMMENT '60 karakter',
  `fk_leaguelevel` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_leaguelevel` (`fk_leaguelevel`),
  KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `league_level`
--

CREATE TABLE IF NOT EXISTS `league_level` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL COMMENT '30 char max',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Level league, such as division A, B, C , D' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `league_season`
--

CREATE TABLE IF NOT EXISTS `league_season` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Start` year(4) NOT NULL,
  `End` year(4) NOT NULL,
  `Fk_league` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Fk_league` (`Fk_league`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `league_table`
--

CREATE TABLE IF NOT EXISTS `league_table` (
  `fk_season_league` int(11) NOT NULL,
  `fk_team` int(11) NOT NULL,
  `match_played` tinyint(4) NOT NULL DEFAULT '0',
  `won` tinyint(4) NOT NULL DEFAULT '0',
  `draw` tinyint(4) NOT NULL DEFAULT '0',
  `lost` tinyint(4) NOT NULL DEFAULT '0',
  `goal_for` tinyint(4) NOT NULL DEFAULT '0',
  `goal_against` tinyint(4) NOT NULL DEFAULT '0',
  `total_points` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_season_league`,`fk_team`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HomeTeam` int(11) NOT NULL,
  `AwayTeam` int(11) NOT NULL,
  `Fk_stadium` int(11) NOT NULL,
  `Date` int(11) NOT NULL,
  `Match_type` enum('league','tournament','friendly','playoff','tour') NOT NULL DEFAULT 'league',
  `match_status` enum('scheduled','ongoing','played') NOT NULL DEFAULT 'scheduled',
  `Home_Score` tinyint(4) NOT NULL DEFAULT '0',
  `away_score` tinyint(4) NOT NULL DEFAULT '0',
  `attendance` int(11) NOT NULL,
  `Additional_information` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `HomeTeam` (`HomeTeam`),
  KEY `AwayTeam` (`AwayTeam`),
  KEY `Fk_stadium` (`Fk_stadium`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='list of matches' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `match_detail`
--

CREATE TABLE IF NOT EXISTS `match_detail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fk_match` int(11) NOT NULL,
  `fk_team` int(11) NOT NULL,
  `fk_player` int(11) NOT NULL,
  `Round` varchar(15) NOT NULL DEFAULT '1st half' COMMENT 'varchar 15',
  `Minute` int(11) NOT NULL DEFAULT '1',
  `event` varchar(30) NOT NULL COMMENT '30 char saja',
  `player_position_x` int(11) NOT NULL DEFAULT '0',
  `player_position_y` int(11) NOT NULL DEFAULT '0',
  `ball_position_x` int(11) NOT NULL DEFAULT '0',
  `ball_position_y` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_match` (`fk_match`),
  KEY `fk_team` (`fk_team`),
  KEY `fk_player` (`fk_player`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `match_player`
--

CREATE TABLE IF NOT EXISTS `match_player` (
  `fk_match` int(11) NOT NULL,
  `fk_player` int(11) NOT NULL,
  `fk_position` char(3) NOT NULL,
  `is_starter` int(11) NOT NULL,
  KEY `idx_fk_match_tblmatch_player` (`fk_match`),
  KEY `idx_fk_player_tblmatchplayer_tblplayer` (`fk_player`),
  KEY `idx_fk_position_tblposition_matchplayer` (`fk_position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='player list of a team during match';

-- --------------------------------------------------------

--
-- Struktur dari tabel `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `Name` varchar(30) NOT NULL COMMENT '30 char max',
  `Birthplace` varchar(30) NOT NULL COMMENT '30 char max',
  `DateOfBirth` date NOT NULL,
  `Gender` enum('m','f') NOT NULL DEFAULT 'm',
  `Weight` int(11) DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Preferred_foot` enum('left','right') NOT NULL DEFAULT 'right',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `idx_player_name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `player_physical_history`
--

CREATE TABLE IF NOT EXISTS `player_physical_history` (
  `fk_players` int(11) NOT NULL,
  `month` date NOT NULL,
  `year` year(4) NOT NULL,
  `height` tinyint(4) NOT NULL DEFAULT '100' COMMENT 'height in centimetres',
  `weight` tinyint(4) NOT NULL DEFAULT '50' COMMENT 'weight in kilograms',
  `body_balance` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'percentage',
  `muscle_mass` tinyint(4) NOT NULL DEFAULT '0',
  `VO2max` tinyint(4) NOT NULL DEFAULT '0',
  KEY `fk_players` (`fk_players`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `ID` char(3) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT 'max 30 char',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `position`
--

INSERT INTO `position` (`ID`, `name`) VALUES
('AM', 'Attacking Midfielder'),
('CB', 'Centre Back'),
('CF', 'Centre Forward'),
('CM', 'Centre Midfielder'),
('DM', 'Defensive Midfielder'),
('GK', 'Goalkeeper'),
('LB', 'Left Back'),
('LF', 'Left Forward'),
('LM', 'Wide Midfielder Left'),
('LW', 'Left Winger'),
('LWB', 'Left Wing Back'),
('RB', 'Right Back'),
('RF', 'Right Forward'),
('RM', 'Wide Midfielder Right'),
('RW', 'Right Winger'),
('RWB', 'Right Wing Back'),
('SS', 'Secondary Striker'),
('ST', 'Striker'),
('SW', 'Sweeper');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stadium`
--

CREATE TABLE IF NOT EXISTS `stadium` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT 'max 30 char',
  `Capacity` int(12) NOT NULL,
  `Address` text NOT NULL,
  `City` varchar(30) NOT NULL COMMENT '30 char max',
  `Province` varchar(30) NOT NULL COMMENT '30 char max',
  `Contact_person` varchar(30) DEFAULT NULL COMMENT '30 char max',
  `Telepon` varchar(30) DEFAULT NULL COMMENT '30 char max',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idx_nama_stadion` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores any football Field or Stadium' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fk_club` int(11) NOT NULL COMMENT 'fk club id',
  `Name` varchar(30) NOT NULL COMMENT '30 char max',
  `Coach` varchar(30) NOT NULL,
  `AssistantCoach` varchar(30) DEFAULT NULL,
  `GoalkeeperCoach` varchar(30) DEFAULT NULL,
  `FitnessCoach` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Fk_club` (`Fk_club`),
  KEY `idx_team_name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='contains team list of a club' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tournaments`
--

CREATE TABLE IF NOT EXISTS `tournaments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Organizer` varchar(30) NOT NULL,
  `Location` varchar(30) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL COMMENT 'Y-m-d',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tournament_participants`
--

CREATE TABLE IF NOT EXISTS `tournament_participants` (
  `fk_tournament` int(11) NOT NULL,
  `fk_team` int(11) NOT NULL,
  PRIMARY KEY (`fk_tournament`,`fk_team`),
  KEY `fk_team` (`fk_team`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `clubs`
--
ALTER TABLE `clubs`
  ADD CONSTRAINT `clubs_ibfk_1` FOREIGN KEY (`Fk_Stadium`) REFERENCES `stadium` (`ID`);

--
-- Ketidakleluasaan untuk tabel `leagues`
--
ALTER TABLE `leagues`
  ADD CONSTRAINT `leagues_ibfk_1` FOREIGN KEY (`fk_leaguelevel`) REFERENCES `league_level` (`ID`);

--
-- Ketidakleluasaan untuk tabel `league_season`
--
ALTER TABLE `league_season`
  ADD CONSTRAINT `league_season_ibfk_1` FOREIGN KEY (`Fk_league`) REFERENCES `leagues` (`ID`);

--
-- Ketidakleluasaan untuk tabel `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`HomeTeam`) REFERENCES `clubs` (`ID`),
  ADD CONSTRAINT `matches_ibfk_4` FOREIGN KEY (`AwayTeam`) REFERENCES `clubs` (`ID`),
  ADD CONSTRAINT `matches_ibfk_5` FOREIGN KEY (`Fk_stadium`) REFERENCES `stadium` (`ID`);

--
-- Ketidakleluasaan untuk tabel `match_detail`
--
ALTER TABLE `match_detail`
  ADD CONSTRAINT `match_detail_ibfk_1` FOREIGN KEY (`fk_match`) REFERENCES `matches` (`ID`),
  ADD CONSTRAINT `match_detail_ibfk_2` FOREIGN KEY (`fk_team`) REFERENCES `clubs` (`ID`),
  ADD CONSTRAINT `match_detail_ibfk_3` FOREIGN KEY (`fk_player`) REFERENCES `players` (`ID`);

--
-- Ketidakleluasaan untuk tabel `match_player`
--
ALTER TABLE `match_player`
  ADD CONSTRAINT `match_player_ibfk_3` FOREIGN KEY (`fk_match`) REFERENCES `matches` (`ID`),
  ADD CONSTRAINT `match_player_ibfk_4` FOREIGN KEY (`fk_player`) REFERENCES `players` (`ID`),
  ADD CONSTRAINT `match_player_ibfk_5` FOREIGN KEY (`fk_position`) REFERENCES `position` (`ID`);

--
-- Ketidakleluasaan untuk tabel `player_physical_history`
--
ALTER TABLE `player_physical_history`
  ADD CONSTRAINT `player_physical_history_ibfk_1` FOREIGN KEY (`fk_players`) REFERENCES `players` (`ID`);

--
-- Ketidakleluasaan untuk tabel `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`Fk_club`) REFERENCES `clubs` (`ID`);

--
-- Ketidakleluasaan untuk tabel `tournament_participants`
--
ALTER TABLE `tournament_participants`
  ADD CONSTRAINT `tournament_participants_ibfk_1` FOREIGN KEY (`fk_tournament`) REFERENCES `tournaments` (`ID`),
  ADD CONSTRAINT `tournament_participants_ibfk_2` FOREIGN KEY (`fk_team`) REFERENCES `teams` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
