-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici_2.b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici_2.b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici_2.b` ;
USE `Exercici_2.b` ;
-- -----------------------------------------------------
-- Table `Exercici_2.b`.`Tipu de tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.b`.`Tipu de tarifa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Preu` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.b`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.b`.`Cine` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telèfon` VARCHAR(45) NOT NULL,
  `Nº de Sales` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.b`.`Entrada cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.b`.`Entrada cine` (
  `ID` INT NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Cine_ID` INT NOT NULL,
  `Tipu de tarifa_ID` INT NOT NULL,
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  INDEX `fk_Entrada cine_Cine1_idx` (`Cine_ID` ASC) VISIBLE,
  INDEX `fk_Entrada cine_Tipu de tarifa1_idx` (`Tipu de tarifa_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Entrada cine_Cine1`
    FOREIGN KEY (`Cine_ID`)
    REFERENCES `Exercici_2.b`.`Cine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entrada cine_Tipu de tarifa1`
    FOREIGN KEY (`Tipu de tarifa_ID`)
    REFERENCES `Exercici_2.b`.`Tipu de tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.b`.`Peli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.b`.`Peli` (
  `ID` INT NOT NULL,
  `Titol` VARCHAR(45) NOT NULL,
  `Gènere` VARCHAR(45) NOT NULL,
  `Preu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.b`.`Projecció`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.b`.`Projecció` (
  `Data` INT NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  `Sala` VARCHAR(45) NOT NULL,
  `Peli_ID` INT NOT NULL,
  `Cine_ID` INT NOT NULL,
  PRIMARY KEY (`Data`),
  UNIQUE INDEX `Data_UNIQUE` (`Data` ASC) VISIBLE,
  INDEX `fk_Projecció_Peli1_idx` (`Peli_ID` ASC) VISIBLE,
  INDEX `fk_Projecció_Cine1_idx` (`Cine_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Projecció_Peli1`
    FOREIGN KEY (`Peli_ID`)
    REFERENCES `Exercici_2.b`.`Peli` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projecció_Cine1`
    FOREIGN KEY (`Cine_ID`)
    REFERENCES `Exercici_2.b`.`Cine` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
