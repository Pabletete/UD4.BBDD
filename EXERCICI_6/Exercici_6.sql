-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici_6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici_6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici_6` ;
USE `Exercici_6` ;

-- -----------------------------------------------------
-- Table `Exercici_6`.`Avió`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_6`.`Avió` (
  `idAvió` INT NOT NULL,
  `Model_Avió` VARCHAR(45) NULL,
  `Capacitat_Passatgers` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  PRIMARY KEY (`idAvió`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_6`.`Passatgers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_6`.`Passatgers` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telèfon` VARCHAR(45) NULL,
  `Direcció` VARCHAR(45) NULL,
  `Avió_idAvió` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `fk_Passatgers_Avió1_idx` (`Avió_idAvió` ASC) VISIBLE,
  CONSTRAINT `fk_Passatgers_Avió1`
    FOREIGN KEY (`Avió_idAvió`)
    REFERENCES `Exercici_6`.`Avió` (`idAvió`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_6`.`Vol` (
  `idVol` INT NOT NULL,
  `Num_vol` VARCHAR(45) NULL,
  `Origen` VARCHAR(45) NULL,
  `Destí` VARCHAR(45) NULL,
  `Avió_idAvió` INT NOT NULL,
  `Hora_Sortida` VARCHAR(45) NULL,
  `Hora_Arribada` VARCHAR(45) NULL,
  `Data_Vol` VARCHAR(45) NULL,
  PRIMARY KEY (`idVol`),
  INDEX `fk_Vol_Avió1_idx` (`Avió_idAvió` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avió1`
    FOREIGN KEY (`Avió_idAvió`)
    REFERENCES `Exercici_6`.`Avió` (`idAvió`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_6`.`Reserva` (
  `idReserva` INT NOT NULL,
  `Vol_idVol` INT NOT NULL,
  `Dia_Reserva` VARCHAR(45) NULL,
  `Num_vol` VARCHAR(45) NULL,
  `Import_Total` VARCHAR(45) NULL,
  `Destí` VARCHAR(45) NULL,
  `Origen` VARCHAR(45) NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_Reserva_Vol_idx` (`Vol_idVol` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Vol`
    FOREIGN KEY (`Vol_idVol`)
    REFERENCES `Exercici_6`.`Vol` (`idVol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = armscii8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
