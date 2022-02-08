-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 30 juil. 2021 à 01:09
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
  `description` varchar(3000) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `valeur` int(11) DEFAULT NULL,
  `hebergement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`ID_Hotel`, `ID_Pays`, `ID_Region`, `ID_Categorie`, `Nom`, `tarif`, `description`, `photo`, `valeur`, `hebergement`) VALUES
(1, 1, 1, 2, 'The Citizen', '70.00', 'Situé à Antananarivo, l\'établissement The Citizen propose un hébergement réservé aux adultes, un restaurant, un bar et un jardin. Toutes les chambres disposent d\'une télévision par satellite à écran plat et d\'une salle de bains privative. Offrant une vue sur le lac, les chambres climatisées disposent d\'un bureau et d\'une connexion Wi-Fi gratuite.\nLes chambres comprennent une armoire.\nUn petit-déjeuner continental est servi chaque matin.\nLors de votre séjour, vous pourrez profiter d\'une terrasse.\nLe monument aux morts d\'Antananarivo, le musée des pirates d\'Antananarivo et le marché d\'Analakely se trouvent à proximité. L\'aéroport d\'Ivato, le plus proche, est implanté à 13 km. L\'établissement assure un service de navette aéroport moyennant des frais supplémentaires.\nC\'est le quartier préféré des voyageurs visitant Antananarivo, selon les commentaires clients indépendants.', 'projetWD/assets/img/hotels/citizen.jpg', 0, 5),
(2, 1, 2, 3, 'Java Hotel', '60.00', 'Doté d\'un restaurant, le Java Hotel vous accueille à Toamasina, à 2 km du port. Il possède une connexion Wi-Fi gratuite.\nClimatisées, toutes les chambres sont équipées d\'une télévision et d\'un réfrigérateur. Leur salle de bains est munie d\'une douche et d\'articles de toilette gratuits. Les suites sont, quant à elles, pourvues d\'une baignoire spa.\nLors de votre séjour au Java Hotel, vous apprécierez la réception ouverte 24h/24 et le salon commun. Des services de blanchisserie et de repassage sont assurés et le parking sur place est accessible gracieusement.\nVous pourrez vous rendre au parc Ivoloina en conduisant 20 minutes.', 'projetWD/assets/img/hotels/java.jpg', 0, 4),
(3, 2, 3, 5, 'Le Narcisse Blanc', '100.00', 'Doté d\'une connexion Wi-Fi accessible gratuitement dans l\'ensemble des locaux, l\'établissement Le Narcisse Blanc vous accueille à Paris, dans le 7ème arrondissement. Les stations de métro Invalides et La Tour-Maubourg se trouvent à 5 minutes à pied. L\'établissement propose un spa avec un sauna, un hammam et une salle de sport.\nLes chambres disposent d\'une télévision par câble à écran plat, d\'un lecteur Blu-ray, ainsi que d\'une machine à café. Les suites sont pourvues d\'un coin salon où vous pourrez vous détendre. Tous les logements comportent une salle de bains privative munie d\'une baignoire ou d\'une douche, de peignoirs et de chaussons.\nL\'établissement Le Narcisse Blanc & Spa possède aussi une réception ouverte 24h/24 et assure un service de voiturier de 8h00 à 21h00. Vous pourrez profiter de sa salle de sport.\nUn petit-déjeuner buffet continental vous sera servi tous les matins. Sur place, le restaurant Cléo est ouvert pour le déjeuner et le dîner.\nLa tour Eiffel vous attend à 15 minutes à pied de l\'établissement Le Narcisse Blanc, tandis que le jardin des Tuileries se trouve à 19 minutes de marche. L\'aéroport de Paris-Orly est situé à 16 km.\nC\'est le quartier préféré des voyageurs visitant Paris, selon les commentaires clients indépendants.', 'projetWD/assets/img/hotels/narcisse.jpg', 0, 10),
(4, 2, 4, 4, 'Port Palace', '100.00', 'Donnant sur le port Hercule, le boutique hôtel 4 étoiles Port Palace vous accueille à Monaco, au cour du légendaire circuit du Grand Prix de Monaco et du Monaco Yacht Show. Il possède un spa avec un hammam.\nLes chambres sont dotées de la climatisation, d\'un minibar, d\'une télévision par satellite et d\'un dressing privé. Leur salle de bains privative est pourvue de peignoirs et de chaussons.\nDe nombreuses boutiques de luxe de Monaco sont installées à proximité. Le célèbre casino de Monte-Carlo se trouve à seulement 6 minutes à pied.\nLa gare de Monaco est accessible en 5 minutes de marche. Un parking privé est disponible sur place. Une connexion Wi-Fi est en outre accessible dans tout l\'hôtel.', 'projetWD/assets/img/hotels/palace.jpg', 0, 4),
(5, 3, 5, 4, 'Bentley Hotel', '90.00', 'Surplombant la rivière East et le pont historique de la 59ème rue, le Bentley Hotel vous accueille à Manhattan, à 483 mètres de l\'université Rockefeller. Il possède une salle de sport, un restaurant sur le toit et une télévision par câble à écran plat.\nLe Bentley Hotel propose des chambres avec un minibar et une station d\'accueil pour iPod. Elles comprennent en outre des films à la carte, un sèche-cheveux, du matériel de repassage et une radio.\nL\'Hotel Bentley assure un service de concierge et met à votre disposition un centre d\'affaires. Le petit-déjeuner est servi à la carte moyennant des frais supplémentaires.\nCentral Park, les magasins de luxe de la Cinquième Avenue et les restaurants célèbres vous attendent à moins de 2 km du Bentley. La station de métro est distante de moins de 1 km.', 'projetWD/assets/img/hotels/bentley.jpg', 0, 5),
(6, 3, 6, 4, 'SAHARA Las Vegas', '120.00', 'Le Sahara Las Vegas propose de vastes piscines extérieures ouvertes en saison, des restaurants gastronomiques ainsi qu\'un spa et centre de bien-être. La connexion Wi-Fi est gratuite. Le centre de conventions de Las Vegas vous attend à 5 minutes de route.\nVous pourrez admirer la vue sur les environs depuis la terrasse du Sahara Las Vegas. L\'établissement dispose d\'un casino, d\'une discothèque, de boutiques et d\'un parking gratuit.\nVous pourrez par ailleurs déguster des repas aux saveurs espagnoles préparés avec des techniques culinaires contemporaines au restaurant Bazaar sur place. Ouvert 24h/24 et 7j/7, le Northside Cafe sert une cuisine de style maison.\nLes fontaines du Bellagio se trouvent à 3,5 km. L\'aéroport international McCarran se trouve à 7 km du Sahara Las Vegas.', 'projetWD/assets/img/hotels/sahara.jpg', 0, 5),
(7, 4, 7, 5, 'Hotel Nacional Rio de Janeiro', '150.00', 'Idéalement situé juste en face de la plage de São Conrado, l\'hôtel Nacional Rio de Janeiro constitue une expérience unique pour ceux qui recherchent le luxe d\'un complexe urbain. Il vous accueille dans l\'enceinte d\'un bâtiment historique conçu par Oscar Niemeyer et entouré de jardins imaginés par Burle Marx.\nL\'établissement propose une piscine extérieure, un spa et une salle de sport. Vous aurez la possibilité de profiter de services de plage, tels que des chaises longues et des parasols. Vous pourrez savourer des boissons exclusives ainsi que des tapas sophistiquées au bar Bardot près de la piscine, et déguster une cuisine contemporaine dans l\'un des 2 restaurants, le Sereia et l\'Amaro. Vous bénéficierez gratuitement d\'une connexion Wi-Fi dans l\'ensemble des lieux.\nToutes les chambres sont climatisées et décorées dans des couleurs chaudes. Elles comprennent du linge de lit Trussardi, une télévision à écran LED, un minibar, un coffre-fort numérique et une station d\'accueil. Leur salle de bains privative est pourvue d\'articles de toilette gratuits, de peignoirs ainsi que d\'un sèche-cheveux.\nLa station de métro de São Conrado vous attend à seulement 750 mètres. Vous séjournerez à moins de 6,5 km de la montagne Pedra da Gávea et du jardin botanique. La plage de Copacabana se trouve à 11 km de l\'hôtel Nacional Rio de Janeiro. L\'aéroport le plus proche est celui de Santos Dumont, à 13 km, tandis que l\'aéroport international Tom Jobim est implanté à 25 km.', 'projetWD/assets/img/hotels/nacional.jpg', 0, 5),
(8, 4, 8, 5, 'Cullinan Hplus Premium', '125.00', 'Situé à 4 km de la magnifique cathédrale de Brasília et du Congrès national, l\'établissement Cullinan Hplus Premium propose des chambres climatisées avec connexion Wi-Fi gratuite, un restaurant, un petit-déjeuner buffet, une réception ouverte 24h/24 et un centre de conventions moderne.\nLes hébergements comprennent une télévision, un minibar et une salle de bains privative pourvue d\'une douche. Un service d\'étage ainsi qu\'un parking couvert gratuit sont mis à votre disposition.\nLe Cullinan Premium se trouve à seulement 1 km de la gare routière de Brasília et à 2 km du centre de conventions Ulisses Guimarães. L\'aéroport international Juscelino Kubitschek de la ville est accessible à 15 km.\nC\'est le quartier préféré des voyageurs visitant Brasilia, selon les commentaires clients indépendants.', 'projetWD/assets/img/hotels/cullinan.jpg', 0, 10);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `hotelv`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `hotelv` (
`ID_Hotel` int(11)
,`Nom` varchar(50)
,`pays` varchar(50)
,`region` varchar(50)
,`Etoiles` int(11)
,`tarif` decimal(7,2)
,`description` varchar(3000)
,`photo` varchar(200)
,`valeur` int(11)
,`hebergement` int(11)
);

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
-- Doublure de structure pour la vue `regionv`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `regionv` (
`ID_Region` int(11)
,`Nom` varchar(50)
,`pays` varchar(50)
);

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
  `Cout` decimal(7,2) DEFAULT NULL,
  `DateRes` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`ID_Reservation`, `ID_Hotel`, `ID_Visiteur`, `Date_A`, `Date_D`, `Nbr_Personne`, `Lit`, `Cout`, `DateRes`) VALUES
(1, 4, 1, '2021-08-08 00:00:00', '2021-08-07 00:00:00', 4, 1, '100.00', NULL),
(2, 4, 1, '2021-08-08 00:00:00', '2021-08-08 00:00:00', 4, 2, '100.00', NULL),
(3, 4, 1, '2021-07-02 00:00:00', '2021-07-02 00:00:00', 2, 1, '100.00', NULL),
(4, 4, 1, '2021-08-01 00:00:00', '2021-08-07 00:00:00', 4, 2, '100.00', '2021-07-30 00:00:00'),
(5, 2, 1, '2021-08-08 00:00:00', '2021-08-06 00:00:00', 3, 1, '60.00', '2021-07-30 00:00:00'),
(6, 2, 1, '2021-08-08 00:00:00', '2021-08-06 00:00:00', 3, 1, '60.00', '2021-07-30 00:00:00'),
(7, 7, 1, '2021-08-07 00:00:00', '2021-08-08 00:00:00', 4, 1, '150.00', '2021-07-30 00:00:00'),
(8, 7, 1, '2021-08-07 00:00:00', '2021-08-08 00:00:00', 4, 1, '150.00', '2021-07-30 00:00:00'),
(9, 3, 1, '2021-07-31 00:00:00', '2021-08-08 00:00:00', 4, 1, '100.00', '2021-07-30 00:00:00');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `reservationv`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `reservationv` (
`ID_reservation` int(11)
,`hotel` varchar(50)
,`ID_Visiteur` int(11)
,`visiteur` varchar(50)
,`Date_A` datetime
,`Date_D` datetime
,`Nbr_Personne` int(11)
,`Lit` int(11)
,`Cout` decimal(7,2)
,`DateRes` datetime
);

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
(1, 'Rakoto', 'Bema', 'bema@gmail.com', '0340924600', '0000', '5000.00');

-- --------------------------------------------------------

--
-- Structure de la vue `hotelv`
--
DROP TABLE IF EXISTS `hotelv`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hotelv`  AS SELECT `hotel`.`ID_Hotel` AS `ID_Hotel`, `hotel`.`Nom` AS `Nom`, `pays`.`Nom` AS `pays`, `region`.`Nom` AS `region`, `categorie`.`Etoiles` AS `Etoiles`, `hotel`.`tarif` AS `tarif`, `hotel`.`description` AS `description`, `hotel`.`photo` AS `photo`, `hotel`.`valeur` AS `valeur`, `hotel`.`hebergement` AS `hebergement` FROM (((`hotel` join `categorie` on(`hotel`.`ID_Categorie` = `categorie`.`ID_Categorie`)) join `pays` on(`pays`.`ID_Pays` = `hotel`.`ID_Pays`)) join `region` on(`region`.`ID_Region` = `hotel`.`ID_Region`)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `regionv`
--
DROP TABLE IF EXISTS `regionv`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `regionv`  AS SELECT `region`.`ID_Region` AS `ID_Region`, `region`.`Nom` AS `Nom`, `pays`.`Nom` AS `pays` FROM (`region` join `pays` on(`region`.`ID_Pays` = `pays`.`ID_Pays`)) ;

-- --------------------------------------------------------

--
-- Structure de la vue `reservationv`
--
DROP TABLE IF EXISTS `reservationv`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservationv`  AS SELECT `reservation`.`ID_Reservation` AS `ID_reservation`, `hotel`.`Nom` AS `hotel`, `visiteur`.`ID_Visiteur` AS `ID_Visiteur`, `visiteur`.`Nom` AS `visiteur`, `reservation`.`Date_A` AS `Date_A`, `reservation`.`Date_D` AS `Date_D`, `reservation`.`Nbr_Personne` AS `Nbr_Personne`, `reservation`.`Lit` AS `Lit`, `reservation`.`Cout` AS `Cout`, `reservation`.`DateRes` AS `DateRes` FROM ((`reservation` join `hotel` on(`hotel`.`ID_Hotel` = `reservation`.`ID_Hotel`)) join `visiteur` on(`visiteur`.`ID_Visiteur` = `reservation`.`ID_Visiteur`)) ;

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
  ADD KEY `ID_Pays` (`ID_Pays`),
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
  MODIFY `ID_Hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `ID_Reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`ID_Pays`) REFERENCES `pays` (`ID_Pays`) ON DELETE CASCADE,
  ADD CONSTRAINT `hotel_ibfk_2` FOREIGN KEY (`ID_Region`) REFERENCES `region` (`ID_Region`) ON DELETE CASCADE,
  ADD CONSTRAINT `hotel_ibfk_3` FOREIGN KEY (`ID_Categorie`) REFERENCES `categorie` (`ID_Categorie`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`ID_Hotel`) REFERENCES `hotel` (`ID_Hotel`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`ID_Visiteur`) REFERENCES `visiteur` (`ID_Visiteur`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
