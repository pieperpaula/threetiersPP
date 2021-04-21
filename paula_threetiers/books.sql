DROP DATABASE IF EXISTS `book_business`;
CREATE DATABASE IF NOT EXISTS `book_business`; 
USE `book_business`;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

-- --------------------------------------
--  TABLE AUTHORS
-- --------------------------------------

CREATE TABLE `Authors` (
	`AuthorID` 		int NOT NULL AUTO_INCREMENT,
	`Name` 			varchar (30) NOT NULL,
  	PRIMARY KEY (`AuthorID`),	
	INDEX `AuthorID` (`AuthorID` ASC),
	INDEX `Name` (`Name` ASC)
) 

-- --------------------------------------
--  TABLE PUBLISHERS
-- --------------------------------------

CREATE TABLE `Publishers` (
	`PublisherID` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (30) NOT NULL,
    `Location`			varchar (30) NOT NULL,
  	PRIMARY KEY (`PublisherID`),	
	INDEX `PublisherID` (`PublisherID` ASC),
	INDEX `Name` (`Name` ASC)
)

-- --------------------------------------
--  TABLE EDITORS
-- --------------------------------------

CREATE TABLE `Editors` (
	`EditorID` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (30) NOT NULL,
    `Location`			varchar (30) NOT NULL,
  	PRIMARY KEY (`EditorID`),	
	INDEX `EditorID` (`EditorID` ASC),
	INDEX `Name` (`Name` ASC)
)

-- --------------------------------------
--  TABLE GENRES
-- --------------------------------------

CREATE TABLE `Genres` (
	`GenreID` 		int NOT NULL AUTO_INCREMENT,
	`Subgenre` 				varchar (30) NOT NULL,
  	PRIMARY KEY (`GenreID`),	
	INDEX `GenreID` (`GenreID` ASC)
) 


-- --------------------------------------
--  TABLE BOOKS
-- --------------------------------------

DROP DATABASE IF EXISTS `book_business`;
CREATE DATABASE IF NOT EXISTS `book_business`; 
USE `book_business`;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

-- --------------------------------------
--  TABLE AUTHORS
-- --------------------------------------

CREATE TABLE `Authors` (
	`AuthorID` 		int NOT NULL AUTO_INCREMENT,
	`Name` 			varchar (30) NOT NULL,
  	PRIMARY KEY (`AuthorID`),	
	INDEX `AuthorID` (`AuthorID` ASC),
	INDEX `Name` (`Name` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE PUBLISHERS
-- --------------------------------------

CREATE TABLE `Publishers` (
	`PublisherID` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (30) NOT NULL,
  	PRIMARY KEY (`PublisherID`),	
	INDEX `PublisherID` (`PublisherID` ASC),
	INDEX `Name` (`Name` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE EDITORS
-- --------------------------------------

CREATE TABLE `Editors` (
	`EditorID` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (30) NOT NULL,
  	PRIMARY KEY (`EditorID`),	
	INDEX `EditorID` (`EditorID` ASC),
	INDEX `Name` (`Name` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE GENRES
-- --------------------------------------

CREATE TABLE `Genres` (
	`GenreID` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (30) NOT NULL,
  	PRIMARY KEY (`GenreID`),	
	INDEX `GenreID` (`GenreID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------
--  TABLE BOOKS
-- --------------------------------------

CREATE TABLE `Books` (
	`BookID` 		int NOT NULL AUTO_INCREMENT,
	`AuthorID` 		int NOT NULL,	
	`PublisherID` 	int NOT NULL,
	`EditorID` 		int,
	`GenreID` 		int NOT NULL ,	
	`Title` 		varchar(150) NULL ,	
	`AuthRoyalties` float NOT NULL ,
	`PubRoyalties` 	float NOT NULL ,	
	`Year` 			int NOT NULL ,
    `Price`			float NOT NULL,
  	PRIMARY KEY (`BookID`),	
	INDEX `BookID` (`BookID` ASC),
	INDEX `Title` (`Title` ASC),	
	FOREIGN KEY (`AuthorID`) REFERENCES `Authors` (`AuthorID`),
	FOREIGN KEY (`PublisherID`) REFERENCES `Publishers` (`PublisherID`),
    FOREIGN KEY (`EditorID`) REFERENCES `Editors` (`EditorID`),
    FOREIGN KEY (`GenreID`) REFERENCES `Genres` (`GenreID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE CUSTOMERS
-- --------------------------------------

CREATE TABLE `Customers` (
	`CustomerID` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (30) NOT NULL,
    `Location`		varchar (30) NOT NULL,
  	PRIMARY KEY (`CustomerID`),	
	INDEX `CustomerID` (`CustomerID` ASC),
	INDEX `Name` (`Name` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE ORDERS
-- --------------------------------------

CREATE TABLE `ORDERS` (
	`OrderID` 		    int NOT NULL,
	`CustomerID` 		int NOT NULl,
    `BookID`			int NOT NULL,
  	PRIMARY KEY (`OrderID`),	
	INDEX `OrderID` (`OrderID` ASC),
    FOREIGN KEY (`CustomerID`) REFERENCES `Customers`(`CustomerID`),
    FOREIGN KEY (`BookID`) REFERENCES `Books`(`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;