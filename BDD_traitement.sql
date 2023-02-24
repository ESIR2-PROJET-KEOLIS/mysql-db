-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db:3306
-- Généré le : ven. 24 fév. 2023 à 13:15
-- Version du serveur : 8.0.32
-- Version de PHP : 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `agency`
--

CREATE TABLE `agency` (
  `agency_id` varchar(45) NOT NULL,
  `agency_name` text,
  `agency_url` text,
  `agency_timezone` text,
  `agency_phone` text,
  `agency_lang` text,
  `agancy_fare_url` text,
  `agence_email` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `calendar`
--

CREATE TABLE `calendar` (
  `service_id` varchar(45) NOT NULL,
  `monday` binary(1) DEFAULT NULL,
  `tuesday` binary(1) DEFAULT NULL,
  `wednesday` binary(1) DEFAULT NULL,
  `thursday` binary(1) DEFAULT NULL,
  `friday` binary(1) DEFAULT NULL,
  `saturday` binary(1) DEFAULT NULL,
  `sunday` binary(1) DEFAULT NULL,
  `start_date` text,
  `end_date` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `calendar_dates`
--

CREATE TABLE `calendar_dates` (
  `servicee_id` varchar(45) NOT NULL,
  `date` text,
  `exception_type` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fare_attributes`
--

CREATE TABLE `fare_attributes` (
  `fare_id` varchar(45) NOT NULL,
  `price` double DEFAULT NULL,
  `currency_type` text,
  `payment_method` text,
  `transfers` text,
  `agency_id` varchar(45) DEFAULT NULL,
  `transfer_duration` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `feed_info`
--

CREATE TABLE `feed_info` (
  `feed_publisher_name` varchar(45) NOT NULL,
  `feed_publisher_url` text,
  `feed_lang` text,
  `feed_start_date` text,
  `feed_end_date` text,
  `feed_version` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `parcours_geo`
--

CREATE TABLE `parcours_geo` (
  `parcours_lignes_bus_star_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idParcour_geo` varchar(45) NOT NULL,
  `tab_coordonnes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `parcours_lignes_bus_star`
--

CREATE TABLE `parcours_lignes_bus_star` (
  `parcours_lignes_bus_star_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `datedebutversion` text,
  `datefinversion` text,
  `estversionactive` text,
  `code` text,
  `idligne` text,
  `nomcourtligne` text,
  `sens` varchar(45) DEFAULT NULL,
  `senscommercial` text,
  `type` text,
  `libellelong` text,
  `idarretdepart` text,
  `nomarretdepart` text,
  `idarretarrivee` text,
  `nomarretarrivee` text,
  `estaccessiblepmr` text,
  `longueur (passÃ© de m Ã  cm)` varchar(45) DEFAULT NULL,
  `couleurtrace` text,
  `visibilite` text,
  `geo_point_2d (verifier ce que c'est)` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pictogram`
--

CREATE TABLE `pictogram` (
  `idligne` varchar(45) NOT NULL,
  `nomcourtligne` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `resolution` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `taille` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `routes`
--

CREATE TABLE `routes` (
  `route_id` varchar(45) NOT NULL,
  `agency_id` varchar(45) DEFAULT NULL,
  `route_short_name` text,
  `route_long_name` text,
  `route_desc` text,
  `route_type` text,
  `route_url` text,
  `route_color` text,
  `route_text_color` text,
  `route_sort_order` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `shapes`
--

CREATE TABLE `shapes` (
  `shape_id` varchar(45) NOT NULL,
  `shape_pt_lat` double DEFAULT NULL,
  `shape_pt_lon` double DEFAULT NULL,
  `shape_pt_sequence` varchar(45) DEFAULT NULL,
  `shape_dist_traveled` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stops`
--

CREATE TABLE `stops` (
  `stop_id` varchar(45) NOT NULL,
  `stop_code` varchar(45) DEFAULT NULL,
  `stop_name` varchar(45) DEFAULT NULL,
  `stop_desc` varchar(45) DEFAULT NULL,
  `stop_lat` double DEFAULT NULL,
  `stop_lon` double DEFAULT NULL,
  `zone_id` varchar(45) DEFAULT NULL,
  `stop_url` varchar(45) DEFAULT NULL,
  `location_type` varchar(45) DEFAULT NULL,
  `parent_station` varchar(45) DEFAULT NULL,
  `stop_timezone` varchar(45) DEFAULT NULL,
  `wheelchair_boarding` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stop_times`
--

CREATE TABLE `stop_times` (
  `trip_id` varchar(45) DEFAULT NULL,
  `arrival_time` text,
  `departure_time` text,
  `stop_id` varchar(45) DEFAULT NULL,
  `stop_sequence` text,
  `stop_headsign` text,
  `pickup_type` text,
  `drop_off_type` text,
  `shape_dist_traveled` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trips`
--

CREATE TABLE `trips` (
  `route_id` varchar(45) DEFAULT NULL,
  `service_id` varchar(45) DEFAULT NULL,
  `trip_id` varchar(45) NOT NULL,
  `trip_headsign` varchar(255) DEFAULT NULL,
  `trip_short_nale` varchar(45) DEFAULT NULL,
  `direction_id` varchar(45) DEFAULT NULL,
  `block_id` varchar(45) DEFAULT NULL,
  `shape_id` varchar(45) DEFAULT NULL,
  `wheelchair_accessible` varchar(45) DEFAULT NULL,
  `champ_valere` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `stop_times`
--
ALTER TABLE `stop_times`
  ADD KEY `trip_id_idx` (`trip_id`),
  ADD KEY `stop_id_idx` (`stop_id`);

--
-- Index pour la table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `route_id_idx` (`route_id`),
  ADD KEY `shape_id_idx` (`shape_id`),
  ADD KEY `service_id_idx` (`service_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
