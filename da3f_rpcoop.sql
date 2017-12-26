SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
--
-- Compatible with newer MySQL versions. (After MySQL-5.5)
-- This SQL uses utf8mb4 and has CURRENT_TIMESTAMP function.
--

-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 26 Décembre 2017 à 18:53
-- Version du serveur :  5.7.20-0ubuntu0.16.04.1
-- Version de PHP :  7.0.22-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `da3f_cprp`
-- Default Schema
--
CREATE DATABASE IF NOT EXISTS `da3f_cprp` DEFAULT CHARACTER SET utf8mb4;
USE `da3f_cprp`;

--
-- Drop procedures to ensure no conflicts
--
DROP PROCEDURE IF EXISTS `resetCpRpVehicles`;
DROP PROCEDURE IF EXISTS `delDeadVeh`;
DROP PROCEDURE IF EXISTS `deleteOldStock`;

DELIMITER $$
--
-- Procedures
-- Edit arma3 to match a user in MySQL
-- For external databases: Edit localhost to match arma3server IP
--

CREATE DEFINER=`Utilisateur`@`localhost` PROCEDURE `resetCpRpVehicles`()
BEGIN
  UPDATE `vehicles` SET `active`= 0;
END$$

CREATE DEFINER=`Utilisateur`@`localhost` PROCEDURE `delDeadVeh`()
BEGIN
  DELETE FROM `vehicles` WHERE `alive` = 0;
END$$


CREATE DEFINER=`Utilisateur`@`localhost` PROCEDURE `deleteOldStock`()
BEGIN
  DELETE FROM `containers` WHERE `owned` = 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `containers`
--

CREATE TABLE `containers` (
  `id` int(6) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `dir` varchar(128) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `owned` tinyint(1) DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

CREATE TABLE `players` (
  `uid` int(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `aliases` text NOT NULL,
  `pid` varchar(17) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `cashwar` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `hierarchie` enum('0','1','2','3','4','5','6','7','8','9') NOT NULL DEFAULT '0',
  `xplevel` enum('0','1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '0',
  `spec` text NOT NULL,
  `inv_virt` text NOT NULL,
  `inv_unit` text NOT NULL,
  `stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `vip` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `save_pos` varchar(64) NOT NULL DEFAULT '"[]"',
  `mdp_coms` int(20) NOT NULL DEFAULT '1234',
  `mymsg` text NOT NULL,
  `playtime` varchar(32) NOT NULL DEFAULT '"[0,0,0]"',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `stockage`
--

CREATE TABLE `stockage` (
  `Name` varchar(32) NOT NULL,
  `Items` text NOT NULL,
  `Weapons` text NOT NULL,
  `Magazines` text NOT NULL,
  `Backpacks` text NOT NULL,
  `VirtItems` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(6) NOT NULL,
  `side` varchar(16) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plak` text NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `fuel` double NOT NULL DEFAULT '1',
  `damage` varchar(256) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `containers`
--
ALTER TABLE `containers`
  ADD PRIMARY KEY (`id`,`pid`);

--
-- Index pour la table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `pid` (`pid`),
  ADD KEY `name` (`name`),
  ADD KEY `blacklist` (`blacklist`);

--
-- Index pour la table `stockage`
--
ALTER TABLE `stockage`
  ADD PRIMARY KEY (`Name`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `side` (`side`),
  ADD KEY `pid` (`pid`),
  ADD KEY `type` (`type`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `containers`
--
ALTER TABLE `containers`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `players`
--
ALTER TABLE `players`
  MODIFY `uid` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT pour la table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
