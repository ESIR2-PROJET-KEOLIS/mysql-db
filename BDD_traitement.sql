-- MySQL Script generated by MySQL Workbench
-- Tue Feb 14 10:59:03 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.` Parcours des lignes de bus du Réseau star`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.` Parcours des lignes de bus du Réseau star` (
  `id` VARCHAR(45) NOT NULL,
  `datedebutversion` DATE NULL,
  `datefinversion` DATE NULL,
  `estversionactive` TEXT NULL,
  `code` TEXT NULL,
  `idligne` TEXT NULL,
  `nomcourtligne` TEXT NULL,
  `sens` VARCHAR(45) NULL,
  `senscommercial` TEXT NULL,
  `type` TEXT NULL,
  `libellelong` TEXT NULL,
  `idarretdepart` TEXT NULL,
  `nomarretdepart` TEXT NULL,
  `idarretarrivee` TEXT NULL,
  `nomarretarrivee` TEXT NULL,
  `estaccessiblepmr` TEXT NULL,
  `longueur (passé de m à cm)` VARCHAR(45) NULL,
  `couleurtrace` TEXT NULL,
  `visibilite` TEXT NULL,
  `geo_point_2d (verifier ce que c'est)` TEXT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Parcour_geo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Parcour_geo` (
  ` Parcours des lignes de bus du Réseau star_id` VARCHAR(45) NULL,
  `idParcour_geo` VARCHAR(45) NOT NULL,
  `position` VARCHAR(45) NULL,
  `lon` DOUBLE NULL,
  `lat` DOUBLE NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`agency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agency` (
  `agency_id` VARCHAR(45) NOT NULL,
  `agency_name` TEXT NULL,
  `agency_url` TEXT NULL,
  `agency_timezone` TEXT NULL,
  `agency_phone` TEXT NULL,
  `agency_lang` TEXT NULL,
  `agancy_fare_url` TEXT NULL,
  `agence_email` TEXT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`calendar` (
  `service_id` VARCHAR(45) NOT NULL,
  `monday` BINARY NULL,
  `tuesday` BINARY NULL,
  `wednesday` BINARY NULL,
  `thursday` BINARY NULL,
  `friday` BINARY NULL,
  `saturday` BINARY NULL,
  `sunday` BINARY NULL,
  `start_date` TEXT NULL,
  `end_date` TEXT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`calendar_dates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`calendar_dates` (
  `servicee_id` VARCHAR(45) NOT NULL,
  `date` TEXT NULL,
  `exception_type` TEXT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fare_attributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fare_attributes` (
  `fare_id` VARCHAR(45) NOT NULL,
  `price` DOUBLE NULL,
  `currency_type` TEXT NULL,
  `payment_method` TEXT NULL,
  `transfers` TEXT NULL,
  `agency_id` VARCHAR(45) NULL,
  `transfer_duration` TEXT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`feed_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`feed_info` (
  `feed_publisher_name` VARCHAR(45) NOT NULL,
  `feed_publisher_url` TEXT NULL,
  `feed_lang` TEXT NULL,
  `feed_start_date` TEXT NULL,
  `feed_end_date` TEXT NULL,
  `feed_version` TEXT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`routes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`routes` (
  `route_id` VARCHAR(45) NOT NULL,
  `agency_id` VARCHAR(45) NULL,
  `route_short_name` TEXT NULL,
  `route_long_name` TEXT NULL,
  `route_desc` TEXT NULL,
  `route_type` TEXT NULL,
  `route_url` TEXT NULL,
  `route_color` TEXT NULL,
  `route_text_color` TEXT NULL,
  `route_sort_order` TEXT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shapes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shapes` (
  `shape_id` VARCHAR(45) NOT NULL,
  `shape_pt_lat` DOUBLE NULL,
  `shape_pt_lon` DOUBLE NULL,
  `shape_pt_sequence` VARCHAR(45) NULL,
  `shape_dist_traveled` TEXT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trips`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trips` (
  `route_id` VARCHAR(45) NULL,
  `service_id` VARCHAR(45) NULL,
  `trip_id` VARCHAR(45) NOT NULL,
  `trip_headsign` VARCHAR(255) NULL,
  `trip_short_nale` VARCHAR(45) NULL,
  `direction_id` VARCHAR(45) NULL,
  `block_id` VARCHAR(45) NULL,
  `shape_id` VARCHAR(45) NULL,
  `wheelchair_accessible` VARCHAR(45) NULL,
  `champ_valere` VARCHAR(45) NULL,
  PRIMARY KEY (`trip_id`),
  INDEX `route_id_idx` (`route_id` ASC) ,
  INDEX `shape_id_idx` (`shape_id` ASC) ,
  INDEX `service_id_idx` (`service_id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stops` (
  `stop_id` VARCHAR(45) NOT NULL,
  `stop_code` VARCHAR(45) NULL,
  `stop_name` VARCHAR(45) NULL,
  `stop_desc` VARCHAR(45) NULL,
  `stop_lat` DOUBLE NULL,
  `stop_lon` DOUBLE NULL,
  `zone_id` VARCHAR(45) NULL,
  `stop_url` VARCHAR(45) NULL,
  `location_type` VARCHAR(45) NULL,
  `parent_station` VARCHAR(45) NULL,
  `stop_timezone` VARCHAR(45) NULL,
  `wheelchair_boarding` VARCHAR(45) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stop_times`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stop_times` (
  `trip_id` VARCHAR(45) NULL,
  `arrival_time` TEXT NULL,
  `departure_time` TEXT NULL,
  `stop_id` VARCHAR(45) NULL,
  `stop_sequence` TEXT NULL,
  `stop_headsign` TEXT NULL,
  `pickup_type` TEXT NULL,
  `drop_off_type` TEXT NULL,
  `shape_dist_traveled` TEXT NULL,
  INDEX `trip_id_idx` (`trip_id` ASC) ,
  INDEX `stop_id_idx` (`stop_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pictogram`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pictogram` (
  `idligne` VARCHAR(45) NOT NULL,
  `nomcourtligne` VARCHAR(45) NULL,
  `date` VARCHAR(45) NULL,
  `resolution` VARCHAR(45) NULL,
  `image` VARCHAR(45) NULL,
  `taille` VARCHAR(45) NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;