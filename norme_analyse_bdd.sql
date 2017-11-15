-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 14 nov. 2017 à 08:16
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
-- Base de données :  `norme_analyse_bdd`
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
  PRIMARY KEY (`id_analyse`),
  KEY `ref_type` (`ref_type`),
  KEY `ref_personne` (`ref_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `analyse`
--

INSERT INTO `analyse` (`id_analyse`, `ref_type`, `ref_personne`, `valeur`, `unite`) VALUES
(1, 42, 4377, 23, 'UI/L'),
(2, 43, 1468, 1, 'mg/L'),
(3, 44, 5778, 1.8, 'NULL'),
(4, 45, 6037, 2.6, 'g/dL'),
(5, 46, 6038, 12, '%'),
(6, 47, 6040, 33, 'pg/mL'),
(7, 48, 1411, 34, 'mg/dL'),
(8, 49, 7250, 391, 'G/L '),
(9, 50, 7256, -6.3, 'NULL'),
(10, 51, 7257, 7.7, 'fL'),
(11, 46, 7259, 14.9, '%'),
(12, 52, 7264, 3.1, 'g/L'),
(13, 50, 7772, 4, 'NULL'),
(14, 51, 7773, 7.9, 'fL'),
(15, 45, 7774, 2.81, 'g/dL'),
(16, 46, 7775, 16.3, '%'),
(17, 42, 3559, 12, 'UI/L'),
(18, 53, 3727, 2.285, 'G/L '),
(19, 54, 3931, 14.9, 'g/dL'),
(20, 55, 3934, 31.9, 'pg'),
(21, 56, 4393, 1.011, 'NULL'),
(22, 57, 1811, 3.5, 'mg/dL'),
(23, 56, 4181, 1.022, 'NULL'),
(24, 58, 4184, 1, '/mm3'),
(25, 55, 12769, 31.7, 'pg'),
(26, 59, 12770, 35.2, 'g/dL'),
(27, 51, 12778, 10.5, 'fL'),
(28, 45, 12779, 2.93, 'g/dL'),
(29, 60, 12786, 27.52, '%'),
(30, 61, 13043, 112, 'mg/dL'),
(31, 60, 13044, 43.75, '%'),
(32, 62, 8210, 2.84, 'mUI/L'),
(33, 59, 8470, 34, 'g/dL'),
(34, 51, 8478, 7, 'fL'),
(35, 63, 10622, 0.019, 'G/L '),
(36, 59, 4407, 34.7, 'g/dL'),
(37, 48, 19, 10, 'mg/dL'),
(38, 64, 3241, 19.82, 'G/L '),
(39, 49, 9275, 290, 'G/L '),
(40, 65, 9277, 3.142, 'G/L '),
(41, 48, 54, 39, 'mg/dL'),
(42, 50, 1462, -1.5, 'NULL'),
(43, 51, 1463, 8.4, 'fL'),
(44, 45, 1464, 2.54, 'g/dL'),
(45, 66, 1470, 29, 'UI/L'),
(46, 67, 1615, 5.07, 'T/L '),
(47, 50, 1627, 2.4, 'NULL'),
(48, 60, 1646, 16.8, '%'),
(49, 65, 1141, 2.546, 'G/L '),
(50, 68, 1919, 0.513, 'G/L '),
(51, 69, 7785, 5, 'mmol/L'),
(52, 51, 5511, 8.5, 'fL'),
(53, 46, 5513, 12.9, '%'),
(54, 60, 5526, 17.86, '%'),
(55, 70, 5531, 5.5, 'NULL'),
(56, 56, 5532, 1.022, 'NULL'),
(57, 58, 5535, 1, '/mm3'),
(58, 71, 5536, 5, '/mm3'),
(59, 72, 182, 91, 'fL'),
(60, 63, 396, 0.037, 'G/L '),
(61, 73, 464, 55, 'mg/dL'),
(62, 74, 2854, 144, 'mg/dL'),
(63, 62, 2858, 2.59, 'mUI/L'),
(64, 75, 899, 5.9, '%'),
(65, 68, 918, 0.388, 'G/L '),
(66, 76, 199, 0.8, 'mg/dL'),
(67, 43, 244, 1.2, 'mg/L'),
(68, 64, 225, 8.53, 'G/L '),
(69, 63, 237, 0.017, 'G/L '),
(70, 67, 226, 4.65, 'T/L '),
(71, 61, 405, 211, 'mg/dL'),
(72, 77, 6042, 187, 'µg/dL'),
(73, 78, 6043, 0.29, 'ng/mL'),
(74, 79, 6044, 50, 'nmol/L'),
(75, 80, 6045, 2.01, '%'),
(76, 81, 6046, 6.6, 'UI/L'),
(77, 82, 6047, 5.4, 'UI/L'),
(78, 83, 6051, 3, 'UI/mL'),
(79, 84, 6052, 3, 'UI/mL'),
(80, 55, 913, 28.9, 'pg'),
(81, 62, 898, 1.27, 'mUI/L'),
(82, 72, 912, 84.8, 'fL'),
(83, 65, 1094, 3.465, 'G/L '),
(84, 85, 1104, 165, 'U/L'),
(85, 55, 1090, 30.7, 'pg'),
(86, 66, 1426, 25, 'UI/L'),
(87, 53, 1881, 4.275, 'G/L '),
(88, 73, 4466, 55, 'mg/dL'),
(89, 42, 208, 35, 'UI/L'),
(90, 55, 230, 29.8, 'pg'),
(91, 48, 469, 30, 'mg/dL'),
(92, 86, 2342, 101, 'mg/dL'),
(93, 48, 2611, 53, 'mg/dL'),
(94, 68, 1187, 0.708, 'G/L '),
(95, 50, 1190, 4.1, 'NULL'),
(96, 73, 13045, 49, 'mg/dL'),
(97, 87, 13049, 1.6, 'ng/mL'),
(98, 88, 13052, 19.9, 'mg/dL'),
(99, 56, 13058, 1.01, 'NULL'),
(100, 89, 13066, 1.1, 'ng/mL'),
(101, 90, 13072, 20, 'UA/mL'),
(102, 91, 13073, 0.323, 'NULL'),
(103, 92, 13225, 41.2, '%'),
(104, 48, 11047, 24, 'mg/dL'),
(105, 76, 11048, 0.8, 'mg/dL'),
(106, 93, 11454, 13, 'UI/L'),
(107, 44, 17481, 3.11, 'NULL'),
(108, 94, 17482, 27, 'NULL'),
(109, 57, 11049, 3.6, 'mg/dL'),
(110, 63, 11214, 0.034, 'G/L '),
(111, 65, 8917, 2.609, 'G/L '),
(112, 95, 4572, 38.1, 'g/L'),
(113, 69, 4553, 4.8, 'mmol/L'),
(114, 76, 55, 0.7, 'mg/dL'),
(115, 67, 1450, 4.45, 'T/L '),
(116, 73, 60, 82, 'mg/dL'),
(117, 59, 9349, 33.5, 'g/dL'),
(118, 92, 9346, 44.8, '%'),
(119, 49, 9350, 284, 'G/L '),
(120, 53, 1726, 4.861, 'G/L '),
(121, 50, 1731, -5, 'NULL'),
(122, 48, 1739, 47, 'mg/dL'),
(123, 76, 1740, 0.8, 'mg/dL'),
(124, 60, 1745, 28.63, '%'),
(125, 74, 1747, 90, 'mg/dL'),
(126, 96, 1748, 0.4, 'mg/dL'),
(127, 70, 1758, 6, 'NULL'),
(128, 56, 1759, 1.017, 'NULL'),
(129, 67, 2114, 4.34, 'T/L '),
(130, 93, 2721, 83, 'UI/L'),
(131, 59, 268, 34.3, 'g/dL'),
(132, 97, 353, 8, 'mm'),
(133, 65, 917, 1.749, 'G/L '),
(134, 58, 3517, 0, 'NULL'),
(135, 44, 5748, 1.04, 'NULL'),
(136, 59, 1041, 35.9, 'g/dL'),
(137, 64, 7813, 10.03, 'G/L '),
(138, 94, 1034, 28, 'NULL'),
(139, 51, 7827, 7.4, 'fL'),
(140, 46, 7829, 13.1, '%'),
(141, 45, 7258, 2.71, 'g/dL'),
(142, 48, 245, 31, 'mg/dL'),
(143, 53, 233, 5.272, 'G/L '),
(144, 65, 322, 5.775, 'G/L '),
(145, 43, 354, 1.9, 'mg/L'),
(146, 42, 2855, 15, 'UI/L'),
(147, 59, 914, 34.1, 'g/dL'),
(148, 49, 915, 182, 'G/L '),
(149, 63, 623, 0.092, 'G/L '),
(150, 67, 909, 5.37, 'T/L '),
(151, 98, 1884, 0.377, 'G/L '),
(152, 51, 1887, 7.1, 'fL'),
(153, 97, 1891, 6, 'mm'),
(154, 99, 1894, 5.2, 'ng/mL'),
(155, 89, 1898, 1.42, 'ng/mL'),
(156, 60, 2377, 29.56, '%'),
(157, 89, 2383, 0.45, 'ng/mL'),
(158, 56, 2385, 1.015, 'NULL'),
(159, 58, 2388, 3, '/mm3'),
(160, 65, 1400, 3.39, 'G/L '),
(161, 67, 520, 5.41, 'T/L '),
(162, 73, 1127, 77, 'mg/dL'),
(163, 56, 3427, 1.021, 'NULL'),
(164, 58, 3430, 43, '/mm3'),
(165, 72, 1913, 91.9, 'fL'),
(166, 50, 1922, 5.1, 'NULL'),
(167, 45, 1924, 2.2, 'g/dL'),
(168, 46, 1925, 13.2, '%'),
(169, 100, 1933, 342, 'pg/mL'),
(170, 60, 1940, 58.55, '%'),
(171, 70, 1947, 5.5, 'NULL'),
(172, 71, 1952, 100, '/mm3'),
(173, 59, 13228, 34.8, 'g/dL'),
(174, 46, 13238, 12.6, '%'),
(175, 101, 13247, 1.16, 'NULL'),
(176, 102, 13254, 77, 'g/L'),
(177, 103, 13255, 2.8, 'g/L'),
(178, 104, 13266, 2, 'kU/L'),
(179, 105, 13259, 7.5, 'g/L'),
(180, 106, 13262, 1.6, 'NULL'),
(181, 107, 13268, 163, 'UI/mL'),
(182, 58, 7510, 2, '/mm3'),
(183, 58, 7670, 2, '/mm3'),
(184, 68, 13876, 0.514, 'G/L '),
(185, 61, 8941, 172, 'mg/dL'),
(186, 67, 12724, 4.68, 'T/L '),
(187, 92, 12726, 42.5, '%'),
(188, 63, 12735, 0.026, 'G/L '),
(189, 65, 12732, 2.771, 'G/L '),
(190, 43, 11368, 1, 'mg/L'),
(191, 73, 4558, 59, 'mg/dL'),
(192, 98, 6934, 0.132, 'G/L '),
(193, 102, 4570, 67, 'g/L'),
(194, 108, 1119, 1.4, 'ng/dL'),
(195, 65, 9872, 2.232, 'G/L '),
(196, 55, 340, 32.2, 'pg'),
(197, 55, 9697, 32.8, 'pg'),
(198, 58, 1762, 5, '/mm3'),
(199, 60, 1903, 31.67, '%');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `sexe` int(11) NOT NULL,
  `ville` varchar(255) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id_personne`, `age`, `sexe`, `ville`) VALUES
