-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici_2.c
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici_2.c
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici_2.c` ;
USE `Exercici_2.c` ;

-- -----------------------------------------------------
-- Table `Exercici_2.c`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.c`.`Alumne` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.c`.`Matrícula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.c`.`Matrícula` (
  `ID` INT NOT NULL,
  `Nºmatricula` VARCHAR(45) NOT NULL,
  `Alumne_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Matrícula_Alumne_idx` (`Alumne_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Matrícula_Alumne`
    FOREIGN KEY (`Alumne_ID`)
    REFERENCES `Exercici_2.c`.`Alumne` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.c`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.c`.`Professor` (
  `DNI` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Titulació` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `EsCapDepartament` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.c`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.c`.`Departament` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `NºPlanta` VARCHAR(45) NOT NULL,
  `Aula` VARCHAR(45) NOT NULL,
  `Professor_DNI` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Departament_Professor1_idx` (`Professor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Departament_Professor1`
    FOREIGN KEY (`Professor_DNI`)
    REFERENCES `Exercici_2.c`.`Professor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.c`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.c`.`Assignatura` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Crèdit` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `Professor` VARCHAR(45) NOT NULL,
  `Aula` VARCHAR(45) NOT NULL,
  `Horari` VARCHAR(45) NOT NULL,
  `Departament_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Assignatura_Departament1_idx` (`Departament_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Assignatura_Departament1`
    FOREIGN KEY (`Departament_ID`)
    REFERENCES `Exercici_2.c`.`Departament` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici_2.c`.`Matrícula assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici_2.c`.`Matrícula assignatura` (
  `ID` INT NOT NULL,
  `Data` VARCHAR(45) NOT NULL,
  `Assignatura` VARCHAR(45) NOT NULL,
  `Alumne` VARCHAR(45) NOT NULL,
  `Matrícula_ID` INT NOT NULL,
  `Assignatura_ID` INT NOT NULL,
  `Professor_DNI` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Matrícula assignatura_Matrícula1_idx` (`Matrícula_ID` ASC) VISIBLE,
  INDEX `fk_Matrícula assignatura_Assignatura1_idx` (`Assignatura_ID` ASC) VISIBLE,
  INDEX `fk_Matrícula assignatura_Professor1_idx` (`Professor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Matrícula assignatura_Matrícula1`
    FOREIGN KEY (`Matrícula_ID`)
    REFERENCES `Exercici_2.c`.`Matrícula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matrícula assignatura_Assignatura1`
    FOREIGN KEY (`Assignatura_ID`)
    REFERENCES `Exercici_2.c`.`Assignatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matrícula assignatura_Professor1`
    FOREIGN KEY (`Professor_DNI`)
    REFERENCES `Exercici_2.c`.`Professor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
