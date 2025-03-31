--liquibase formatted sql


--changeset jfs:1
--03/31/2025 create trans table
CREATE DATABASE IF NOT EXISTS `tilquin` DEFAULT CHARACTER SET latin1 
COLLATE latin1_swedish_ci;
USE `tilquin`;


CREATE TABLE IF NOT EXISTS `tilquin`.`trans` (
    `trans_id` INT NOT NULL AUTO_INCREMENT,
    `date` DATE,
    `account` VARCHAR(50),
    `num` VARCHAR(25),
    `description` VARCHAR(100),
    `memo` VARCHAR(100),
    `category` VARCHAR(250),
    `tag` VARCHAR(50),
    `notes` VARCHAR(250),
    `clr` VARCHAR(2),
    `amount` DECIMAL(5,2),
    PRIMARY KEY (`trans_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3022
DEFAULT CHARACTER SET = utf8mb3;