(19, 20, 1, 'RODANGE'),
(54, 20, 2, 'DIFFERDANGE'),
(55, 20, 2, 'DIFFERDANGE'),
(60, 20, 2, 'DIFFERDANGE'),
(182, 20, 2, 'SANEM'),
(199, 20, 2, 'SANEM'),
(208, 20, 2, 'SANEM'),
(225, 20, 2, 'DIFFERDANGE'),
(226, 20, 2, 'DIFFERDANGE'),
(230, 20, 2, 'DIFFERDANGE'),
(233, 20, 2, 'DIFFERDANGE'),
(237, 20, 2, 'DIFFERDANGE'),
(244, 20, 2, 'DIFFERDANGE'),
(245, 20, 2, 'DIFFERDANGE'),
(268, 20, 1, 'DIFFERDANGE'),
(322, 20, 2, 'SCHIFFLANGE'),
(340, 20, 1, 'DIFFERDANGE'),
(353, 20, 1, 'DIFFERDANGE'),
(354, 20, 1, 'DIFFERDANGE'),
(396, 20, 1, 'BASCHARAGE'),
(405, 20, 1, 'BASCHARAGE'),
(464, 20, 1, 'DIFFERDANGE'),
(469, 20, 1, 'DIFFERDANGE'),
(520, 20, 1, 'LUXEMBOURG'),
(623, 20, 2, 'ESCH-SUR-ALZETTE'),
(898, 20, 1, 'RODANGE'),
(899, 20, 1, 'RODANGE'),
(909, 20, 1, 'RODANGE'),
(912, 20, 1, 'RODANGE'),
(913, 20, 1, 'RODANGE'),
(914, 20, 1, 'RODANGE'),
(915, 20, 1, 'RODANGE'),
(917, 20, 1, 'RODANGE'),
(918, 20, 1, 'RODANGE'),
(1034, 20, 1, 'RODANGE'),
(1041, 20, 2, 'SCHIFFLANGE'),
(1090, 20, 2, 'LUXEMBOURG'),
(1094, 20, 2, 'LUXEMBOURG'),
(1104, 20, 2, 'LUXEMBOURG'),
(1119, 20, 2, 'Luxembourg'),
(1127, 20, 2, 'Luxembourg'),
(1141, 20, 1, 'ESCH-SUR-ALZETTE'),
(1187, 20, 2, 'MAMER'),
(1190, 20, 2, 'MAMER'),
(1400, 20, 1, 'LUXEMBOURG'),
(1411, 20, 1, 'LUXEMBOURG'),
(1426, 20, 1, 'LUXEMBOURG'),
(1450, 20, 2, 'DIFFERDANGE'),
(1462, 20, 2, 'DIFFERDANGE'),
(1463, 20, 2, 'DIFFERDANGE'),
(1464, 20, 2, 'DIFFERDANGE'),
(1468, 20, 2, 'DIFFERDANGE'),
(1470, 20, 2, 'DIFFERDANGE'),
(1615, 20, 1, 'DIFFERDANGE'),
(1627, 20, 1, 'DIFFERDANGE'),
(1646, 20, 1, 'DIFFERDANGE'),
(1726, 20, 2, 'DIFFERDANGE'),
(1731, 20, 2, 'DIFFERDANGE'),
(1739, 20, 2, 'DIFFERDANGE'),
(1740, 20, 2, 'DIFFERDANGE'),
(1745, 20, 2, 'DIFFERDANGE'),
(1747, 20, 2, 'DIFFERDANGE'),
(1748, 20, 2, 'DIFFERDANGE'),
(1758, 20, 2, 'DIFFERDANGE'),
(1759, 20, 2, 'DIFFERDANGE'),
(1762, 20, 2, 'DIFFERDANGE'),
(1811, 20, 2, 'DIFFERDANGE'),
(1881, 20, 1, 'LUXEMBOURG'),
(1884, 20, 1, 'LUXEMBOURG'),
(1887, 20, 1, 'LUXEMBOURG'),
(1891, 20, 1, 'LUXEMBOURG'),
(1894, 20, 1, 'LUXEMBOURG'),
(1898, 20, 1, 'LUXEMBOURG'),
(1903, 20, 1, 'DAHLEM'),
(1913, 20, 2, 'LAMADELAINE'),
(1919, 20, 2, 'LAMADELAINE'),
(1922, 20, 2, 'LAMADELAINE'),
(1924, 20, 2, 'LAMADELAINE'),
(1925, 20, 2, 'LAMADELAINE'),
(1933, 20, 2, 'LAMADELAINE'),
(1940, 20, 2, 'LAMADELAINE'),
(1947, 20, 2, 'LAMADELAINE'),
(1952, 20, 2, 'LAMADELAINE'),
(2114, 20, 2, 'PETANGE'),
(2342, 20, 1, 'ROODT (SEPTFONTAINES)'),
(2377, 20, 1, 'ROODT (SEPTFONTAINES)'),
(2383, 20, 1, 'ROODT (SEPTFONTAINES)'),
(2385, 20, 1, 'ROODT (SEPTFONTAINES)'),
(2388, 20, 1, 'ROODT (SEPTFONTAINES)'),
(2611, 20, 2, 'LUXEMBOURG'),
(2721, 20, 1, 'DIFFERDANGE'),
(2854, 20, 2, 'RODANGE'),
(2855, 20, 2, 'RODANGE'),
(2858, 20, 2, 'RODANGE'),
(3241, 20, 1, 'LUXEMBOURG'),
(3427, 20, 2, 'MENSDORF'),
(3430, 20, 2, 'MENSDORF'),
(3517, 20, 1, 'DAHLEM'),
(3559, 20, 2, 'LAMADELAINE'),
(3727, 20, 2, 'ESCH-SUR-ALZETTE'),
(3931, 20, 2, 'LUXEMBOURG'),
(3934, 20, 2, 'LUXEMBOURG'),
(4181, 20, 1, 'ESCH-SUR-ALZETTE'),
(4184, 20, 1, 'ESCH-SUR-ALZETTE'),
(4377, 20, 2, 'SENNINGEN'),
(4393, 20, 2, 'SENNINGEN'),
(4407, 20, 1, 'BOEVANGE-SUR-ATTERT'),
(4466, 20, 2, 'REMERSCHEN'),
(4553, 20, 2, 'LUXEMBOURG'),
(4558, 20, 2, 'LUXEMBOURG'),
(4570, 20, 2, 'LUXEMBOURG'),
(4572, 20, 2, 'LUXEMBOURG'),
(5511, 20, 2, 'DIFFERDANGE'),
(5513, 20, 2, 'DIFFERDANGE'),
(5526, 20, 2, 'DIFFERDANGE'),
(5531, 20, 2, 'DIFFERDANGE'),
(5532, 20, 2, 'DIFFERDANGE'),
(5535, 20, 2, 'DIFFERDANGE'),
(5536, 20, 2, 'DIFFERDANGE'),
(5748, 20, 2, 'RUMELANGE'),
(5778, 20, 2, 'SOLEUVRE'),
(6037, 20, 2, 'DIFFERDANGE'),
(6038, 20, 2, 'DIFFERDANGE'),
(6040, 20, 2, 'DIFFERDANGE'),
(6042, 20, 2, 'DIFFERDANGE'),
(6043, 20, 2, 'DIFFERDANGE'),
(6044, 20, 2, 'DIFFERDANGE'),
(6045, 20, 2, 'DIFFERDANGE'),
(6046, 20, 2, 'DIFFERDANGE'),
(6047, 20, 2, 'DIFFERDANGE'),
(6051, 20, 2, 'DIFFERDANGE'),
(6052, 20, 2, 'DIFFERDANGE'),
(6934, 20, 1, 'VICHTEN'),
(7250, 20, 1, 'DIFFERDANGE'),
(7256, 20, 1, 'DIFFERDANGE'),
(7257, 20, 1, 'DIFFERDANGE'),
(7258, 20, 1, 'DIFFERDANGE'),
(7259, 20, 1, 'DIFFERDANGE'),
(7264, 20, 1, 'DIFFERDANGE'),
(7510, 20, 1, 'HELMDANGE'),
(7670, 20, 1, 'NIEDERANVEN'),
(7772, 20, 2, 'SOLEUVRE'),
(7773, 20, 2, 'SOLEUVRE'),
(7774, 20, 2, 'SOLEUVRE'),
(7775, 20, 2, 'SOLEUVRE'),
(7785, 20, 2, 'SOLEUVRE'),
(7813, 20, 2, 'LUXEMBOURG'),
(7827, 20, 2, 'LUXEMBOURG'),
(7829, 20, 2, 'LUXEMBOURG'),
(8210, 20, 2, 'GREIVELDANGE'),
(8470, 20, 1, 'REMICH'),
(8478, 20, 1, 'REMICH'),
(8917, 20, 1, 'LUXEMBOURG'),
(8941, 20, 2, 'LUXEMBOURG'),
(9275, 20, 2, 'EVERLANGE'),
(9277, 20, 2, 'EVERLANGE'),
(9346, 20, 1, 'DIFFERDANGE'),
(9349, 20, 1, 'DIFFERDANGE'),
(9350, 20, 1, 'DIFFERDANGE'),
(9697, 20, 1, 'LUXEMBOURG'),
(9872, 20, 2, 'SCHIFFLANGE'),
(10622, 20, 1, 'RODANGE'),
(11047, 20, 2, 'EISCHEN'),
(11048, 20, 2, 'EISCHEN'),
(11049, 20, 2, 'EISCHEN'),
(11214, 20, 2, 'BECH-KLEINMACHER'),
(11368, 20, 2, 'ESCH-SUR-ALZETTE'),
(11454, 20, 2, 'DIFFERDANGE'),
(12724, 20, 1, 'HOSTERT (NIEDERANVEN)'),
(12726, 20, 1, 'HOSTERT (NIEDERANVEN)'),
(12732, 20, 1, 'HOSTERT (NIEDERANVEN)'),
(12735, 20, 1, 'HOSTERT (NIEDERANVEN)'),
(12769, 20, 1, 'LUXEMBOURG'),
(12770, 20, 1, 'LUXEMBOURG'),
(12778, 20, 1, 'LUXEMBOURG'),
(12779, 20, 1, 'LUXEMBOURG'),
(12786, 20, 1, 'LUXEMBOURG'),
(13043, 20, 1, 'BUSCHRODT'),
(13044, 20, 1, 'BUSCHRODT'),
(13045, 20, 1, 'BUSCHRODT'),
(13049, 20, 1, 'BUSCHRODT'),
(13052, 20, 1, 'BUSCHRODT'),
(13058, 20, 1, 'BUSCHRODT'),
(13066, 20, 1, 'BUSCHRODT'),
(13072, 20, 1, 'BUSCHRODT'),
(13073, 20, 1, 'BUSCHRODT'),
(13225, 20, 2, 'NAGEM'),
(13228, 20, 2, 'NAGEM'),
(13238, 20, 2, 'NAGEM'),
(13247, 20, 2, 'NAGEM'),
(13254, 20, 2, 'NAGEM'),
(13255, 20, 2, 'NAGEM'),
(13259, 20, 2, 'NAGEM'),
(13262, 20, 2, 'NAGEM'),
(13266, 20, 2, 'NAGEM'),
(13268, 20, 2, 'NAGEM'),
(13876, 20, 1, 'REDANGE-SUR-ATTERT'),
(17481, 20, 2, 'ESCH-SUR-ALZETTE'),
(17482, 20, 2, 'ESCH-SUR-ALZETTE');

