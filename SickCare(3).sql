-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 27 mars 2025 à 14:15
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
-- Base de données : `SickCare`
--

-- --------------------------------------------------------

--
-- Structure de la table `Administrateur`
--

CREATE TABLE `Administrateur` (
  `id_administrateur` int(11) NOT NULL,
  `id_compte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Administrateur`
--

INSERT INTO `Administrateur` (`id_administrateur`, `id_compte`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Aliment_recettes`
--

CREATE TABLE `Aliment_recettes` (
  `id_aliment` int(11) NOT NULL,
  `nom_aliment` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Aliment_recettes`
--

INSERT INTO `Aliment_recettes` (`id_aliment`, `nom_aliment`) VALUES
(1, 'oeuf'),
(2, 'pain'),
(3, 'sel'),
(4, 'poivre'),
(5, 'eau'),
(6, 'farine');

-- --------------------------------------------------------

--
-- Structure de la table `Composer`
--

CREATE TABLE `Composer` (
  `id_recette` int(11) NOT NULL,
  `id_aliment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Etre_malade`
--

CREATE TABLE `Etre_malade` (
  `id_compte` int(11) NOT NULL,
  `id_maladie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Maladie`
--

CREATE TABLE `Maladie` (
  `id_maladie` int(1) NOT NULL,
  `nom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Maladie`
--

INSERT INTO `Maladie` (`id_maladie`, `nom`) VALUES
(1, 'diabète');

-- --------------------------------------------------------

--
-- Structure de la table `provoque_alergie_à`
--

CREATE TABLE `provoque_alergie_à` (
  `id_aliment` int(11) NOT NULL,
  `id_maladie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recettes`
--

CREATE TABLE `recettes` (
  `id_recette` int(11) NOT NULL,
  `nom_recette` varchar(255) NOT NULL,
  `description_recette` varchar(100) DEFAULT NULL,
  `etape_recette` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Admin@gmail.com', '$2y$10$u.7BgepEIL0hEwcAmd4kyerhKTpz96mlxJMIUyX2LdSA6UpOPAQpe', 'Admin', 'Admin'),
(10, 'Johnh@gmail0.com', '$2y$10$mxzXv40x.qbB9qW2tGcMmemq2SL1x2oE6UY2tzjR03gDQ/u6Qm8zy', 'john', 'halo');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Administrateur`
--
ALTER TABLE `Administrateur`
  ADD PRIMARY KEY (`id_administrateur`),
  ADD KEY `Administrateur_ibfk_1` (`id_compte`);

--
-- Index pour la table `Aliment_recettes`
--
ALTER TABLE `Aliment_recettes`
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
-- Index pour la table `Maladie`
--
ALTER TABLE `Maladie`
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
-- AUTO_INCREMENT pour la table `Administrateur`
--
ALTER TABLE `Administrateur`
  MODIFY `id_administrateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Aliment_recettes`
--
ALTER TABLE `Aliment_recettes`
  MODIFY `id_aliment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `Maladie`
--
ALTER TABLE `Maladie`
  MODIFY `id_maladie` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `recettes`
--
ALTER TABLE `recettes`
  MODIFY `id_recette` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_compte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Administrateur`
--
ALTER TABLE `Administrateur`
  ADD CONSTRAINT `Administrateur_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `users` (`id_compte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Composer`
--
ALTER TABLE `Composer`
  ADD CONSTRAINT `Composer_ibfk_1` FOREIGN KEY (`id_recette`) REFERENCES `recettes` (`id_recette`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Composer_ibfk_2` FOREIGN KEY (`id_aliment`) REFERENCES `Aliment_recettes` (`id_aliment`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Etre_malade`
--
ALTER TABLE `Etre_malade`
  ADD CONSTRAINT `Etre_malade_ibfk_1` FOREIGN KEY (`id_compte`) REFERENCES `users` (`id_compte`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Etre_malade_ibfk_2` FOREIGN KEY (`id_maladie`) REFERENCES `Maladie` (`id_maladie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `provoque_alergie_à`
--
ALTER TABLE `provoque_alergie_à`
  ADD CONSTRAINT `provoque_alergie_à_FK` FOREIGN KEY (`id_aliment`) REFERENCES `Aliment_recettes` (`id_aliment`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `provoque_alergie_à_FK_1` FOREIGN KEY (`id_maladie`) REFERENCES `Maladie` (`id_maladie`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
