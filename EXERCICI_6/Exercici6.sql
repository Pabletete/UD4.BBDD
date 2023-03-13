-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici6` ;
USE `Exercici6` ;

-- -----------------------------------------------------
-- Table `Exercici6`.`Avió`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Avió` (
  `ID` INT NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Capacitat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Passatgers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Passatgers` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telèfon` VARCHAR(45) NOT NULL,
  `Direcció` VARCHAR(45) NOT NULL,
  `Avió_ID` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_Passatgers_Avió_idx` (`Avió_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Passatgers_Avió`
    FOREIGN KEY (`Avió_ID`)
    REFERENCES `Exercici6`.`Avió` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Vol` (
  `ID` INT NOT NULL,
  `Nº_Vol` VARCHAR(45) NOT NULL,
  `Origen` VARCHAR(45) NOT NULL,
  `Destí` VARCHAR(45) NOT NULL,
  `Hora_sortida` VARCHAR(45) NOT NULL,
  `Hora_arribada` VARCHAR(45) NOT NULL,
  `Data_sortida` VARCHAR(45) NOT NULL,
  `Avió_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Vol_Avió1_idx` (`Avió_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avió1`
    FOREIGN KEY (`Avió_ID`)
    REFERENCES `Exercici6`.`Avió` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Reserva` (
  `ID` INT NOT NULL,
  `Passatger` VARCHAR(45) NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Nº_Vol` VARCHAR(45) NOT NULL,
  `Import` VARCHAR(45) NOT NULL,
  `Vol_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Reserva_Vol1_idx` (`Vol_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Vol1`
    FOREIGN KEY (`Vol_ID`)
    REFERENCES `Exercici6`.`Vol` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
