-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 21 avr. 2025 à 21:48
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sickcare`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `id_administrateur` int NOT NULL AUTO_INCREMENT,
  `id_compte` int DEFAULT NULL,
  PRIMARY KEY (`id_administrateur`),
  KEY `Administrateur_ibfk_1` (`id_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id_administrateur`, `id_compte`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `aliment_recettes`
--

DROP TABLE IF EXISTS `aliment_recettes`;
CREATE TABLE IF NOT EXISTS `aliment_recettes` (
  `id_aliment` int NOT NULL AUTO_INCREMENT,
  `nom_aliment` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_aliment`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aliment_recettes`
--

INSERT INTO `aliment_recettes` (`id_aliment`, `nom_aliment`) VALUES
(1, 'oeuf'),
(2, 'pain'),
(3, 'sel'),
(4, 'poivre'),
(5, 'eau'),
(6, 'farine'),
(62, 'Sucre'),
(98, 'beurre'),
(99, 'œufs'),
(100, 'cacao'),
(101, 'crème'),
(102, 'pépites '),
(103, 'pâtes '),
(104, 'lardons'),
(105, 'steak '),
(106, 'Bun'),
(107, 'cheddar'),
(108, 'pommes de terre'),
(109, 'lait'),
(110, 'ail'),
(111, 'beurre cacahuète'),
(112, 'œuf'),
(113, 'arachides');

-- --------------------------------------------------------

--
-- Structure de la table `composer`
--

DROP TABLE IF EXISTS `composer`;
CREATE TABLE IF NOT EXISTS `composer` (
  `id_recette` int NOT NULL,
  `id_aliment` int NOT NULL,
  PRIMARY KEY (`id_recette`,`id_aliment`),
  KEY `Composer_ibfk_2` (`id_aliment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `composer`
--

INSERT INTO `composer` (`id_recette`, `id_aliment`) VALUES
(90, 6),
(94, 6),
(90, 62),
(94, 62),
(90, 98),
(90, 99),
(90, 100),
(90, 101),
(93, 101),
(90, 102),
(91, 103),
(91, 104),
(92, 105),
(92, 106),
(92, 107),
(93, 108),
(93, 109),
(93, 110),
(94, 111),
(94, 112),
(94, 113);

-- --------------------------------------------------------

--
-- Structure de la table `etre_malade`
--

DROP TABLE IF EXISTS `etre_malade`;
CREATE TABLE IF NOT EXISTS `etre_malade` (
  `id_compte` int NOT NULL,
  `id_maladie` int NOT NULL,
  PRIMARY KEY (`id_compte`,`id_maladie`),
  KEY `Etre_malade_ibfk_2` (`id_maladie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etre_malade`
--

INSERT INTO `etre_malade` (`id_compte`, `id_maladie`) VALUES
(23, 1);

-- --------------------------------------------------------

--
-- Structure de la table `maladie`
--

DROP TABLE IF EXISTS `maladie`;
CREATE TABLE IF NOT EXISTS `maladie` (
  `id_maladie` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_maladie`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `maladie`
--

INSERT INTO `maladie` (`id_maladie`, `nom`) VALUES
(1, 'diabète'),
(2, 'Cœliaquie '),
(3, 'Maladies cardiaques '),
(4, 'Lactose-intolérance'),
(5, 'Allergie aux arachides'),
(8, 'Maladie rénale'),
(17, 'Cancer');

-- --------------------------------------------------------

--
-- Structure de la table `provoque_alergie_à`
--

DROP TABLE IF EXISTS `provoque_alergie_à`;
CREATE TABLE IF NOT EXISTS `provoque_alergie_à` (
  `id_aliment` int NOT NULL,
  `id_maladie` int NOT NULL,
  PRIMARY KEY (`id_aliment`,`id_maladie`),
  KEY `provoque_alergie_à_FK_1` (`id_maladie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `provoque_alergie_à`
--

INSERT INTO `provoque_alergie_à` (`id_aliment`, `id_maladie`) VALUES
(6, 1),
(62, 1),
(98, 1),
(108, 1),
(6, 2),
(3, 3),
(98, 3),
(104, 3),
(105, 3),
(101, 4),
(107, 4),
(109, 4),
(102, 5),
(111, 5),
(113, 5),
(3, 8),
(105, 8);

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

DROP TABLE IF EXISTS `recettes`;
CREATE TABLE IF NOT EXISTS `recettes` (
  `id_recette` int NOT NULL AUTO_INCREMENT,
  `nom_recette` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description_recette` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `etape_recette` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_recette` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_recette`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recettes`
--

INSERT INTO `recettes` (`id_recette`, `nom_recette`, `description_recette`, `etape_recette`, `image_recette`) VALUES
(90, ' Gâteau au chocolat sucré', 'gateau', ' Fouetter beurre et sucre. Ajouter œufs, farine, cacao et crème. Cuire 25-30 min à 180°C.', '/assets/image/recettes/1745269420_2d2e009e7e76723ef5e3.jpg'),
(91, ' Pâtes carbonara', 'pate', 'Cuire pâtes. Mélanger œufs, crème et parmesan. Ajouter aux pâtes avec lardons.', '/assets/image/recettes/1745269499_fb585c8abd0c496481a4.jpg'),
(92, 'Burger gras', 'burger', ' Cuire steak et bacon. Monter burger avec fromage fondu et sauce.', '/assets/image/recettes/1745269534_5de3371b872b8efa1a04.jpg'),
(93, 'Gratin dauphinois', 'Gratin', 'Couper pommes de terre. Recouvrir de lait et crème. Cuire 1h à 180°C.', '/assets/image/recettes/1745269582_ef8847f8c9cd67e58ee1.jpg'),
(94, 'Cookies cacahuètes', 'Coockie', ' Mélanger ingrédients. Former cookies. Cuire 10 min à 180°C.', '/assets/image/recettes/1745269934_aa6da6a73fc127ff92ba.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_compte` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_compte`, `email`, `mot_de_passe`, `nom`, `prenom`) VALUES
(1, 'Admin@gmail.com', '$2y$10$f5qNk5wsFwEmYXppePO/.O6vujDS9dg9wHou5E0aiavZMUevlUGWy', 'Admin', 'Admin'),
(23, 'User@gmail.com', '$2y$10$grPLIh36q1t59t./vKCQoeF.cc3i7WH31XYLOU.z4OFTGHncWhxXC', 'User', 'John');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `Administrateur_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `users` (`id_compte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `composer`
--
ALTER TABLE `composer`
  ADD CONSTRAINT `Composer_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Composer_ibfk_2` FOREIGN KEY (`id_aliment`) REFERENCES `aliment_recettes` (`id_aliment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `etre_malade`
--
ALTER TABLE `etre_malade`
  ADD CONSTRAINT `Etre_malade_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `users` (`id_compte`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Etre_malade_ibfk_2` FOREIGN KEY (`id_maladie`) REFERENCES `maladie` (`id_maladie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `provoque_alergie_à`
--
ALTER TABLE `provoque_alergie_à`
  ADD CONSTRAINT `provoque_alergie_à_FK` FOREIGN KEY (`id_aliment`) REFERENCES `aliment_recettes` (`id_aliment`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `provoque_alergie_à_FK_1` FOREIGN KEY (`id_maladie`) REFERENCES `maladie` (`id_maladie`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
