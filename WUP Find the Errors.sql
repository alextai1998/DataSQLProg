SHOW DATABASES;

DROP DATABASE IF EXISTS WUP;
CREATE DATABASE WUP;
USE WUP;

CREATE TABLE ACCOUNT (
  ACCNO INT(5) NOT NULL,
  NAME VARCHAR(20) NOT NULL,
  BA_L INT(8) NOT NULL,
  CREATION_DT DATE NOT NULL,
  PRIMARY KEY ( ACCNO )
);

CREATE TABLE Ord (
  `Type` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Ord_Type INT NOT NULL,
  Ord_Number VARCHAR(45) NOT NULL,
  Ord_Date VARCHAR(45) NOT NULL
 );

SELECT producer_name, months FROM (
  SELECT
    producer_name,
    years*12 AS months FROM producer
)AS T;

SELECT AVG(num) FROM (
  SELECT COUNT(*) as num FROM album
    INNER JOIN artist USING (artist_id)
  GROUP BY artist.artist_id
) AS T;