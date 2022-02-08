-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 22 juil. 2021 à 12:45
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
iiiiiiii


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetmvc`
--

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
  `photo` varchar(200) DEFAULT NULL,
  `values` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`ID_Hotel`, `ID_Pays`, `ID_Region`, `ID_Categorie`, `Nom`, `tarif`, `description`, `photo`, `values`) VALUES
(1, 1, 2, 3, 'Le Java Hotel', '50.00', 'Doté d\'un restaurant, le Java Hotel vous accueille à Toamasina, à 2 km du port. Il possède une connexion Wi-Fi gratuite.Climatisées, toutes les chambres sont équipées d/\'une télévision et d\'un réfrigérateur. Leur salle de bains est munie d’une douche et d’articles de toilette gratuits. Les suites so', '${pageContext.request.contextPath}/assets/img/hotels/louvre_hotel.jpeg', 0),
(2, 1, 1, 3, 'Louvre Hotel', '70.00', 'Situé à Antananarivo, Le Louvre Hôtel & Spa est doté d\'une piscine intérieure ainsi que d\'un centre de spa et de bien-être. Il propose gratuitement une connexion Wi-Fi.\r\nToutes les chambres disposent de la climatisation, d\'une télévision par satellite et d\'un balcon. Leur salle de bains privative es', '${pageContext.request.contextPath}/assets/img/hotels/Le_Java.jpeg', 0),
(3, 2, 3, 4, 'Hotel EiffelCapitol', '150.00', 'L’Hotel Eiffel Capitol vous accueille à Paris, dans une rue paisible de la rive gauche, à seulement 10 minutes de marche de la tour Eiffel. Il propose des hébergements modernes avec connexion Wi-Fi gratuite et télévision par satellite.\r\nChaque logement comprend un plateau/bouilloire et une salle de ', '${pageContext.request.contextPath}/assets/img/hotels/Hotel_EiffelCapitol.jpeg', 0),
(4, 2, 4, 4, 'Fairmont MonteCarlo', '175.00', 'Le Novotel Monte-Carlo est situé au cœur de la principauté de Monaco, à quelques pas de la gare, de la place du Casino et du palais des congrès Grimaldi Forum. Il possède une piscine extérieure ouverte en saison avec chaises longues, une salle de sport, un hammam et un sauna. Rénové en 2019, cet hôt', '${pageContext.request.contextPath}/assets/img/hotels/FairmontMonteCarlo.jpeg', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`ID_Hotel`),
  ADD KEY `ID_Pays` (`ID_Pays`),
  ADD KEY `ID_Region` (`ID_Region`),
  ADD KEY `ID_Categorie` (`ID_Categorie`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `ID_Hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`ID_Pays`) REFERENCES `pays` (`ID_Pays`) ON DELETE CASCADE,
  ADD CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`ID_Region`) REFERENCES `region` (`ID_Region`) ON DELETE CASCADE,
  ADD CONSTRAINT `hotel_ibfk_3` FOREIGN KEY (`ID_Categorie`) REFERENCES `categorie` (`ID_Categorie`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
