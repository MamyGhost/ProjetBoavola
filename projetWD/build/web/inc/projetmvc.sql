-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 14 juin 2021 à 23:07
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetmvc`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `ID_Activite` int(11) NOT NULL,
  `NOM` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`ID_Activite`, `NOM`) VALUES
(1, 'Court de Tennis'),
(2, 'Centre de remise en forme'),
(3, 'Spa'),
(4, 'Sauna'),
(5, 'Massages'),
(6, 'Bain à vapeur'),
(7, 'Pixine');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` int(11) NOT NULL,
  `Pseudo` varchar(50) DEFAULT NULL,
  `Mdp` varchar(175) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`ID_Admin`, `Pseudo`, `Mdp`) VALUES
(1, 'Admin', '0000');

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `ID_Avis` int(11) NOT NULL,
  `ID_Hotel` int(11) DEFAULT NULL,
  `ID_Visiteur` int(11) DEFAULT NULL,
  `Commentaire` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `ID_Categorie` int(11) NOT NULL,
  `Etoiles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`ID_Categorie`, `Etoiles`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE `equipement` (
  `ID_Equipement` int(11) NOT NULL,
  `NOM` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`ID_Equipement`, `NOM`) VALUES
(1, 'Parking'),
(2, 'Wi-Fi Gratuit'),
(3, 'Parking'),
(4, 'Animaux domestiques admis'),
(5, 'Restaurant'),
(6, 'Salle de Sports');

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `ID_Hotel` int(11) NOT NULL,
  `ID_Pays` int(11) DEFAULT NULL,
  `ID_Region` int(11) DEFAULT NULL,
  `ID_Categorie` int(11) DEFAULT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `tarif` decimal(7,2) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `listea`
--

CREATE TABLE `listea` (
  `ID_ListeA` int(11) NOT NULL,
  `ID_Hotel` int(11) DEFAULT NULL,
  `ID_Activite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `listee`
--

CREATE TABLE `listee` (
  `ID_ListeE` int(11) NOT NULL,
  `ID_Hotel` int(11) DEFAULT NULL,
  `ID_Equipement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `ID_Pays` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`ID_Pays`, `Nom`) VALUES
(1, 'Madagascar'),
(2, 'France'),
(3, 'USA'),
(4, 'Brezil');

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE `region` (
  `ID_Region` int(11) NOT NULL,
  `ID_Pays` int(11) DEFAULT NULL,
  `Nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`ID_Region`, `ID_Pays`, `Nom`) VALUES
(1, 1, 'Antananarivo'),
(2, 1, 'Tamatave'),
(3, 2, 'Paris'),
(4, 2, 'Monaco'),
(5, 3, 'New York'),
(6, 3, 'Las Vegas'),
(7, 4, 'Rio de Janeiro'),
(8, 4, 'Brazilia');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `ID_Reservation` int(11) NOT NULL,
  `ID_Hotel` int(11) DEFAULT NULL,
  `ID_Visiteur` int(11) DEFAULT NULL,
  `Date_A` datetime DEFAULT NULL,
  `Date_D` datetime DEFAULT NULL,
  `Nbr_Personne` int(11) DEFAULT NULL,
  `Lit` int(11) DEFAULT NULL,
  `Cout` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `ID_Visiteur` int(11) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `Numero` char(10) DEFAULT NULL,
  `Mdp` varchar(175) DEFAULT NULL,
  `Vola` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`ID_Visiteur`, `Nom`, `Prenom`, `Mail`, `Numero`, `Mdp`, `Vola`) VALUES
(1, 'Rakoto', 'Bema', 'bema@gmail.com', '0340924600', '0000', '5000.00'),
(2, 'Rakotovao', 'Lita', 'lita@gmail.com', '0340924698', '0000', '5000.00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`ID_Activite`);

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`);

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`ID_Avis`),
  ADD KEY `ID_Hotel` (`ID_Hotel`),
  ADD KEY `ID_Visiteur` (`ID_Visiteur`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`ID_Categorie`);

--
-- Index pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`ID_Equipement`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`ID_Hotel`),
  ADD KEY `ID_Region` (`ID_Region`),
  ADD KEY `ID_Categorie` (`ID_Categorie`);

--
-- Index pour la table `listea`
--
ALTER TABLE `listea`
  ADD PRIMARY KEY (`ID_ListeA`),
  ADD KEY `ID_Hotel` (`ID_Hotel`),
  ADD KEY `ID_Activite` (`ID_Activite`);

--
-- Index pour la table `listee`
--
ALTER TABLE `listee`
  ADD PRIMARY KEY (`ID_ListeE`),
  ADD KEY `ID_Hotel` (`ID_Hotel`),
  ADD KEY `ID_Equipement` (`ID_Equipement`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`ID_Pays`);

--
-- Index pour la table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`ID_Region`),
  ADD KEY `ID_Pays` (`ID_Pays`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ID_Reservation`),
  ADD KEY `ID_Hotel` (`ID_Hotel`),
  ADD KEY `ID_Visiteur` (`ID_Visiteur`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`ID_Visiteur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `ID_Activite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_Admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `ID_Avis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `ID_Categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `equipement`
--
ALTER TABLE `equipement`
  MODIFY `ID_Equipement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `ID_Hotel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `listea`
--
ALTER TABLE `listea`
  MODIFY `ID_ListeA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `listee`
--
ALTER TABLE `listee`
  MODIFY `ID_ListeE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `ID_Pays` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `region`
--
ALTER TABLE `region`
  MODIFY `ID_Region` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ID_Reservation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `visiteur`
--
ALTER TABLE `visiteur`
  MODIFY `ID_Visiteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`ID_Hotel`) REFERENCES `hotel` (`ID_Hotel`),
  ADD CONSTRAINT `avis_ibfk_2` FOREIGN KEY (`ID_Visiteur`) REFERENCES `visiteur` (`ID_Visiteur`);

--
-- Contraintes pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`ID_Region`) REFERENCES `region` (`ID_Region`),
  ADD CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`ID_Categorie`) REFERENCES `categorie` (`ID_Categorie`);

--
-- Contraintes pour la table `listea`
--
ALTER TABLE `listea`
  ADD CONSTRAINT `listea_ibfk_1` FOREIGN KEY (`ID_Hotel`) REFERENCES `hotel` (`ID_Hotel`),
  ADD CONSTRAINT `listea_ibfk_2` FOREIGN KEY (`ID_Activite`) REFERENCES `activite` (`ID_Activite`);

--
-- Contraintes pour la table `listee`
--
ALTER TABLE `listee`
  ADD CONSTRAINT `listee_ibfk_1` FOREIGN KEY (`ID_Hotel`) REFERENCES `hotel` (`ID_Hotel`),
  ADD CONSTRAINT `listee_ibfk_2` FOREIGN KEY (`ID_Equipement`) REFERENCES `equipement` (`ID_Equipement`);

--
-- Contraintes pour la table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`ID_Pays`) REFERENCES `pays` (`ID_Pays`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`ID_Hotel`) REFERENCES `hotel` (`ID_Hotel`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`ID_Visiteur`) REFERENCES `visiteur` (`ID_Visiteur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
