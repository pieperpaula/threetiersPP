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

--------------------------------------
-- --------------------------------------
--  POPULATE AUTHORS
-- --------------------------------------

INSERT INTO `Authors` VALUES(1,'F.Scott Fitzgerald');
INSERT INTO `Authors` VALUES(2,'James Joyce');
INSERT INTO `Authors` VALUES(3,'Jane Austen');
INSERT INTO `Authors` VALUES(4,'Charles Dickens');
INSERT INTO `Authors` VALUES(5,'Ernest Hemingway');
INSERT INTO `Authors` VALUES(6,'Virginia Woolf');

-- --------------------------------------
--  POPULATE EDITORS
-- --------------------------------------

INSERT INTO `Editors` VALUES(1,'Maxwell Perkins');
INSERT INTO `Editors` VALUES(2,'Laurence W. Mazzeno ');
INSERT INTO `Editors` VALUES(3,'Peter Tanner');
INSERT INTO `Editors` VALUES(4,'GP Editors');


-- --------------------------------------
--  POPULATE PUBLISHERS
-- --------------------------------------

INSERT INTO `Publishers` VALUES(1,'Charles Scribners Sons');
INSERT INTO `Publishers` VALUES(2,'Grant Richards');
INSERT INTO `Publishers` VALUES(3,'Shakespeare and Company');
INSERT INTO `Publishers` VALUES(4,'T. Egerton, Whitehall');
INSERT INTO `Publishers` VALUES(5,'John Murray');
INSERT INTO `Publishers` VALUES(6,'Champan & Hall');
INSERT INTO `Publishers` VALUES(7,'Hogarth Press');


-- --------------------------------------
--  POPULATE GENRES
-- --------------------------------------

INSERT INTO `Genres` VALUES(1,'Tragedy');
INSERT INTO `Genres` VALUES(2,'Short Story');
INSERT INTO `Genres` VALUES(3,'Modernism');
INSERT INTO `Genres` VALUES(4,'Romance');
INSERT INTO `Genres` VALUES(5,'Novel of Manners');
INSERT INTO `Genres` VALUES(6,'Historical Fiction');
INSERT INTO `Genres` VALUES(7,'Fiction');

-- --------------------------------------
--  POPULATE Books
-- --------------------------------------


INSERT INTO `Books` VALUES(1,1,1,1,1, 'The Great Gatsby',0.5,0.5,1926,8.74);
INSERT INTO `Books` VALUES(2,2,2,NULL,2,'Dubliners',0.5,0.5,1914,3.99);
INSERT INTO `Books` VALUES(3,2,3,NULL,3,'Ulysses',0.5,0.5,1922,6.98);
INSERT INTO `Books` VALUES(4,3,4,2,4,'Pride and Prejudice',0.5,0.5,1813,7.99);
INSERT INTO `Books` VALUES(5,3,5,NULL,5,'Emma',0.5,0.5,1815,8.89);
INSERT INTO `Books` VALUES(6,4,6,NULL,6,'Tale of Two Cities',0.5,0.5, 1859,6.95);
INSERT INTO `Books` VALUES(7,4,6,3,7,'A Christmas Carol',0.5,0.5,1843,8.00);
INSERT INTO `Books` VALUES(8,5,1,1,7,'The Old Man and the Sea',0.5,0.5,1952,11.99);
INSERT INTO `Books` VALUES(9,6,7,4,3,'Mrs.Dalloway',0.5,0.5, 1925, 13.49);
INSERT INTO `Books` VALUES(10,6,7,NULL,3,'To The Lighthouse',0.5,0.5,1927, 13.49);


-- --------------------------------------
--  POPULATE CUSTOMERS
-- --------------------------------------


INSERT INTO `Customers` VALUES(1,'Joe Schmoe','Greenville, SC');
INSERT INTO `Customers` VALUES(2,'Max Lewis', 'Little Rock, AK');
INSERT INTO `Customers` VALUES(3,'Karen Smith', 'Sacramento, CA');
INSERT INTO `Customers` VALUES(4,'Philip Mouth', 'New York, NY');
INSERT INTO `Customers` VALUES(5,'Sarah Thompson', 'Topeka, KS');
INSERT INTO `Customers` VALUES(6,'Lila Carpenter', 'Lansing, MI');
INSERT INTO `Customers` VALUES(7,'Jack Black', 'San Antonio, TX');
INSERT INTO `Customers` VALUES(8,'Carson Newman', 'Phoenix, AZ');
INSERT INTO `Customers` VALUES(9,'Ben Clark', 'Boston, MA');
INSERT INTO `Customers` VALUES(10,'Sophie Taylor', 'Fargo, ND');

-- --------------------------------------
--  POPULATE ORDERS
-- --------------------------------------


INSERT INTO `Orders` VALUES(1,2,3);
INSERT INTO `Orders` VALUES(2,1,4);
INSERT INTO `Orders` VALUES(3,4,1);
INSERT INTO `Orders` VALUES(4,3,10);
INSERT INTO `Orders` VALUES(5,8,9);
INSERT INTO `Orders` VALUES(6,10,1);
INSERT INTO `Orders` VALUES(7,6,2);
INSERT INTO `Orders` VALUES(8,5,6);
INSERT INTO `Orders` VALUES(9,7,5);
INSERT INTO `Orders` VALUES(10,9,7);
INSERT INTO `Orders` VALUES(11,2,8);
INSERT INTO `Orders` VALUES(12,1,10);
INSERT INTO `Orders` VALUES(13,4,6);
INSERT INTO `Orders` VALUES(14,3,10);
INSERT INTO `Orders` VALUES(15,8,9);
INSERT INTO `Orders` VALUES(16,1,8);
INSERT INTO `Orders` VALUES(17,9,8);
INSERT INTO `Orders` VALUES(18,10,10);
INSERT INTO `Orders` VALUES(19,5,5);
INSERT INTO `Orders` VALUES(20,2,7);
