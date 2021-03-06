-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 16 nov. 2017 à 10:58
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
-- Structure de la table `commune_to_canton`
--

DROP TABLE IF EXISTS `commune_to_canton`;
CREATE TABLE IF NOT EXISTS `commune_to_canton` (
  `Id` int(3) DEFAULT NULL,
  `Communes` varchar(20) DEFAULT NULL,
  `Cantons` varchar(16) DEFAULT NULL,
  `Population` int(6) DEFAULT NULL,
  `Cartodb_id` int(3) DEFAULT NULL,
  `Echelle` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commune_to_canton`
--

INSERT INTO `commune_to_canton` (`Id`, `Communes`, `Cantons`, `Population`, `Cartodb_id`, `Echelle`) VALUES
(1, 'Luxembourg', 'Luxembourg', 103641, 13, 8),
(2, 'Esch-sur-Alzette', 'Esch-sur-Alzette', 31898, 1, 8),
(3, 'Differdange', 'Esch-sur-Alzette', 22769, 11, 8),
(4, 'Dudelange', 'Esch-sur-Alzette', 19292, 6, 8),
(5, 'Petange', 'Esch-sur-Alzette', 16762, 12, 8),
(6, 'Sanem', 'Esch-sur-Alzette', 14832, 10, 8),
(7, 'Hesperange', 'Luxembourg', 14027, 36, 8),
(8, 'Bettembourg', 'Esch-sur-Alzette', 9952, 29, 8),
(9, 'Kaerjeng', 'Capellen', 9722, 27, 8),
(10, 'Schifflange', 'Esch-sur-Alzette', 9134, 3, 7),
(11, 'Mersch', 'Mersch', 8467, 70, 7),
(12, 'Ettelbruck', 'Diekirch', 8095, 67, 7),
(13, 'Kayl', 'Esch-sur-Alzette', 7934, 5, 7),
(14, 'Mamer', 'Capellen', 7857, 33, 7),
(15, 'Strassen', 'Luxembourg', 7699, 34, 7),
(16, 'Walferdange', 'Luxembourg', 7563, 43, 7),
(17, 'Junglinster', 'Grevenmacher', 6630, 48, 7),
(18, 'Diekirch', 'Diekirch', 6518, 63, 7),
(19, 'Bertrange', 'Luxembourg', 6435, 35, 7),
(20, 'Mondercange', 'Esch-sur-Alzette', 6280, 2, 7),
(21, 'Wiltz', 'Wiltz', 6087, 103, 7),
(22, 'Niederanven', 'Luxembourg', 5552, 41, 6),
(23, 'Roeser', 'Esch-sur-Alzette', 5432, 30, 6),
(24, 'Echternach', 'Echternach', 5367, 59, 6),
(25, 'Rumelange', 'Esch-sur-Alzette', 5168, 4, 6),
(26, 'Kehlen', 'Capellen', 5099, 31, 6),
(27, 'Steinsel', 'Luxembourg', 4866, 42, 6),
(28, 'Clervaux', 'Clervaux', 4603, 88, 6),
(29, 'Steinfort', 'Capellen', 4576, 24, 6),
(30, 'Grevenmacher', 'Grevenmacher', 4526, 46, 6),
(31, 'Mondorf-les-Bains', 'Remich', 4446, 19, 6),
(32, 'Schengen', 'Remich', 4223, 20, 6),
(33, 'Mertert', 'Grevenmacher', 4145, 51, 6),
(34, 'Rambrouch', 'Redange', 4025, 97, 5),
(35, 'Wincrange', 'Clervaux', 3944, 87, 5),
(36, 'Frisange', 'Esch-sur-Alzette', 3884, 7, 5),
(37, 'Schuttrange', 'Luxembourg', 3826, 40, 5),
(38, 'Dippach', 'Capellen', 3727, 28, 5),
(39, 'Lorentzweiler', 'Mersch', 3586, 76, 5),
(40, 'Contern', 'Luxembourg', 3517, 39, 5),
(41, 'Betzdorf', 'Grevenmacher', 3467, 47, 5),
(42, 'Remich', 'Remich', 3442, 18, 5),
(43, 'Sandweiler', 'Luxembourg', 3306, 38, 5),
(44, 'Hobscheid', 'Capellen', 3239, 22, 5),
(45, 'Kopstal', 'Capellen', 3167, 32, 5),
(46, 'Parc Hosingen', 'Clervaux', 3111, 84, 4),
(47, 'Troisvierges', 'Clervaux', 3017, 85, 4),
(48, 'Bissen', 'Mersch', 2794, 72, 4),
(49, 'Lintgen', 'Mersch', 2734, 78, 4),
(50, 'Vallee de L\'Ernz', 'Diekirch', 2431, 61, 4),
(51, 'Esch-sur-Sure', 'Wiltz', 2418, 99, 4),
(52, 'Redange-sur-Attert', 'Redange', 2631, 98, 4),
(53, 'Bettendorf', 'Diekirch', 2614, 68, 4),
(54, 'Wormeldange', 'Grevenmacher', 2502, 44, 4),
(55, 'Beckerich', 'Redange', 2383, 95, 4),
(56, 'Beaufort', 'Echternach', 2372, 52, 4),
(57, 'Erpeldange', 'Diekirch', 2337, 62, 4),
(58, 'Koerich', 'Capellen', 2294, 25, 3),
(59, 'Leudelange', 'Esch-sur-Alzette', 2241, 8, 3),
(60, 'Reckange-sur-Mess', 'Esch-sur-Alzette', 2179, 9, 3),
(61, 'Boevange-sur-Attert', 'Mersch', 2179, 75, 3),
(62, 'Rosport', 'Echternach', 2097, 57, 3),
(63, 'Larochette', 'Mersch', 2051, 73, 3),
(64, 'Weiler-la-Tour', 'Luxembourg', 2032, 37, 3),
(65, 'Colmar-Berg', 'Mersch', 2006, 74, 3),
(66, 'Dalheim', 'Remich', 1995, 14, 3),
(67, 'Consdorf', 'Echternach', 1827, 53, 3),
(68, 'Garnich', 'Capellen', 1931, 26, 3),
(69, 'Mertzig', 'Diekirch', 1912, 64, 3),
(70, 'Berdorf', 'Echternach', 1882, 55, 2),
(71, 'Flaxweiler', 'Grevenmacher', 1828, 45, 2),
(72, 'Manternach', 'Grevenmacher', 1824, 50, 2),
(73, 'Vianden', 'Vianden', 1809, 82, 2),
(74, 'Tandel', 'Vianden', 1772, 81, 2),
(75, 'Lenningen', 'Remich', 1739, 21, 2),
(76, 'Biwer', 'Grevenmacher', 1741, 49, 2),
(77, 'Schieren', 'Diekirch', 1683, 69, 2),
(78, 'Lac de la Haute-Sure', 'Wiltz', 1606, 102, 2),
(79, 'Stadtbredimus', 'Remich', 1601, 17, 2),
(80, 'Feulen', 'Diekirch', 1587, 65, 2),
(81, 'Useldange', 'Redange', 1575, 93, 2),
(82, 'Bourscheid', 'Diekirch', 1501, 66, 1),
(83, 'Preizerdaul', 'Redange', 1469, 91, 1),
(84, 'Weiswampach', 'Clervaux', 1440, 86, 1),
(85, 'Bous', 'Remich', 1434, 16, 1),
(86, 'Waldbillig', 'Echternach', 1390, 60, 1),
(87, 'Tuntange', 'Mersch', 1364, 80, 1),
(88, 'Goesdorf', 'Wiltz', 1341, 101, 1),
(89, 'Mompach', 'Echternach', 1181, 58, 1),
(90, 'Bech', 'Echternach', 1160, 54, 1),
(91, 'Nommern', 'Mersch', 1144, 71, 1),
(92, 'Heffingen', 'Mersch', 1127, 77, 1),
(93, 'Ell', 'Redange', 1125, 96, 1),
(94, 'Reisdorf', 'Diekirch', 1077, 56, 0),
(95, 'Winseler', 'Wiltz', 1073, 104, 0),
(96, 'Kiischpelt', 'Wiltz', 1071, 105, 0),
(97, 'Putscheid', 'Vianden', 1040, 83, 0),
(98, 'Boulaide', 'Wiltz', 1022, 100, 0),
(99, 'Fischbach', 'Mersch', 1016, 79, 0),
(100, 'Vichten', 'Redange', 1013, 92, 0),
(101, 'Waldbredimus', 'Remich', 965, 15, 0),
(102, 'Grosbous', 'Redange', 892, 89, 0),
(103, 'Wahl', 'Redange', 870, 90, 0),
(104, 'Septfontaines', 'Capellen', 822, 23, 0),
(105, 'Saeul', 'Redange', 714, 94, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
