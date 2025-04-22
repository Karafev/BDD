-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 22 avr. 2025 à 09:40
-- Version du serveur : 10.11.6-MariaDB-0+deb12u1
-- Version de PHP : 8.2.7

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

CREATE TABLE `administrateur` (
  `id_administrateur` int(11) NOT NULL,
  `id_compte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id_administrateur`, `id_compte`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `aliment_recettes`
--

CREATE TABLE `aliment_recettes` (
  `id_aliment` int(11) NOT NULL,
  `nom_aliment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(113, 'arachides'),
(117, 'biscuits Graham'),
(118, 'fromage à la crème'),
(119, 'sucre glace'),
(120, 'crème entière liquide'),
(121, 'café d’extrait de vanille'),
(122, 'baies mélangées');

-- --------------------------------------------------------

--
-- Structure de la table `Composer`
--

CREATE TABLE `Composer` (
  `id_recette` int(11) NOT NULL,
  `id_aliment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Composer`
--

INSERT INTO `Composer` (`id_recette`, `id_aliment`) VALUES
(90, 6),
(90, 62),
(90, 98),
(90, 99),
(90, 100),
(90, 101),
(90, 102),
(91, 103),
(91, 104),
(92, 105),
(92, 106),
(92, 107),
(93, 101),
(93, 108),
(93, 109),
(93, 110),
(94, 6),
(94, 62),
(94, 111),
(94, 112),
(94, 113),
(97, 62),
(97, 117),
(97, 118),
(97, 119),
(97, 120),
(97, 121),
(97, 122);

-- --------------------------------------------------------

--
-- Structure de la table `Etre_malade`
--

CREATE TABLE `Etre_malade` (
  `id_compte` int(11) NOT NULL,
  `id_maladie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Etre_malade`
--

INSERT INTO `Etre_malade` (`id_compte`, `id_maladie`) VALUES
(23, 1),
(25, 3);

-- --------------------------------------------------------

--
-- Structure de la table `maladie`
--

CREATE TABLE `maladie` (
  `id_maladie` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `maladie`
--

INSERT INTO `maladie` (`id_maladie`, `nom`) VALUES
(1, 'diabète'),
(2, 'Cœliaquie '),
(3, 'Maladies cardiaques '),
(4, 'Lactose-intolérance'),
(5, 'Allergie aux arachides'),
(8, 'Maladie rénale');

-- --------------------------------------------------------

--
-- Structure de la table `provoque_alergie_à`
--

CREATE TABLE `provoque_alergie_à` (
  `id_aliment` int(11) NOT NULL,
  `id_maladie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `provoque_alergie_à`
--

INSERT INTO `provoque_alergie_à` (`id_aliment`, `id_maladie`) VALUES
(3, 3),
(3, 8),
(6, 1),
(6, 2),
(62, 1),
(98, 1),
(98, 3),
(101, 4),
(102, 5),
(104, 3),
(105, 3),
(105, 8),
(107, 4),
(108, 1),
(109, 4),
(111, 5),
(113, 5);

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

CREATE TABLE `recettes` (
  `id_recette` int(11) NOT NULL,
  `nom_recette` varchar(255) NOT NULL,
  `description_recette` varchar(100) DEFAULT NULL,
  `etape_recette` varchar(100) DEFAULT NULL,
  `image_recette` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recettes`
--

INSERT INTO `recettes` (`id_recette`, `nom_recette`, `description_recette`, `etape_recette`, `image_recette`) VALUES
(90, ' Gâteau au chocolat sucré', 'gateau', ' Fouetter beurre et sucre. Ajouter œufs, farine, cacao et crème. Cuire 25-30 min à 180°C.', '/assets/image/recettes/1745269420_2d2e009e7e76723ef5e3.jpg'),
(91, ' Pâtes carbonara', 'pate', 'Cuire pâtes. Mélanger œufs, crème et parmesan. Ajouter aux pâtes avec lardons.', '/assets/image/recettes/1745269499_fb585c8abd0c496481a4.jpg'),
(92, 'Burger gras', 'burger', ' Cuire steak et bacon. Monter burger avec fromage fondu et sauce.', '/assets/image/recettes/1745269534_5de3371b872b8efa1a04.jpg'),
(93, 'Gratin dauphinois', 'Gratin', 'Couper pommes de terre. Recouvrir de lait et crème. Cuire 1h à 180°C.', '/assets/image/recettes/1745269582_ef8847f8c9cd67e58ee1.jpg'),
(94, 'Cookies cacahuètes', 'Coockie', ' Mélanger ingrédients. Former cookies. Cuire 10 min à 180°C.', '/assets/image/recettes/1745269934_aa6da6a73fc127ff92ba.jpg'),
(97, 'Berried Delight', 'Le Berried Delight est un dessert frais et léger, parfait pour les journées d\'été ou pour toute occa', 'Préchauffez votre four à 175°C (350°F). Dans un bol, mélangez 150 g de biscuits Graham (ou biscuits ', '/assets/image/recettes/1745312388_68b3f349e46b8a4584ce.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_compte` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_compte`, `email`, `mot_de_passe`, `nom`, `prenom`) VALUES
(1, 'admin@gmail.com', '$2y$10$XvOosF0uXASETNoDb0ftGODvMHp4IA4.4ffZjcm4fdStdEheswWJG', 'Admin', 'Admin'),
(23, 'User@gmail.com', '$2y$10$grPLIh36q1t59t./vKCQoeF.cc3i7WH31XYLOU.z4OFTGHncWhxXC', 'User', 'John'),
(25, 'JohnDOOM@gmail.com', '$2y$10$ZUjQX2nI8Guy0kkLqjyGau3mQwkOrA299k25FisZrpQU/4NVUQoMG', 'DOOM', 'John');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id_administrateur`),
  ADD KEY `Administrateur_ibfk_1` (`id_compte`);

--
-- Index pour la table `aliment_recettes`
--
ALTER TABLE `aliment_recettes`
  ADD PRIMARY KEY (`id_aliment`);

--
-- Index pour la table `Composer`
--
ALTER TABLE `Composer`
  ADD PRIMARY KEY (`id_recette`,`id_aliment`),
  ADD KEY `Composer_ibfk_2` (`id_aliment`);

--
-- Index pour la table `Etre_malade`
--
ALTER TABLE `Etre_malade`
  ADD PRIMARY KEY (`id_compte`,`id_maladie`),
  ADD KEY `Etre_malade_ibfk_2` (`id_maladie`);

--
-- Index pour la table `maladie`
--
ALTER TABLE `maladie`
  ADD PRIMARY KEY (`id_maladie`);

--
-- Index pour la table `provoque_alergie_à`
--
ALTER TABLE `provoque_alergie_à`
  ADD PRIMARY KEY (`id_aliment`,`id_maladie`),
  ADD KEY `provoque_alergie_à_FK_1` (`id_maladie`);

--
-- Index pour la table `recettes`
--
ALTER TABLE `recettes`
  ADD PRIMARY KEY (`id_recette`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_compte`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `id_administrateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `aliment_recettes`
--
ALTER TABLE `aliment_recettes`
  MODIFY `id_aliment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT pour la table `maladie`
--
ALTER TABLE `maladie`
  MODIFY `id_maladie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `recettes`
--
ALTER TABLE `recettes`
  MODIFY `id_recette` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_compte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `Administrateur_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `users` (`id_compte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Composer`
--
ALTER TABLE `Composer`
  ADD CONSTRAINT `Composer_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Composer_ibfk_2` FOREIGN KEY (`id_aliment`) REFERENCES `aliment_recettes` (`id_aliment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Etre_malade`
--
ALTER TABLE `Etre_malade`
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
