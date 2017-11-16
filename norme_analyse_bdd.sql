-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 16 nov. 2017 à 08:49
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `analyse`
--

-- --------------------------------------------------------

--
-- Structure de la table `analyse`
--

DROP TABLE IF EXISTS `analyse`;
CREATE TABLE IF NOT EXISTS `analyse` (
  `id_analyse` int(11) NOT NULL AUTO_INCREMENT,
  `ref_type` int(11) NOT NULL,
  `ref_personne` int(11) NOT NULL,
  `valeur` float NOT NULL,
  `unite` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id_analyse`),
  UNIQUE KEY `ref_type_2` (`ref_type`,`ref_personne`,`date`),
  KEY `ref_type` (`ref_type`),
  KEY `ref_personne` (`ref_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `analyse`
--

INSERT INTO `analyse` (`id_analyse`, `ref_type`, `ref_personne`, `valeur`, `unite`, `date`) VALUES
(236, 137, 1, 35.3, 'g/dL', '2007-10-05'),
(237, 138, 1, 233, 'G/LÂ ', '2007-10-05'),
(238, 139, 1, 0.246, 'G/LÂ ', '2007-10-05'),
(239, 140, 1, 0.017, 'G/LÂ ', '2007-10-05'),
(240, 141, 1, -0.8, NULL, '2007-10-05'),
(241, 142, 1, 12.9, '%', '2007-10-05'),
(242, 143, 2, 4.59, 'T/L', '2007-10-05'),
(243, 138, 2, 255, 'G/LÂ ', '2007-10-05'),
(244, 139, 2, 0.375, 'G/LÂ ', '2007-10-05');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `analyse`
--
ALTER TABLE `analyse`
  ADD CONSTRAINT `fk_personne` FOREIGN KEY (`ref_personne`) REFERENCES `personne` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_type` FOREIGN KEY (`ref_type`) REFERENCES `type_an` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
