-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici_2.a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici_2.a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici_2.a` ;
USE `Exercici_2.a` ;

-- -----------------------------------------------------
-- Table `Exercici_2.a`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.a`.`Pacient` (
  `NumeroSeguretaSocial` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `DNI/NIE/Passaport` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telèfon` VARCHAR(45) NOT NULL,
  `Mail` VARCHAR(45) NOT NULL,
  `Correu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumeroSeguretaSocial`),
  UNIQUE INDEX `NumeroSeguretaSocial_UNIQUE` (`NumeroSeguretaSocial` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.a`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.a`.`Metge` (
  `NumeroCol·legiat` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `DNI/NIE/Passaport` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telèfon` VARCHAR(45) NOT NULL,
  `Mòvil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NumeroCol·legiat`),
  UNIQUE INDEX `NumeroCol·legiat_UNIQUE` (`NumeroCol·legiat` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.a`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.a`.`Consulta` (
  `Pacient_NumeroSeguretaSocial` INT NOT NULL,
  `Metge_NumeroCol·legiat` INT NOT NULL,
  `Data` INT NOT NULL AUTO_INCREMENT,
  `Llit` VARCHAR(45) NOT NULL,
  `Planta` VARCHAR(45) NOT NULL,
  `Oficina` VARCHAR(45) NOT NULL,
  `Edifici` VARCHAR(45) NOT NULL,
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_NumeroSeguretaSocial` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_NumeroCol·legiat` ASC) VISIBLE,
  PRIMARY KEY (`Data`, `Metge_NumeroCol·legiat`, `Pacient_NumeroSeguretaSocial`),
  UNIQUE INDEX `Data_UNIQUE` (`Data` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_NumeroSeguretaSocial`)
    REFERENCES `Exercici_2.a`.`Pacient` (`NumeroSeguretaSocial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_NumeroCol·legiat`)
    REFERENCES `Exercici_2.a`.`Metge` (`NumeroCol·legiat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
