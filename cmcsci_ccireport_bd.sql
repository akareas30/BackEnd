-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 22 jan. 2022 à 08:00
-- Version du serveur :  5.7.37
-- Version de PHP : 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cmcsci_ccireport_bd`
--

-- --------------------------------------------------------

--
-- Structure de la table `montants_formules`
--

CREATE TABLE `montants_formules` (
  `Date CGFCC` varchar(10) DEFAULT NULL,
  `Campagne` varchar(11) DEFAULT NULL,
  `No Formule` varchar(7) DEFAULT NULL,
  `Exportateur` varchar(27) DEFAULT NULL,
  `Type Exportateur` varchar(14) DEFAULT NULL,
  `Categorie` varchar(10) DEFAULT NULL,
  `Mois` int(2) DEFAULT NULL,
  `Produit` varchar(5) DEFAULT NULL,
  `Nature Produit` varchar(5) DEFAULT NULL,
  `Type Produit` varchar(5) DEFAULT NULL,
  `Port Embarquement` varchar(9) DEFAULT NULL,
  `Poids Feves` int(6) DEFAULT NULL,
  `Poids Reel` varchar(5) DEFAULT NULL,
  `Taxe Redevance` varchar(17) DEFAULT NULL,
  `Valeur Taxe` varchar(7) DEFAULT NULL,
  `Montant Preleve` int(8) DEFAULT NULL,
  `Montant Calcule` int(8) DEFAULT NULL,
  `Montant Reel` varchar(8) DEFAULT NULL,
  `Reajustement` varchar(8) DEFAULT NULL,
  `No Cheque` varchar(7) DEFAULT NULL,
  `Date` varchar(10) DEFAULT NULL,
  `Banque` varchar(9) DEFAULT NULL,
  `Statut Formule` varchar(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `montants_formules`
--

INSERT INTO `montants_formules` (`Date CGFCC`, `Campagne`, `No Formule`, `Exportateur`, `Type Exportateur`, `Categorie`, `Mois`, `Produit`, `Nature Produit`, `Type Produit`, `Port Embarquement`, `Poids Feves`, `Poids Reel`, `Taxe Redevance`, `Valeur Taxe`, `Montant Preleve`, `Montant Calcule`, `Montant Reel`, `Reajustement`, `No Cheque`, `Date`, `Banque`, `Statut Formule`) VALUES
('2018-11-06', '2018 - 2019', '22-0803', '\"AWAHUS SERVICE  \"', 'PMEX', '', 11, 'CACAO', 'FÈVES', 'Fèves', 'SAN PEDRO', 25025, '25082', 'CCC Stabilisation', '207,117', 5183103, 64973875, '65121868', '59938765', '0497540', '05/11/2018', 'BGFI BANK', 'Complète'),
('2018-11-06', '2018 - 2019', '22-0803', '\"AWAHUS SERVICE  \"', 'PMEX', '', 11, 'CACAO', 'FÈVES', 'Fèves', 'SAN PEDRO', 25025, '25082', 'CCC Redevance', '1,114', 349469, 349469, '350265', '796', '0497541', '05/11/2018', 'BGFI BANK', 'Complète'),
('2018-11-06', '2018 - 2019', '22-0803', '\"AWAHUS SERVICE  \"', 'PMEX', '', 11, 'CACAO', 'FÈVES', 'Fèves', 'SAN PEDRO', 25025, '25082', 'CCC Inv. Agricole', '0,235', 73721, 73721, '73889', '168', '0497542', '05/11/2018', 'BGFI BANK', 'Complète'),
('2018-11-06', '2018 - 2019', '22-0803', '\"AWAHUS SERVICE  \"', 'PMEX', '', 11, 'CACAO', 'FÈVES', 'Fèves', 'SAN PEDRO', 25025, '25082', 'Fimr', '0,386', 121091, 121091, '121366', '275', '0497543', '05/11/2018', 'BGFI BANK', 'Complète'),
('2018-11-06', '2018 - 2019', '22-0803', '\"AWAHUS SERVICE  \"', 'PMEX', '', 11, 'CACAO', 'FÈVES', 'Fèves', 'SAN PEDRO', 25025, '25082', 'Sacherie', '0,21', 65878, 65878, '66028', '150', '0497544', '05/11/2018', 'BGFI BANK', 'Complète'),
('2018-11-06', '2018 - 2019', '22-0803', '\"AWAHUS SERVICE  \"', 'PMEX', '', 11, 'CACAO', 'FÈVES', 'Fèves', 'SAN PEDRO', 25025, '25082', 'Enregistrement', '1,5', 470559, 470559, '471631', '1072', '0497545', '05/11/2018', 'BGFI BANK', 'Complète'),
('2018-11-06', '2018 - 2019', '22-0803', '\"AWAHUS SERVICE  \"', 'PMEX', '', 11, 'CACAO', 'FÈVES', 'Fèves', 'SAN PEDRO', 25025, '25082', 'Dus', '14,6', 4580110, 4580110, '4590542', '10432', '', '', '', 'Complète'),
('2018-11-06', '2018 - 2019', '22-0871', 'TOUTON NEGOCE COTE D\'IVOIRE', 'MULTINATIONALE', '', 11, 'CACAO', 'FÈVES', 'Fèves', 'SAN PEDRO', 750750, '', 'CCC Redevance', '1,114', 10484059, 10484059, '', '', '9207344', '02/11/2018', 'BNI', ''),
('2018-11-06', '2018 - 2019', '22-0871', 'TOUTON NEGOCE COTE D\'IVOIRE', 'MULTINATIONALE', '', 11, 'CACAO', 'FÈVES', 'Fèves', 'SAN PEDRO', 750750, '', 'CCC Inv. Agricole', '0,235', 2211628, 2211628, '', '', '9207345', '02/11/2018', 'BNI', ''),
('2018-11-06', '2018 - 2019', '22-0871', 'TOUTON NEGOCE COTE D\'IVOIRE', 'MULTINATIONALE', '', 11, 'CACAO', 'FÈVES', 'Fèves', 'SAN PEDRO', 750750, '', 'Fimr', '0,386', 3632717, 3632717, '', '', '9207346', '02/11/2018', 'BNI', '');

-- --------------------------------------------------------

--
-- Structure de la table `poids_formules`
--

CREATE TABLE `poids_formules` (
  `Campagne` varchar(11) DEFAULT NULL,
  `No Formule` varchar(7) DEFAULT NULL,
  `Date CGFCC` varchar(10) DEFAULT NULL,
  `Mois` int(2) DEFAULT NULL,
  `Annee` int(4) DEFAULT NULL,
  `Exportateur` varchar(27) DEFAULT NULL,
  `Type_Exportateur` varchar(15) DEFAULT NULL,
  `Categorie` varchar(10) DEFAULT NULL,
  `Transitaire` varchar(29) DEFAULT NULL,
  `Port Embarquement` varchar(11) DEFAULT NULL,
  `Continent Destination` varchar(15) DEFAULT NULL,
  `Pays Destination` varchar(10) DEFAULT NULL,
  `Port Destination` varchar(10) DEFAULT NULL,
  `Produit` varchar(5) DEFAULT NULL,
  `Nature Produit` varchar(12) DEFAULT NULL,
  `Recolte` varchar(11) DEFAULT NULL,
  `Type_Produit` varchar(12) DEFAULT NULL,
  `Prix CAF` varchar(8) DEFAULT NULL,
  `Tx_Null` int(1) DEFAULT NULL,
  `Numero CDC` varchar(16) DEFAULT NULL,
  `Poids Net` int(7) DEFAULT NULL,
  `Poids Feves` int(7) DEFAULT NULL,
  `Poids_Reel` int(6) DEFAULT NULL,
  `Statut_Formule` varchar(8) DEFAULT NULL,
  `No Certificat` varchar(10) DEFAULT NULL,
  `Transit` varchar(34) DEFAULT NULL,
  `Recu le` varchar(23) DEFAULT NULL,
  `Depot` varchar(3) DEFAULT NULL,
  `Depose le` varchar(23) DEFAULT NULL,
  `Signe` varchar(3) DEFAULT NULL,
  `Signe le` varchar(23) DEFAULT NULL,
  `Retire` varchar(3) DEFAULT NULL,
  `Retire le` varchar(23) DEFAULT NULL,
  `Retirant` varchar(22) DEFAULT NULL,
  `Periode` varchar(15) DEFAULT NULL,
  `Nomenclature` varchar(29) DEFAULT NULL,
  `Sac` int(5) DEFAULT NULL,
  `Date FO1` varchar(10) DEFAULT NULL,
  `Ordre Transit` varchar(16) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `poids_formules`
--

INSERT INTO `poids_formules` (`Campagne`, `No Formule`, `Date CGFCC`, `Mois`, `Annee`, `Exportateur`, `Type_Exportateur`, `Categorie`, `Transitaire`, `Port Embarquement`, `Continent Destination`, `Pays Destination`, `Port Destination`, `Produit`, `Nature Produit`, `Recolte`, `Type_Produit`, `Prix CAF`, `Tx_Null`, `Numero CDC`, `Poids Net`, `Poids Feves`, `Poids_Reel`, `Statut_Formule`, `No Certificat`, `Transit`, `Recu le`, `Depot`, `Depose le`, `Signe`, `Signe le`, `Retire`, `Retire le`, `Retirant`, `Periode`, `Nomenclature`, `Sac`, `Date FO1`, `Ordre Transit`) VALUES
('2018 - 2019', '22-0005', '2018-10-11', 10, 2018, 'SOCAT', 'COOPEX', '', 'ITM TRANSIT', 'San - Pédro', 'EUROPE', 'HOLLANDE', 'AMSTERDAM', 'Cacao', 'FÈVES', '2018 - 2019', 'Fèves', '1253,571', 0, '463-2195 KKO-6', 100100, 100100, 101540, 'Complète', 'KKO-2-0005', 'VRAC CONTENEUR', '2018-10-12 00:00:00.000', 'Oui', '2018-11-16 11:14:26.350', 'Oui', '2018-11-16 00:00:00.000', 'Oui', '2018-11-23 00:00:00.000', 'Kamagate Adama', 'OCT - NOV - DEC', '1801 00 11 00', 1540, '2018-10-11', '2018-2019/006'),
('2018 - 2019', '22-0013', '2018-10-15', 10, 2018, 'OUTSPAN IVOIRE', 'MULTINATIONALE', '', 'BOLLORE TRANSPORT & LOGISTICS', 'San - Pédro', 'EUROPE', 'HOLLANDE', 'AMSTERDAM', 'Cacao', 'FÈVES', '2018 - 2019', 'Fèves', '1253,571', 0, '112-23072 KKO-53', 1001000, 1001000, 998688, 'Complète', 'KKO-2-0013', 'VRAC CALE/SAC CONVENTIONNEL', '2018-10-16 00:00:00.000', 'Oui', '2018-11-13 16:02:20.403', 'Oui', '2018-11-14 00:00:00.000', 'Oui', '2018-11-28 00:00:00.000', 'Kouassi Edouard', 'OCT - NOV - DEC', '1801 00 11 00 / 1801 00 12 00', 15400, '2018-10-15', 'BPV002'),
('2018 - 2019', '22-0014', '2018-10-15', 10, 2018, 'OUTSPAN IVOIRE', 'MULTINATIONALE', '', 'LOGITRANS', 'San - Pédro', 'EUROPE', 'HOLLANDE', 'AMSTERDAM', 'Cacao', 'FÈVES', '2018 - 2019', 'Fèves', '1253,571', 0, '112-23036 KKO-17', 950950, 950950, 949301, 'Complète', 'KKO-2-0014', 'VRAC CALE/SAC CONVENTIONNEL', '2018-10-16 00:00:00.000', 'Oui', '2018-11-13 16:01:12.253', 'Oui', '2018-11-14 00:00:00.000', 'Oui', '2018-11-26 00:00:00.000', 'Kouassi Edouard', 'OCT - NOV - DEC', '1801 00 11 00 / 1801 00 12 00', 14630, '2018-10-15', 'BPV001'),
('2018 - 2019', '22-0016', '2018-10-16', 10, 2018, '\"AWAHUS SERVICE  \"', 'PMEX', '', 'LOGITRANS', 'San - Pédro', 'AMERIQUE DU SUD', 'MEXIQUE', 'VERACRUZ', 'Cacao', 'FÈVES', '2018 - 2019', 'Fèves', '1253,571', 0, '453-2171 KKO-56', 75075, 75075, 75306, 'Complète', 'KKO-2-0016', 'SAC CONTENEUR', '2018-10-17 00:00:00.000', 'Oui', '2018-11-16 11:28:36.530', 'Oui', '2018-11-16 00:00:00.000', 'Oui', '2018-11-22 00:00:00.000', 'P O M. AGBOTON FLORENT', 'OCT - NOV - DEC', '1801 00 12 00', 1155, '2018-10-16', 'AW 0003-18'),
('2018 - 2019', '22-0019', '2018-10-16', 10, 2018, '\"AWAHUS SERVICE  \"', 'PMEX', '', 'LOGITRANS', 'San - Pédro', 'AMERIQUE DU SUD', 'MEXIQUE', 'VERACRUZ', 'Cacao', 'FÈVES', '2018 - 2019', 'Fèves', '1253,571', 0, '\"453-2163 \"', 500500, 500500, 500860, 'Complète', 'KKO-2-0019', 'SAC CONTENEUR', '2018-10-17 00:00:00.000', 'Oui', '2018-11-16 11:19:39.463', 'Oui', '2018-11-16 00:00:00.000', 'Oui', '2018-11-22 00:00:00.000', 'P O M. AGBOTON FLORENT', 'OCT - NOV - DEC', '1801 00 12 00', 7700, '2018-10-16', ''),
('2018 - 2019', '22-0055', '2018-10-17', 10, 2018, 'OLAM COCOA PROCESSING CI SA', 'TRANSFORMATEURS', '', 'GEODIS', 'San - Pédro', 'EUROPE', 'ANGLETERRE', 'FELIXSTOWE', 'Cacao', '\"BEURRE \"', '2018 - 2019', 'Semi - Finis', '1253,571', 0, '346-2963 KKO-333', 82000, 102500, 102500, 'Complète', 'KKO-2-0055', 'PRODUITS TRANSFORMES EN CONTENEURS', '2018-10-18 00:00:00.000', 'Oui', '2018-11-13 15:56:30.080', 'Oui', '2018-11-14 00:00:00.000', 'Oui', '2018-11-26 00:00:00.000', 'Kouassi Edouard', 'OCT - NOV - DEC', '1804 00 20 00', 3280, '2018-10-17', 'BUTTER/155/17-18'),
('2018 - 2019', '22-0056', '2018-10-17', 10, 2018, 'OLAM COCOA PROCESSING CI SA', 'TRANSFORMATEURS', '', 'GEODIS', 'San - Pédro', 'EUROPE', 'ESPAGNE', 'VALENCIA', 'Cacao', '\"TOURTEAUX \"', '2018 - 2019', 'Semi - Finis', '1253,571', 0, '346-2963 KKO-333', 100000, 125000, 125000, 'Complète', 'KKO-2-0056', 'PRODUITS TRANSFORMES EN CONTENEURS', '2018-10-18 00:00:00.000', 'Oui', '2018-11-13 15:55:28.930', 'Oui', '2018-11-14 00:00:00.000', 'Oui', '2018-11-26 00:00:00.000', 'Kouassi Edouard', 'OCT - NOV - DEC', '1802 00 00 00', 4000, '2018-10-17', 'CAKE/142/17-18'),
('2018 - 2019', '22-0066', '2018-10-17', 10, 2018, 'OLAM COCOA PROCESSING CI SA', 'TRANSFORMATEURS', '', 'MANTRA IVOIRE', 'San - Pédro', 'EUROPE', 'ANGLETERRE', 'FELIXSTOWE', 'Cacao', '\"BEURRE \"', '2018 - 2019', 'Semi - Finis', '1253,571', 0, '346-2965 KKO-335', 44000, 55000, 55000, 'Complète', 'KKO-2-0066', 'PRODUITS TRANSFORMES EN CONTENEURS', '2018-10-18 00:00:00.000', 'Oui', '2018-12-10 16:05:39.297', 'Oui', '2018-12-11 00:00:00.000', 'Oui', '2019-02-18 00:00:00.000', 'M. ADI', 'OCT - NOV - DEC', '1804 00 20 00', 40, '2018-10-17', 'BUTTER/004/18-19'),
('2018 - 2019', '22-0070', '2018-10-17', 10, 2018, 'IVORY COCOA PRODUCTS', 'TRANSFORMATEURS', '', 'PACKING SERVICES', 'San - Pédro', 'EUROPE', 'ALLEMAGNE', 'VELTEN', 'Cacao', '\"BEURRE \"', '2018 - 2019', 'Semi - Finis', '1253,571', 0, '327-21041 KKO-12', 110000, 137500, 137500, 'Complète', 'KKO-2-0070', 'PRODUITS TRANSFORMES EN CONTENEURS', '2018-10-18 00:00:00.000', 'Oui', '2018-11-16 10:59:08.387', 'Oui', '2018-11-16 00:00:00.000', 'Non', '', '', 'OCT - NOV - DEC', '1804 00 20 00', 4400, '2018-10-17', '1205/2018-2019'),
('2018 - 2019', '22-0072', '2018-10-17', 10, 2018, 'SACO', 'TRANSFORMATEURS', '', 'PACKING SERVICES', 'San - Pédro', 'EUROPE', 'FRANCE', 'ROUEN', 'Cacao', '\"BEURRE \"', '2018 - 2019', 'Semi - Finis', '1253,571', 0, '044-22662 KKO-40', 59400, 74250, 74250, 'Complète', 'KKO-2-0072', 'PRODUITS TRANSFORMES EN CONTENEURS', '2018-10-18 00:00:00.000', 'Oui', '2018-11-19 10:15:04.433', 'Oui', '2018-11-19 00:00:00.000', 'Non', '', '', 'OCT - NOV - DEC', '1804 00 20 00', 72, '2018-10-17', '1842SPB01/10');

-- --------------------------------------------------------

--
-- Structure de la table `tb_profil`
--

CREATE TABLE `tb_profil` (
  `prof_id` int(11) NOT NULL,
  `prof_code` varchar(3) NOT NULL,
  `prof_name` varchar(25) NOT NULL,
  `prof_active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_profil`
--

INSERT INTO `tb_profil` (`prof_id`, `prof_code`, `prof_name`, `prof_active`) VALUES
(1, 'AD', 'ADMINISTRATEUR', 1),
(2, 'AO', 'AGENT - OPERATEUR', 1),
(3, 'CP', 'COMPTABILITE', 1),
(4, 'CS', 'CHEF DE SERVICE', 1),
(5, 'DT', 'DIRECTION TECHNIQUE', 1),
(6, 'GM', 'GESTION MAGASIN', 0);

-- --------------------------------------------------------

--
-- Structure de la table `tb_users`
--

CREATE TABLE `tb_users` (
  `user_id` int(225) NOT NULL,
  `user_profil` varchar(5) NOT NULL,
  `user_matri` varchar(10) NOT NULL,
  `user_nom` varchar(50) NOT NULL,
  `user_prenom` varchar(150) NOT NULL,
  `user_fonct` varchar(50) NOT NULL,
  `user_signataire` int(1) NOT NULL DEFAULT '0',
  `user_tel1` varchar(100) NOT NULL,
  `user_login` varchar(250) NOT NULL,
  `user_pass` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_pass_modif` int(1) NOT NULL DEFAULT '0',
  `user_pass_datemodif` date NOT NULL,
  `user_photo` varchar(250) NOT NULL,
  `user_date_cre` datetime NOT NULL,
  `user_user_cre` int(11) NOT NULL,
  `user_date_mod` datetime NOT NULL,
  `user_user_mod` int(11) NOT NULL,
  `user_etat` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_users`
--

INSERT INTO `tb_users` (`user_id`, `user_profil`, `user_matri`, `user_nom`, `user_prenom`, `user_fonct`, `user_signataire`, `user_tel1`, `user_login`, `user_pass`, `user_pass_modif`, `user_pass_datemodif`, `user_photo`, `user_date_cre`, `user_user_cre`, `user_date_mod`, `user_user_mod`, `user_etat`) VALUES
(4, 'AD', 'QO25021989', 'GNAHOUE', 'ANGE LANDRY', 'DEVELOPPEUR', 0, '43150343', 'angegnahoue@hotmail.fr', '1d9e93c5d14b5356b4ed55bbbe779feb', 0, '2021-01-25', '', '2021-01-14 10:34:43', 4, '2021-01-25 13:08:26', 4, 1),
(1616408469, 'AD', '', 'ALLA', 'ADONIS LUC THOMAS', 'DIRECTEUR GENERAL', 0, '', 'adonisluc@yahoo.fr', '04536d90d291b10ff3399d61c02ef187', 0, '2021-03-22', '', '2021-03-22 10:21:09', 4, '2021-03-22 10:21:09', 4, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `tb_profil`
--
ALTER TABLE `tb_profil`
  ADD PRIMARY KEY (`prof_id`),
  ADD KEY `prof_active` (`prof_active`);

--
-- Index pour la table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_etat` (`user_etat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `tb_profil`
--
ALTER TABLE `tb_profil`
  MODIFY `prof_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
