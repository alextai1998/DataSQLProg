CREATE DATABASE movie_database;

CREATE TABLE movie_TableA(
  entryNum INT NOT NULL AUTO_INCREMENT,
  id INT NOT NULL,
  title VARCHAR(20) NOT NUll DEFAULT 'Bad Movie',
  PRIMARY KEY (entryNum)
);

CREATE TABLE IF NOT EXISTS movie_TableB like movie_TableA;

DROP TABLE movie_TableA;

CREATE TABLE movie_TableA(
  entryNum INT NOT NULL AUTO_INCREMENT COMMENT 'Comment',
  id INT NOT NULL,
  title VARCHAR(20) NOT NUll DEFAULT 'Bad Movie',
  PRIMARY KEY (entryNum)
);

CREATE TEMPORARY TABLE temp_table LIKE movie_TableA;

DROP TABLE movie_TableB;

SHOW TABLES;