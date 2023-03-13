-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici5` ;
USE `Exercici5` ;

-- -----------------------------------------------------
-- Table `Exercici5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Client` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Població` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(45) NOT NULL,
  `Usuari` VARCHAR(45) NOT NULL,
  `Contrasenya` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Cites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Cites` (
  `ID` INT NOT NULL,
  `Usuari` VARCHAR(45) NOT NULL,
  `Vehicle` VARCHAR(45) NOT NULL,
  `Dia` VARCHAR(45) NOT NULL,
  `Hora` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Vehicle` (
  `Matrícula` INT NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Tipus_vehicle` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Client_DNI` INT NOT NULL,
  `Cites_ID` INT NOT NULL,
  PRIMARY KEY (`Matrícula`),
  INDEX `fk_Vehicle_Client_idx` (`Client_DNI` ASC) VISIBLE,
  INDEX `fk_Vehicle_Cites1_idx` (`Cites_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Client`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `Exercici5`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_Cites1`
    FOREIGN KEY (`Cites_ID`)
    REFERENCES `Exercici5`.`Cites` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Tipus_de_vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Tipus_de_vehicle` (
  `Vehicle_Matrícula` INT NOT NULL,
  `Tipus_vehicle` VARCHAR(45) NOT NULL,
  INDEX `fk_Tipus_de_vehicle_Vehicle1_idx` (`Vehicle_Matrícula` ASC) VISIBLE,
  PRIMARY KEY (`Vehicle_Matrícula`),
  CONSTRAINT `fk_Tipus_de_vehicle_Vehicle1`
    FOREIGN KEY (`Vehicle_Matrícula`)
    REFERENCES `Exercici5`.`Vehicle` (`Matrícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
