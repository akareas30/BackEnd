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
-- Base de données : `cmcsci_appcore`
--

DELIMITER $$
--
-- Fonctions
--
CREATE DEFINER=`cmcsci`@`localhost` FUNCTION `getMtDevis` (`iddevis` INT) RETURNS DECIMAL(11,0) BEGIN
declare v_mtOut DECIMAL;
SELECT SUM(devdet_qte*devdet_prixunit) + dev_moeuvre  INTO v_mtOut
FROM tb_devis LEFT JOIN tb_devis_det ON dev_id=devdet_devid
WHERE dev_id=iddevis AND dev_etat_enreg=1 AND dev_etat_sup=1 AND devdet_etat_enreg=1;
return v_mtOut;
END$$

CREATE DEFINER=`cmcsci`@`localhost` FUNCTION `getMtDevisDetail` (`iddevis` INT) RETURNS INT(11) BEGIN
declare v_mtOut INT;
SELECT SUM(devdet_qte*devdet_prixunit)  INTO v_mtOut
FROM tb_devis LEFT JOIN tb_devis_det ON dev_id=devdet_devid
WHERE dev_id=iddevis AND dev_etat_sup=1;
return v_mtOut;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `tb_activites`
--

CREATE TABLE `tb_activites` (
  `act_id` int(11) NOT NULL,
  `act_code` varchar(50) NOT NULL,
  `act_libelle` varchar(150) NOT NULL,
  `act_descrip` tinytext NOT NULL,
  `act_user_cre` int(11) NOT NULL,
  `act_date_cre` datetime NOT NULL,
  `act_user_mod` int(11) NOT NULL,
  `act_date_mod` datetime NOT NULL,
  `act_etat` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_activites`
--

INSERT INTO `tb_activites` (`act_id`, `act_code`, `act_libelle`, `act_descrip`, `act_user_cre`, `act_date_cre`, `act_user_mod`, `act_date_mod`, `act_etat`) VALUES
(1, '', 'CARRELAGE', '', 1, '2017-11-29 15:50:40', 1, '2017-11-29 16:10:15', 1),
(4, '', 'PLOMBERIE', '', 1, '2017-11-29 16:02:50', 0, '0000-00-00 00:00:00', 1),
(7, '', 'MACONNERIE', '', 1, '2017-11-29 16:03:59', 0, '0000-00-00 00:00:00', 1),
(8, '', 'ELECTRICITE', '', 1, '2017-11-29 16:04:37', 0, '0000-00-00 00:00:00', 1),
(9, '', 'PEINTURE', '', 1, '2017-11-29 16:04:47', 0, '0000-00-00 00:00:00', 1),
(10, '', 'MENUISERIE', '', 1, '2017-11-29 16:05:34', 1, '2017-11-29 16:14:33', 1),
(11, '', 'A', 'Z', 1, '2017-11-29 23:53:38', 1, '2017-11-29 23:54:23', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tb_chantiers`
--

CREATE TABLE `tb_chantiers` (
  `cht_id` int(11) NOT NULL,
  `cht_client` int(11) NOT NULL,
  `cht_chef` varchar(50) NOT NULL,
  `cht_ref` varchar(50) NOT NULL,
  `cht_libelle` varchar(50) NOT NULL,
  `cht_descrip` varchar(100) NOT NULL,
  `cht_localise` varchar(100) NOT NULL,
  `cht_debut` date NOT NULL,
  `cht_fin_prevu` date NOT NULL,
  `cht_fin_eff` date NOT NULL,
  `cht_observ` tinytext NOT NULL,
  `cht_date_cre` datetime NOT NULL,
  `cht_user_cre` int(11) NOT NULL,
  `cht_date_mod` datetime NOT NULL,
  `cht_user_mod` int(11) NOT NULL,
  `cht_etat` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0:supp - 1:en cours - 2:terminé - 3:annulé'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_chantiers`
--

INSERT INTO `tb_chantiers` (`cht_id`, `cht_client`, `cht_chef`, `cht_ref`, `cht_libelle`, `cht_descrip`, `cht_localise`, `cht_debut`, `cht_fin_prevu`, `cht_fin_eff`, `cht_observ`, `cht_date_cre`, `cht_user_cre`, `cht_date_mod`, `cht_user_mod`, `cht_etat`) VALUES
(1, 2, 'HASSAN K', 'HADJI BATHILY', 'HADJI BATHILY', 'TRAVAUX DE PLOMBERIE ET D\'ELECTRICITé', 'ANGRé 8E TRANCHE', '2017-10-01', '2018-12-31', '0000-00-00', '', '2017-12-17 19:39:48', 1, '2018-02-19 13:02:28', 1, 1),
(2, 1, 'SEYDOU K', 'PLOMBERIE BRASSIVOIRE', 'PLOMBERIE BRASSIVOIRE', 'TRAVAUX DE RéNOVATION ET DE PLOMBERIE', 'ANGRé 8E TRANCHE', '2018-01-15', '2018-01-31', '0000-00-00', '', '2018-01-13 12:19:34', 1, '2018-02-14 11:12:12', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tb_chantiers_eqp`
--

CREATE TABLE `tb_chantiers_eqp` (
  `eq_id` int(11) NOT NULL,
  `eq_idcht` int(11) NOT NULL,
  `eq_idact` int(11) NOT NULL,
  `eq_hrnom` varchar(50) NOT NULL,
  `eq_hrcontact` varchar(50) NOT NULL,
  `eq_user_cre` int(11) NOT NULL,
  `eq_date_cre` datetime NOT NULL,
  `eq_user_mod` int(11) NOT NULL,
  `eq_date_mod` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_chantiers_eqp`
--

INSERT INTO `tb_chantiers_eqp` (`eq_id`, `eq_idcht`, `eq_idact`, `eq_hrnom`, `eq_hrcontact`, `eq_user_cre`, `eq_date_cre`, `eq_user_mod`, `eq_date_mod`) VALUES
(1, 1, 4, 'KONAN M', '', 1, '2017-12-19 14:04:32', 0, '0000-00-00 00:00:00'),
(2, 1, 4, 'KONE P', '06045521', 1, '2017-12-19 14:07:19', 1, '2017-12-19 15:10:34'),
(3, 1, 8, 'JOSEPH K Z', '', 1, '2017-12-19 14:08:40', 1, '2017-12-20 15:58:00'),
(4, 2, 4, 'KONAN MARTIN', '', 1, '2018-01-13 12:27:39', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `tb_chantiers_taches`
--

CREATE TABLE `tb_chantiers_taches` (
  `tch_id` int(11) NOT NULL,
  `cht_id` int(11) NOT NULL,
  `tch_devis` int(11) NOT NULL,
  `tch_num` int(11) NOT NULL,
  `tch_libelle` varchar(100) NOT NULL,
  `tch_debut` date NOT NULL,
  `tch_fin_prevu` date NOT NULL,
  `tch_fin_eff` date NOT NULL,
  `tch_nature` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:normal / 1:supplémentaire',
  `tch_taux` tinyint(3) NOT NULL DEFAULT '0',
  `tch_observ` varchar(160) NOT NULL,
  `tch_user_cre` int(11) NOT NULL,
  `tch_date_cre` datetime NOT NULL,
  `tch_user_mod` int(11) NOT NULL,
  `tch_date_mod` datetime NOT NULL,
  `tch_etat` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_chantiers_taches`
--

INSERT INTO `tb_chantiers_taches` (`tch_id`, `cht_id`, `tch_devis`, `tch_num`, `tch_libelle`, `tch_debut`, `tch_fin_prevu`, `tch_fin_eff`, `tch_nature`, `tch_taux`, `tch_observ`, `tch_user_cre`, `tch_date_cre`, `tch_user_mod`, `tch_date_mod`, `tch_etat`) VALUES
(1, 1, 3, 0, 'TACHE 1', '2017-12-02', '2017-12-23', '2017-12-25', 0, 100, '', 1, '2017-12-17 21:26:29', 0, '0000-00-00 00:00:00', 1),
(2, 1, 3, 0, 'TACHE 2', '2017-12-23', '2017-12-26', '2017-12-25', 0, 100, '', 1, '2017-12-18 13:33:39', 0, '0000-00-00 00:00:00', 1),
(3, 1, 3, 0, 'TACHE 3', '2017-12-26', '2017-12-28', '0000-00-00', 0, 4, '', 1, '2017-12-18 13:34:05', 0, '0000-00-00 00:00:00', 1),
(5, 1, 3, 0, 'TACHE 4I', '2017-12-28', '2017-12-29', '0000-00-00', 0, 4, '', 1, '2017-12-18 16:19:54', 0, '0000-00-00 00:00:00', 1),
(6, 1, 3, 0, 'TACHE SUP 1', '2017-12-20', '2017-12-22', '0000-00-00', 1, 0, '', 1, '2017-12-21 14:36:53', 0, '0000-00-00 00:00:00', 1),
(8, 1, 3, 0, 'TACHE SUP 2', '2017-12-21', '2017-12-22', '0000-00-00', 1, 0, '', 1, '2017-12-21 14:37:56', 0, '0000-00-00 00:00:00', 1),
(9, 2, 5, 0, 'POSE DES ROBINETS', '2018-01-15', '2018-01-25', '0000-00-00', 0, 15, '', 1, '2018-01-13 12:26:54', 0, '0000-00-00 00:00:00', 1),
(10, 2, 5, 0, 'POSE DES LAVABOS', '2018-01-26', '2018-01-31', '0000-00-00', 0, 0, '', 1, '2018-01-13 12:27:12', 0, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tb_chantiers_taches_rapp`
--

CREATE TABLE `tb_chantiers_taches_rapp` (
  `rap_id` int(11) NOT NULL,
  `rap_cht` int(11) NOT NULL,
  `rap_tache` int(11) NOT NULL,
  `rap_taux` tinyint(3) NOT NULL,
  `rap_libelle` varchar(350) NOT NULL,
  `rap_date_cre` datetime NOT NULL,
  `rap_user_cre` int(11) NOT NULL,
  `rap_date_mod` datetime NOT NULL,
  `rap_user_mod` int(11) NOT NULL,
  `rap_etat` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_chantiers_taches_rapp`
--

INSERT INTO `tb_chantiers_taches_rapp` (`rap_id`, `rap_cht`, `rap_tache`, `rap_taux`, `rap_libelle`, `rap_date_cre`, `rap_user_cre`, `rap_date_mod`, `rap_user_mod`, `rap_etat`) VALUES
(1, 1, 1, 10, 'Ceci est le rapport du 23/12/2017.\nLes travaux se déroulent comme prévu. \nRAS pour aujourd’hui', '2017-12-23 19:47:10', 1, '0000-00-00 00:00:00', 0, 1),
(2, 1, 1, 10, 'Tout le mat&eacute;riel n\'a pas &eacute;t&eacute; livr&eacute;', '2017-12-23 19:52:11', 1, '0000-00-00 00:00:00', 0, 1),
(3, 1, 1, 10, 'Tout le mat&eacute;riel n\'a pas &eacute;t&eacute; livr&eacute;', '2017-12-23 19:54:19', 1, '0000-00-00 00:00:00', 0, 1),
(4, 1, 1, 20, 'Tout le mat&eacute;riel n\'a pas &eacute;t&eacute; livr&eacute;', '2017-12-23 19:54:25', 1, '0000-00-00 00:00:00', 0, 1),
(5, 1, 1, 21, 'test', '2017-12-25 15:36:41', 1, '0000-00-00 00:00:00', 0, 1),
(6, 1, 1, 22, 'test2', '2017-12-25 15:39:13', 1, '0000-00-00 00:00:00', 0, 1),
(7, 1, 1, 24, 'pp', '2017-12-25 15:50:00', 1, '0000-00-00 00:00:00', 0, 1),
(8, 1, 1, 25, 'aa', '2017-12-25 16:03:43', 1, '0000-00-00 00:00:00', 0, 1),
(9, 1, 1, 26, 'ww', '2017-12-25 16:06:01', 1, '0000-00-00 00:00:00', 0, 1),
(10, 1, 1, 27, 'az15', '2017-12-25 16:06:21', 1, '0000-00-00 00:00:00', 0, 1),
(11, 1, 2, 1, 'ok', '2017-12-25 16:25:18', 1, '0000-00-00 00:00:00', 0, 1),
(12, 1, 2, 2, 'az', '2017-12-25 16:31:53', 1, '0000-00-00 00:00:00', 0, 1),
(13, 1, 2, 3, 'qa', '2017-12-25 16:38:20', 1, '0000-00-00 00:00:00', 0, 1),
(14, 1, 2, 4, 'qap', '2017-12-25 16:40:52', 1, '0000-00-00 00:00:00', 0, 1),
(15, 1, 2, 5, 'wq', '2017-12-25 16:44:40', 1, '0000-00-00 00:00:00', 0, 1),
(16, 1, 2, 6, 'ee', '2017-12-25 16:47:36', 1, '0000-00-00 00:00:00', 0, 1),
(17, 1, 1, 28, 'aq', '2017-12-25 17:02:45', 1, '0000-00-00 00:00:00', 0, 1),
(18, 1, 2, 8, 'ok 2', '2017-12-25 17:05:36', 1, '0000-00-00 00:00:00', 0, 1),
(19, 1, 3, 2, 'ok', '2017-12-25 17:06:32', 1, '0000-00-00 00:00:00', 0, 1),
(20, 1, 1, 29, 'pp', '2017-12-25 17:07:03', 1, '0000-00-00 00:00:00', 0, 1),
(21, 1, 1, 30, 'pp', '2017-12-25 17:10:01', 1, '0000-00-00 00:00:00', 0, 1),
(22, 1, 3, 4, 'pp', '2017-12-25 17:10:16', 1, '0000-00-00 00:00:00', 0, 1),
(23, 1, 1, 31, 'kkk', '2017-12-25 17:10:36', 1, '0000-00-00 00:00:00', 0, 1),
(24, 1, 5, 1, '1', '2017-12-25 17:11:15', 1, '0000-00-00 00:00:00', 0, 1),
(25, 1, 5, 2, 'op', '2017-12-25 17:11:27', 1, '0000-00-00 00:00:00', 0, 1),
(26, 1, 5, 3, '8', '2017-12-25 17:11:43', 1, '0000-00-00 00:00:00', 0, 1),
(27, 1, 5, 4, 'yu', '2017-12-25 17:11:49', 1, '0000-00-00 00:00:00', 0, 1),
(28, 1, 1, 32, 'op', '2017-12-25 17:12:12', 1, '0000-00-00 00:00:00', 0, 1),
(29, 1, 1, 35, 'oppo', '2017-12-25 17:12:21', 1, '0000-00-00 00:00:00', 0, 1),
(30, 1, 1, 100, 'ok', '2017-12-25 17:39:10', 1, '0000-00-00 00:00:00', 0, 1),
(31, 1, 2, 100, 'ok', '2017-12-25 17:57:07', 1, '0000-00-00 00:00:00', 0, 1),
(32, 2, 9, 10, 'test', '2018-01-16 18:08:06', 1, '0000-00-00 00:00:00', 0, 1),
(33, 2, 9, 12, 'test new', '2018-01-16 18:08:43', 1, '0000-00-00 00:00:00', 0, 1),
(34, 2, 9, 14, 'test new 2', '2018-01-16 18:09:10', 1, '0000-00-00 00:00:00', 0, 1),
(35, 2, 9, 15, 'alt', '2018-01-17 19:40:19', 1, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tb_clients`
--

CREATE TABLE `tb_clients` (
  `clt_id` int(11) NOT NULL,
  `clt_type` tinyint(1) NOT NULL COMMENT '0:Particulier / 1:Societe',
  `clt_nom` varchar(100) NOT NULL,
  `clt_abrege` varchar(25) NOT NULL,
  `clt_code` varchar(15) NOT NULL,
  `clt_tel1` varchar(20) NOT NULL,
  `clt_tel2` varchar(20) NOT NULL,
  `clt_mail` varchar(160) NOT NULL,
  `clt_ncc` varchar(20) NOT NULL,
  `clt_localisation` varchar(255) NOT NULL,
  `clt_interloc` varchar(100) NOT NULL,
  `clt_user_cre` int(11) NOT NULL,
  `clt_date_cre` datetime NOT NULL,
  `clt_user_mod` int(11) NOT NULL,
  `clt_date_mod` datetime NOT NULL,
  `clt_etat` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_clients`
--

INSERT INTO `tb_clients` (`clt_id`, `clt_type`, `clt_nom`, `clt_abrege`, `clt_code`, `clt_tel1`, `clt_tel2`, `clt_mail`, `clt_ncc`, `clt_localisation`, `clt_interloc`, `clt_user_cre`, `clt_date_cre`, `clt_user_mod`, `clt_date_mod`, `clt_etat`) VALUES
(1, 1, 'BRASSIVOIRE', 'BRASSIVOIRE', '', '', '', '', '', '', '', 1, '2017-11-29 11:22:28', 1, '2017-12-17 14:23:42', 1),
(2, 1, 'ICE', 'ICE', '', '46 41 15 90', '', 'ice@ice.ci', '1627843 U', '01 BP 2599 BOUAKE 01', 'MORY TOURE', 1, '2017-11-29 11:25:52', 1, '2017-11-29 14:32:39', 1),
(3, 0, 'BRASSIVOIRE no', 'BRASSIVOIRE no', '', '', '', '', '', '', '', 1, '2017-11-29 15:59:16', 1, '2017-12-17 14:23:33', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tb_demandes`
--

CREATE TABLE `tb_demandes` (
  `dmd_id` int(11) NOT NULL,
  `dmd_ref` varchar(25) NOT NULL,
  `dmd_type` tinyint(1) NOT NULL COMMENT '0:location / 1:interne',
  `dmd_chantier` int(11) DEFAULT NULL,
  `dmd_demandeur` varchar(50) NOT NULL,
  `dmd_type_clt` tinyint(1) NOT NULL COMMENT '0:Particulier / 1:Société',
  `dmd_clt` varchar(50) NOT NULL,
  `dmd_motif` varchar(100) NOT NULL,
  `dmd_date_cre` datetime NOT NULL,
  `dmd_user_cre` int(11) NOT NULL,
  `dmd_date_mod` datetime NOT NULL,
  `dmd_user_mod` int(11) NOT NULL,
  `dmd_etat_enreg` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0: supp / 1:enregistré',
  `dmd_etat_approuv` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0: en attente traitmt sortie/ 1:sortie traitée',
  `dmd_etat_approuv_2` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0: en attente traitmt retour/ 1:retour traité'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_demandes`
--

INSERT INTO `tb_demandes` (`dmd_id`, `dmd_ref`, `dmd_type`, `dmd_chantier`, `dmd_demandeur`, `dmd_type_clt`, `dmd_clt`, `dmd_motif`, `dmd_date_cre`, `dmd_user_cre`, `dmd_date_mod`, `dmd_user_mod`, `dmd_etat_enreg`, `dmd_etat_approuv`, `dmd_etat_approuv_2`) VALUES
(1, 'DA/MAT/00001/17/02/2018', 1, 0, 'HASSAN K', 0, '', 'TRAVAUX DE PLOMBERIE', '2018-02-17 18:48:26', 1, '2018-02-19 16:28:06', 1, 1, 1, 1),
(2, 'DA/LOC/00002/19/02/2018', 0, NULL, '', 0, 'SYLLA SEKOU', '', '2018-02-19 10:45:29', 1, '0000-00-00 00:00:00', 0, 1, 1, 1),
(3, 'DA/MAT/00003/19/02/2018', 1, 0, 'DEDE A', 0, '', 'VISITE DE CHANTIER', '2018-02-19 17:55:27', 1, '0000-00-00 00:00:00', 0, 1, 1, 1),
(4, 'DA/MAT/00004/20/02/2018', 1, 2, 'HASSAN K', 0, '', 'VISITE POUR TRAVAUX DE PLOMBERIE', '2018-02-20 11:52:29', 1, '0000-00-00 00:00:00', 0, 1, 1, 0),
(5, 'DA/LOC/00005/20/02/2018', 0, NULL, '', 0, 'SYLLA SEKOU', '', '2018-02-20 12:12:30', 1, '0000-00-00 00:00:00', 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `tb_demandes_det`
--

CREATE TABLE `tb_demandes_det` (
  `dmddet_id` int(11) NOT NULL,
  `dmddet_dmdid` int(11) NOT NULL,
  `dmddet_outils` int(11) NOT NULL,
  `dmddet_nbrejrs` tinyint(4) NOT NULL,
  `dmddet_etat_enreg` tinyint(2) NOT NULL DEFAULT '1',
  `dmddet_date_sortie` datetime DEFAULT NULL,
  `dmddet_date_retour` datetime DEFAULT NULL,
  `dmddet_etat_acc` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:en attente / 1:accodé / 2:refusé',
  `dmddet_etat_traite` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0: attente retour / 1:retourné'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_demandes_det`
--

INSERT INTO `tb_demandes_det` (`dmddet_id`, `dmddet_dmdid`, `dmddet_outils`, `dmddet_nbrejrs`, `dmddet_etat_enreg`, `dmddet_date_sortie`, `dmddet_date_retour`, `dmddet_etat_acc`, `dmddet_etat_traite`) VALUES
(2, 1, 16, 0, 1, '2018-02-19 00:00:00', NULL, 2, 0),
(3, 1, 13, 0, 1, '2018-02-19 00:00:00', '2018-02-19 20:07:27', 1, 1),
(4, 2, 14, 2, 1, '2018-02-19 00:00:00', '2018-02-19 20:07:55', 1, 1),
(5, 2, 15, 1, 1, '2018-02-19 00:00:00', '2018-02-19 20:07:53', 1, 1),
(12, 3, 16, 0, 1, '2018-02-19 00:00:00', '2018-02-19 20:07:36', 1, 1),
(13, 4, 16, 0, 1, '2018-02-20 12:13:14', NULL, 2, 0),
(15, 4, 8, 0, 1, '2018-02-20 12:13:11', NULL, 1, 0),
(17, 4, 13, 0, 1, '2018-02-20 12:13:09', '2021-04-28 22:04:30', 1, 1),
(18, 5, 14, 2, 1, '2018-02-18 12:12:58', NULL, 1, 0);

--
-- Déclencheurs `tb_demandes_det`
--
DELIMITER $$
CREATE TRIGGER `TRG_SET_ETAT_DEMANDE` AFTER UPDATE ON `tb_demandes_det` FOR EACH ROW BEGIN
DECLARE v_nbreDetDmd INT;
DECLARE v_nbreDetDmdTraite INT;
DECLARE v_nbreDetDmdTraite_ret INT;
DECLARE v_iddmd INT;

SET v_nbreDetDmd=0;
SET v_nbreDetDmdTraite=0;
SET v_nbreDetDmdTraite_ret=0;
SET v_iddmd=OLD.dmddet_dmdid;

SELECT COUNT(dmddet_id) INTO v_nbreDetDmd
FROM tb_demandes_det
WHERE dmddet_dmdid=OLD.dmddet_dmdid;

SELECT COUNT(dmddet_id) INTO v_nbreDetDmdTraite
FROM tb_demandes_det
WHERE dmddet_dmdid=OLD.dmddet_dmdid AND dmddet_etat_acc<>0;

SELECT COUNT(dmddet_id) INTO v_nbreDetDmdTraite_ret
FROM tb_demandes_det
WHERE dmddet_dmdid=OLD.dmddet_dmdid AND (dmddet_etat_acc=2 OR dmddet_etat_traite<>0);

IF(v_nbreDetDmd=v_nbreDetDmdTraite)THEN
	UPDATE tb_demandes
	SET dmd_etat_approuv=1
	WHERE dmd_id=v_iddmd;
ELSE 
	UPDATE tb_demandes
	SET dmd_etat_approuv=0
	WHERE dmd_id=v_iddmd;
END IF;


IF(v_nbreDetDmd=v_nbreDetDmdTraite_ret)THEN
	UPDATE tb_demandes
	SET dmd_etat_approuv_2=1
	WHERE dmd_id=v_iddmd;
ELSE 
	UPDATE tb_demandes
	SET dmd_etat_approuv_2=0
	WHERE dmd_id=v_iddmd;
END IF;


END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `tb_devis`
--

CREATE TABLE `tb_devis` (
  `dev_id` int(11) NOT NULL,
  `dev_ref` varchar(25) NOT NULL,
  `dev_clt` int(11) NOT NULL,
  `dev_objet` tinytext NOT NULL,
  `dev_moeuvre` int(11) NOT NULL DEFAULT '0',
  `dev_date_cre` datetime NOT NULL,
  `dev_user_cre` int(11) NOT NULL,
  `dev_date_mod` datetime NOT NULL,
  `dev_user_mod` int(11) NOT NULL,
  `dev_etat_enreg` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0: en attente enreg / 1:enreg',
  `dev_etat_sup` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: supprime / 1:actif',
  `dev_etat_valid` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0: en attente validation / 1:valide',
  `dev_etat_accepte` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:en cours / 1:accepté / 10:Réfusé / 11:Annulé',
  `dev_observ` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_devis`
--

INSERT INTO `tb_devis` (`dev_id`, `dev_ref`, `dev_clt`, `dev_objet`, `dev_moeuvre`, `dev_date_cre`, `dev_user_cre`, `dev_date_mod`, `dev_user_mod`, `dev_etat_enreg`, `dev_etat_sup`, `dev_etat_valid`, `dev_etat_accepte`, `dev_observ`) VALUES
(1, 'DT/00000/04/12/2017', 3, 'TRAVAUX DE PLOMBERIE', 25000, '2017-12-04 20:39:39', 1, '2017-12-15 14:15:46', 1, 1, 1, 0, 11, ''),
(3, 'DT/00002/14/12/2017', 2, 'TRAVAUX DE PLOMBERIE', 0, '2017-12-14 14:17:55', 1, '2017-12-15 14:15:19', 1, 1, 1, 0, 1, ''),
(4, 'DT/00003/14/12/2017', 2, 'ASSAINISSEMENT', 0, '2017-12-14 14:48:05', 1, '2018-02-19 11:37:18', 1, 1, 1, 0, 0, ''),
(5, 'DT/00004/13/01/2018', 1, 'RENOVATION ET PLOMBERIE', 0, '2018-01-13 12:22:31', 1, '2018-01-13 12:25:47', 1, 1, 1, 0, 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `tb_devis_det`
--

CREATE TABLE `tb_devis_det` (
  `devdet_id` int(11) NOT NULL,
  `devdet_devid` int(11) NOT NULL,
  `devdet_rub1` varchar(50) NOT NULL,
  `devdet_rub2` varchar(50) NOT NULL,
  `devdet_materiel` varchar(50) NOT NULL,
  `devdet_qte` decimal(10,2) DEFAULT NULL,
  `devdet_unite` varchar(4) NOT NULL,
  `devdet_prixunit` int(11) NOT NULL,
  `devdet_etat_enreg` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_devis_det`
--

INSERT INTO `tb_devis_det` (`devdet_id`, `devdet_devid`, `devdet_rub1`, `devdet_rub2`, `devdet_materiel`, `devdet_qte`, `devdet_unite`, `devdet_prixunit`, `devdet_etat_enreg`) VALUES
(79, 1, 'TRAVAUX R+1', 'MACONNERIE', 'CIMENT', 4.00, 'T', 2100, 1),
(84, 1, 'TRAVAUX R+1', 'MACONNERIE', 'SABLE', 20.00, 'U', 4000, 1),
(85, 1, 'TRAVAUX RDC', 'MACONNERIE', 'BOTTE 21', 1.00, 'U', 1000, 1),
(87, 1, 'TRAVAUX RDC', 'MENUISERIE', 'SCIE', 1.00, 'U', 2300, 1),
(88, 1, 'TRAVAUX R+2', 'MENUISERIE', 'PLANCHE', 3.50, 'M', 1500, 1),
(89, 1, 'TRAVAUX R+2', 'MENUISERIE', 'VERNIS', 1.50, 'L', 950, 1),
(90, 1, 'TRAVAUX RDC', 'MACONNERIE', 'CIMENT', 15.00, 'T', 2100, 1),
(92, 3, '', '', 'RÉEZ DE JARDIN', 1.00, 'F', 3668000, 1),
(93, 3, '', '', 'RÉEZ DE CHAUSSÉE', 1.00, 'F', 3021386, 1),
(94, 3, '', '', 'ÉTAGE 1', 1.00, 'F', 3726307, 1),
(95, 3, '', '', 'ÉTAGE 2', 1.00, 'F', 3726307, 1),
(96, 3, '', '', 'ÉTAGE 3', 1.00, 'F', 1158000, 1),
(97, 3, '', '', 'SOUS SOL', 1.00, 'F', 2100000, 1),
(98, 3, '', '', 'TOITURE', 1.00, 'F', 600000, 1),
(99, 4, '', '', 'TRAVAUX D\'ASSAINISSEMENT DU SITE', 1.00, 'F', 750000, 1),
(100, 5, '', '', 'F/P ROBINET DE CUISINE', 2.00, 'U', 5600, 1),
(101, 5, '', '', 'F/P LAVABO', 3.00, 'U', 9700, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tb_outils_ref`
--

CREATE TABLE `tb_outils_ref` (
  `outilref_id` int(11) NOT NULL,
  `outilref_libelle` varchar(255) NOT NULL,
  `outilref_prixloc_part` int(11) NOT NULL,
  `outilref_prixloc_soc` int(11) NOT NULL,
  `outilref_ref` varchar(25) NOT NULL,
  `outilref_serial` varchar(50) NOT NULL,
  `outilref_marque` varchar(50) NOT NULL,
  `outilref_descrip` tinytext NOT NULL,
  `outilref_detail` tinytext NOT NULL,
  `outilref_date_acquis` date NOT NULL,
  `outilref_user_cre` int(11) NOT NULL,
  `outilref_date_cre` datetime NOT NULL,
  `outilref_user_mod` int(11) NOT NULL,
  `outilref_date_mod` datetime NOT NULL,
  `outilref_etatenreg` tinyint(2) NOT NULL DEFAULT '1',
  `outilref_etat_mvt` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0:sorti / 1:en stock'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_outils_ref`
--

INSERT INTO `tb_outils_ref` (`outilref_id`, `outilref_libelle`, `outilref_prixloc_part`, `outilref_prixloc_soc`, `outilref_ref`, `outilref_serial`, `outilref_marque`, `outilref_descrip`, `outilref_detail`, `outilref_date_acquis`, `outilref_user_cre`, `outilref_date_cre`, `outilref_user_mod`, `outilref_date_mod`, `outilref_etatenreg`, `outilref_etat_mvt`) VALUES
(8, 'PELLE', 0, 0, 'OM15  007MAC', '', 'M.B 27', 'PELLE RONDE', 'PELLE RONDE 27CM M.B 27', '0000-00-00', 1, '2018-02-17 17:18:08', 0, '0000-00-00 00:00:00', 1, 0),
(10, 'PELLE', 0, 0, 'OM15  006MAC', '', 'M.B 27', 'PELLE RONDE', 'PELLE RONDE 27CM M.B 27', '0000-00-00', 1, '2018-02-17 17:19:02', 0, '0000-00-00 00:00:00', 1, 1),
(11, 'PELLE', 0, 0, 'OM15   007MAC', '', 'M.B 27', 'PELLE RONDE', 'PELLE RONDE 27CM M.B 27', '0000-00-00', 1, '2018-02-17 17:19:13', 0, '0000-00-00 00:00:00', 1, 1),
(12, 'PERCEUSE', 0, 0, 'MP15 002MAC', '', 'HILTI-TE 76P03-00029345', 'PERCEUSE ELECTRIQUE', 'PERCEUSE HILTI POUR TRAVAUX DE MACONNERIE AVEC FORETS / 09 FORETS', '0000-00-00', 1, '2018-02-17 17:20:51', 0, '0000-00-00 00:00:00', 1, 1),
(13, 'PERCEUSE', 0, 0, 'MP15 004MIC', '', 'HILTI - TE 70 06-0144041-MP-12', 'PERCEUSE ELECTRIQUE', 'PERCEUSE HILTI POUR TRAVAUX DE MACONNERIE-BURINAGE AVEC FORETS / 05 FORETS', '0000-00-00', 1, '2018-02-17 17:22:41', 0, '0000-00-00 00:00:00', 1, 1),
(14, 'PERCEUSE', 3500, 5500, 'MPA15 003', '', 'HILTI SFC 14-A 9278183', 'PERCEUSE AUTONOME', 'PERCEUSE HILTI PORTATIF AUTONOME AVEC CHARGEUR                                                    02BATTERIES LI-ION\r\nFORETS 2-3-4-5-6-8MM(HILTI)                                                            01COFFRET DE 06 TOURNEVIS                         ', '0000-00-00', 1, '2018-02-17 17:24:56', 0, '0000-00-00 00:00:00', 1, 0),
(15, 'MEULE', 15000, 15000, 'MP15 003 MEC', '', 'BOSCH GWS 11-125 CI PROFESSIONNAL', 'PETITE MEULE BOSCH', '', '0000-00-00', 1, '2018-02-17 17:26:41', 0, '0000-00-00 00:00:00', 1, 1),
(16, 'MEULE', 0, 0, 'MPA15 002 MEC', '', 'MAKITA', 'PETITE MEULE MAKITA', '', '0000-00-00', 1, '2018-02-17 17:28:07', 0, '0000-00-00 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tb_profil`
--

CREATE TABLE `tb_profil` (
  `prof_id` int(11) NOT NULL,
  `prof_code` varchar(3) NOT NULL,
  `prof_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_profil`
--

INSERT INTO `tb_profil` (`prof_id`, `prof_code`, `prof_name`) VALUES
(1, 'AD', 'ADMINISTRATEUR'),
(2, 'CC', 'CHEF CHANTIER'),
(3, 'CP', 'COMPTABILITE'),
(4, 'DG', 'DIRECTION GENERALE'),
(5, 'DT', 'DIRECTION TECHNIQUE'),
(6, 'GM', 'GESTION MAGASIN');

-- --------------------------------------------------------

--
-- Structure de la table `tb_users`
--

CREATE TABLE `tb_users` (
  `user_id` int(11) NOT NULL,
  `user_profil` varchar(5) DEFAULT NULL,
  `user_matri` varchar(10) DEFAULT NULL,
  `user_nom` varchar(50) DEFAULT NULL,
  `user_prenom` varchar(150) DEFAULT NULL,
  `user_fonct` varchar(50) DEFAULT NULL,
  `user_tel1` varchar(100) DEFAULT NULL,
  `user_tel2` varchar(100) DEFAULT NULL,
  `user_mail` varchar(250) DEFAULT NULL,
  `user_pass` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_pass_modif` int(1) NOT NULL DEFAULT '0',
  `user_pass_datemodif` date DEFAULT NULL,
  `user_photo` varchar(250) DEFAULT NULL,
  `user_date_cre` datetime DEFAULT NULL,
  `user_user_cre` int(11) DEFAULT NULL,
  `user_date_mod` datetime DEFAULT NULL,
  `user_user_mod` int(11) DEFAULT NULL,
  `user_etat` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_users`
--

INSERT INTO `tb_users` (`user_id`, `user_profil`, `user_matri`, `user_nom`, `user_prenom`, `user_fonct`, `user_tel1`, `user_tel2`, `user_mail`, `user_pass`, `user_pass_modif`, `user_pass_datemodif`, `user_photo`, `user_date_cre`, `user_user_cre`, `user_date_mod`, `user_user_mod`, `user_etat`) VALUES
(1, 'AD', '', 'GNAHOUE', 'GLOUDY ANGE LANDRY', 'ADMIN', '', '', 'angegnahoue@hotmail.fr', '999a36ea7e6b7a6292a0a463c5ae7c3c', 0, '2018-02-13', '', '2017-11-21 17:40:28', 1, '2018-02-13 15:01:38', 1, 1),
(2, 'CC', '', 'KONAN', 'YAO', 'DIRECTEUR TECHNIQUE', '', '', 'kyao@yahoo.com', '339fb3df58527159dcacb66312da3a84', 0, '2018-02-13', '', '2017-11-21 17:41:54', 1, '2018-02-13 19:08:17', 1, 0),
(5, 'DT', NULL, 'KATIA', 'EDDY', 'INFORMATICIEN', NULL, NULL, 'eddy.katia@petraimmobilier.ci', 'e8d974a9353c8b8bc02425a81d030e72', 1, '2021-05-05', NULL, '2021-04-28 21:51:32', 1, '2021-05-05 17:02:04', 5, 1),
(6, 'DG', NULL, 'ADONIS', 'LUC', 'DIRECTEUR GENERAL', NULL, NULL, 'adonisluc@yahoo.fr', '2b069e7db4fff4212e71d01fefca75ca', 0, NULL, NULL, '2021-04-28 21:58:15', 1, NULL, NULL, 1),
(7, 'DT', NULL, 'BOLEANE', 'MOHAMED', 'INFORMATICIEN', NULL, NULL, 'boleane@gmail.com', '28bcc4c9acb2ef6939e5fe37535ea428', 0, NULL, NULL, '2021-04-28 21:59:42', 1, NULL, NULL, 1),
(8, 'DG', NULL, 'JEAN', 'MARC', 'DIRECTEUR GENERAL', NULL, NULL, 'jeanmarc@gmail.com', '22043b5a5eba81f363218d375fb8e08a', 0, NULL, NULL, '2021-04-28 22:00:25', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vt_devis_chantier`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vt_devis_chantier` (
`ID_CHANT` int(11)
,`ID_DEV` int(11)
,`REF_DEV` varchar(25)
,`OBJET_DEV` tinytext
,`ETAT_DEV` tinyint(2)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vt_dmd_courantes`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vt_dmd_courantes` (
`DMDDET_ID` int(11)
,`OUTIL_ID` int(11)
,`OUTIL_LIB` varchar(255)
,`OUTIL_REF` varchar(25)
,`OUTIL_DESCRIP` tinytext
,`OUTIL_PRIXLOC_PART` int(11)
,`OUTIL_PRIXLOC_SOC` int(11)
,`NBRE_JRS` tinyint(4)
,`DATE_SORTIE` datetime
,`DMD_REF` varchar(25)
,`DMD_TYPE` tinyint(1)
,`DEMANDEUR` varchar(50)
,`MOTIF` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure de la vue `vt_devis_chantier`
--
DROP TABLE IF EXISTS `vt_devis_chantier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cmcsci`@`localhost` SQL SECURITY DEFINER VIEW `vt_devis_chantier`  AS SELECT `ch`.`cht_id` AS `ID_CHANT`, `d`.`dev_id` AS `ID_DEV`, `d`.`dev_ref` AS `REF_DEV`, `d`.`dev_objet` AS `OBJET_DEV`, `d`.`dev_etat_accepte` AS `ETAT_DEV` FROM (((`tb_devis` `d` left join `tb_devis_det` `dt` on((`d`.`dev_id` = `dt`.`devdet_devid`))) left join `tb_clients` `c` on((`c`.`clt_id` = `d`.`dev_clt`))) left join `tb_chantiers` `ch` on((`ch`.`cht_client` = `c`.`clt_id`))) WHERE (`ch`.`cht_etat` <> 0) GROUP BY `d`.`dev_id`, `d`.`dev_ref` ORDER BY `ch`.`cht_id` ASC ;

-- --------------------------------------------------------

--
-- Structure de la vue `vt_dmd_courantes`
--
DROP TABLE IF EXISTS `vt_dmd_courantes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cmcsci`@`localhost` SQL SECURITY DEFINER VIEW `vt_dmd_courantes`  AS SELECT `tb_demandes_det`.`dmddet_id` AS `DMDDET_ID`, `tb_outils_ref`.`outilref_id` AS `OUTIL_ID`, `tb_outils_ref`.`outilref_libelle` AS `OUTIL_LIB`, `tb_outils_ref`.`outilref_ref` AS `OUTIL_REF`, `tb_outils_ref`.`outilref_descrip` AS `OUTIL_DESCRIP`, `tb_outils_ref`.`outilref_prixloc_part` AS `OUTIL_PRIXLOC_PART`, `tb_outils_ref`.`outilref_prixloc_soc` AS `OUTIL_PRIXLOC_SOC`, `tb_demandes_det`.`dmddet_nbrejrs` AS `NBRE_JRS`, `tb_demandes_det`.`dmddet_date_sortie` AS `DATE_SORTIE`, `tb_demandes`.`dmd_ref` AS `DMD_REF`, `tb_demandes`.`dmd_type` AS `DMD_TYPE`, `tb_demandes`.`dmd_demandeur` AS `DEMANDEUR`, `tb_demandes`.`dmd_motif` AS `MOTIF` FROM ((`tb_demandes` left join `tb_demandes_det` on((`tb_demandes`.`dmd_id` = `tb_demandes_det`.`dmddet_dmdid`))) left join `tb_outils_ref` on((`tb_demandes_det`.`dmddet_outils` = `tb_outils_ref`.`outilref_id`))) WHERE ((`tb_demandes_det`.`dmddet_etat_acc` = 1) AND (`tb_demandes_det`.`dmddet_etat_traite` = 0)) ORDER BY `tb_demandes_det`.`dmddet_id` DESC ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `tb_activites`
--
ALTER TABLE `tb_activites`
  ADD PRIMARY KEY (`act_id`),
  ADD UNIQUE KEY `act_libelle_2` (`act_libelle`),
  ADD KEY `act_etat` (`act_etat`),
  ADD KEY `act_libelle` (`act_libelle`);

--
-- Index pour la table `tb_chantiers`
--
ALTER TABLE `tb_chantiers`
  ADD PRIMARY KEY (`cht_id`),
  ADD UNIQUE KEY `cht_ref` (`cht_ref`),
  ADD KEY `cht_client` (`cht_client`);

--
-- Index pour la table `tb_chantiers_eqp`
--
ALTER TABLE `tb_chantiers_eqp`
  ADD PRIMARY KEY (`eq_id`),
  ADD UNIQUE KEY `unicite_eqpe` (`eq_idcht`,`eq_idact`,`eq_hrnom`) USING BTREE;

--
-- Index pour la table `tb_chantiers_taches`
--
ALTER TABLE `tb_chantiers_taches`
  ADD PRIMARY KEY (`tch_id`),
  ADD KEY `tch_etat` (`tch_etat`),
  ADD KEY `cht_id` (`cht_id`),
  ADD KEY `tch_devis` (`tch_devis`);

--
-- Index pour la table `tb_chantiers_taches_rapp`
--
ALTER TABLE `tb_chantiers_taches_rapp`
  ADD PRIMARY KEY (`rap_id`),
  ADD KEY `cht_id` (`rap_cht`),
  ADD KEY `rap_tache` (`rap_tache`);

--
-- Index pour la table `tb_clients`
--
ALTER TABLE `tb_clients`
  ADD PRIMARY KEY (`clt_id`),
  ADD UNIQUE KEY `unicite_colone` (`clt_type`,`clt_nom`,`clt_abrege`,`clt_tel1`) USING BTREE,
  ADD KEY `tclt_id` (`clt_type`),
  ADD KEY `clt_etat` (`clt_etat`);

--
-- Index pour la table `tb_demandes`
--
ALTER TABLE `tb_demandes`
  ADD PRIMARY KEY (`dmd_id`),
  ADD KEY `mvt_user_initie` (`dmd_ref`) USING BTREE;

--
-- Index pour la table `tb_demandes_det`
--
ALTER TABLE `tb_demandes_det`
  ADD PRIMARY KEY (`dmddet_id`) USING BTREE,
  ADD KEY `mvt_id` (`dmddet_dmdid`) USING BTREE,
  ADD KEY `dmddet_outils` (`dmddet_outils`);

--
-- Index pour la table `tb_devis`
--
ALTER TABLE `tb_devis`
  ADD PRIMARY KEY (`dev_id`),
  ADD KEY `dev_clt` (`dev_clt`);

--
-- Index pour la table `tb_devis_det`
--
ALTER TABLE `tb_devis_det`
  ADD PRIMARY KEY (`devdet_id`),
  ADD KEY `devdet_devid` (`devdet_devid`);

--
-- Index pour la table `tb_outils_ref`
--
ALTER TABLE `tb_outils_ref`
  ADD PRIMARY KEY (`outilref_id`),
  ADD KEY `outilref_etatenreg` (`outilref_etatenreg`,`outilref_etat_mvt`);

--
-- Index pour la table `tb_profil`
--
ALTER TABLE `tb_profil`
  ADD PRIMARY KEY (`prof_id`);

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
-- AUTO_INCREMENT pour la table `tb_activites`
--
ALTER TABLE `tb_activites`
  MODIFY `act_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `tb_chantiers`
--
ALTER TABLE `tb_chantiers`
  MODIFY `cht_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `tb_chantiers_eqp`
--
ALTER TABLE `tb_chantiers_eqp`
  MODIFY `eq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `tb_chantiers_taches`
--
ALTER TABLE `tb_chantiers_taches`
  MODIFY `tch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `tb_chantiers_taches_rapp`
--
ALTER TABLE `tb_chantiers_taches_rapp`
  MODIFY `rap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `tb_clients`
--
ALTER TABLE `tb_clients`
  MODIFY `clt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tb_demandes`
--
ALTER TABLE `tb_demandes`
  MODIFY `dmd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `tb_demandes_det`
--
ALTER TABLE `tb_demandes_det`
  MODIFY `dmddet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `tb_devis`
--
ALTER TABLE `tb_devis`
  MODIFY `dev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `tb_devis_det`
--
ALTER TABLE `tb_devis_det`
  MODIFY `devdet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT pour la table `tb_outils_ref`
--
ALTER TABLE `tb_outils_ref`
  MODIFY `outilref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `tb_profil`
--
ALTER TABLE `tb_profil`
  MODIFY `prof_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tb_devis`
--
ALTER TABLE `tb_devis`
  ADD CONSTRAINT `tb_devis_ibfk_1` FOREIGN KEY (`dev_clt`) REFERENCES `tb_clients` (`clt_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Contraintes pour la table `tb_devis_det`
--
ALTER TABLE `tb_devis_det`
  ADD CONSTRAINT `tb_devis_det_ibfk_1` FOREIGN KEY (`devdet_devid`) REFERENCES `tb_devis` (`dev_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