-- --------------------------------------------------------

--
-- Structure de la table `type_an`
--

DROP TABLE IF EXISTS `type_an`;
CREATE TABLE IF NOT EXISTS `type_an` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `norme_min` decimal(10,3) DEFAULT NULL,
  `norme_max` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_an`
--

INSERT INTO `type_an` (`id_type`, `type`, `norme_min`, `norme_max`) VALUES
(42, 'GGT', NULL, '36.000'),
(43, 'CRP', NULL, '5.000'),
(44, 'INR', NULL, NULL),
(45, 'HDW', '2.200', '3.000'),
(46, 'RDW', '10.000', '14.500'),
(47, 'OE2', NULL, NULL),
(48, 'UREE', '10.000', '50.000'),
(49, 'PLAQ', '150.000', '450.000'),
(50, 'MPXI', '-20.000', '20.000'),
(51, 'MPV', '7.000', '10.000'),
(52, 'TRA', '2.000', '3.600'),
(53, 'NEUTRA', '1.500', '7.500'),
(54, 'HGB', '12.000', '16.000'),
(55, 'MCH', '27.000', '35.000'),
(56, 'B_URI_DEN', NULL, NULL),
(57, 'ACUR', '2.400', '5.700'),
(58, 'B_URI_LEU', NULL, '50.000'),
(59, 'MCHC', '32.000', '36.000'),
(60, 'CHOL_HDL', NULL, NULL),
(61, 'CHOL', NULL, '240.000'),
(62, 'TSH', '0.270', '4.200'),
(63, 'BASOA', NULL, '0.200'),
(64, 'WBC', '4.000', '10.000'),
(65, 'LYMPHA', '1.500', '4.000'),
(66, 'GPT', '7.000', '35.000'),
(67, 'RBC', '4.200', '5.800'),
(68, 'MONOA', '0.200', '0.800'),
(69, 'K', '3.500', '5.100'),
(70, 'B_URI_PH', NULL, NULL),
(71, 'B_URI_ERY', NULL, '15.000'),
(72, 'MCV', '82.000', '98.000'),
(73, 'HDL', '40.000', NULL),
(74, 'TRI', NULL, '150.000'),
(75, 'HBA1C', '4.000', '6.000'),
(76, 'CREA', '0.500', '1.000'),
(77, 'DHEAS', '75.000', '410.000'),
(78, 'TESTO', '0.150', '0.700'),
(79, 'SHBG', '20.000', '155.000'),
(80, 'TESLI', '0.500', '7.300'),
(81, 'LH', NULL, NULL),
(82, 'FSH', NULL, NULL),
(83, 'ACTPO', NULL, '5.600'),
(84, 'ACTG', NULL, '4.100'),
(85, 'LDH', '135.000', '215.000'),
(86, 'GLY', '60.000', '105.000'),
(87, 'AFP', NULL, '13.000'),
(88, 'LPA', NULL, '30.000'),
(89, 'PSA', NULL, '4.000'),
(90, 'HELIG', NULL, '20.000'),
(91, 'HELIAI', NULL, '0.799'),
(92, 'HCT', '34.000', '45.000'),
(93, 'GOT', '13.000', '35.000'),
(94, 'TP', '70.000', NULL),
(95, 'ALBUM', '34.000', '48.700'),
(96, 'BILIT', NULL, '1.000'),
(97, 'V1', NULL, '20.000'),
(98, 'EOSINA', NULL, '0.400'),
(99, 'FOL', '2.000', '9.100'),
(100, 'B12', '197.000', '866.000'),
(101, 'TCAR', NULL, '1.200'),
(102, 'PROT', '60.000', '80.000'),
(103, 'ALPHA1', '2.300', '4.200'),
(104, 'IGE', NULL, '100.000'),
(105, 'BETA', '5.500', '11.000'),
(106, 'ALB_GLO', '1.000', '1.800'),
(107, 'ASLO', NULL, '200.000'),
(108, 'FT4', '0.900', '1.700');

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
