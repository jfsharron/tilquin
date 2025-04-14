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

--changeset jfs:2
--04/05/2025 modify table trans to add InternalNo field
USE tilquin;
ALTER TABLE trans ADD COLUMN InternalNo INT(6) AFTER trans_id;

--changeset jfs:3
--04/05/2025 modify table trans change InternalNo to VARCHAR
ALTER TABLE trans
MODIFY COLUMN InternalNo VARCHAR(10); 

--changeset jfs:4
--04/14/2025 modify table trans, increase size of coloumn clear
ALTER TABLE trans 
MODIFY COLUMN clr VARCHAR(10);

--changeset jfs:5
--04/14/2025 modify table trans, change column clr from VARCHAR to TEXT to
--increase dataset size
ALTER TABLE trans 
MODIFY COLUMN clr TEXT(10);

--changeset jfs:6
--04/14/2025 modify table trans, change column amount to alter decimal size
ALTER TABLE trans 
MODIFY COLUMN amount DECIMAL(10,2);

--changeset jfs:7
--04/14/2025 modify table trans, change column InternalNo to int
ALTER TABLE trans 
MODIFY COLUMN InternalNo INT;
