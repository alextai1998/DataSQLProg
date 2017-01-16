DROP DATABASE IF EXISTS rekalldb;
CREATE DATABASE rekalldb;
USE rekalldb;

CREATE TABLE employee (
  employee_id SMALLINT(5)  NOT NULL DEFAULT 0,
  first_name  VARCHAR(45)  NOT NULL,
  last_name   VARCHAR(45)  NOT NULL,
  birthdate   DATE         NOT NULL,
  position    VARCHAR(45)  NOT NULL,
  salary      SMALLINT(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (employee_id)
);

CREATE TABLE customer (
  customer_id SMALLINT(5) NOT NULL DEFAULT 0,
  first_name  VARCHAR(45) NOT NULL,
  last_name   VARCHAR(45) NOT NULL,
  birthdate   DATE        NOT NULL,
  PRIMARY KEY (customer_id)
);

CREATE TABLE test (
  test_id   SMALLINT(5) NOT NULL DEFAULT 0,
  date      DATE        NOT NULL,
  result    BOOLEAN     NOT NULL DEFAULT TRUE,
  PRIMARY KEY (test_id)
);

CREATE TABLE `order` (
  order_id  SMALLINT(5) NOT NULL DEFAULT 0,
  date      DATE        NOT NULL,
  PRIMARY KEY (order_id)
);

CREATE TABLE theme (
  theme_id     SMALLINT(5)  NOT NULL DEFAULT 0,
  theme_desc   VARCHAR(100) NOT NULL,
  PRIMARY KEY (theme_id)
);

CREATE TABLE takes (
  customer_id SMALLINT(5) NOT NULL DEFAULT 0,
  test_id     SMALLINT(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (customer_id, test_id),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  FOREIGN KEY (test_id)     REFERENCES test (test_id)
);

CREATE TABLE places (
  customer_id SMALLINT(5) NOT NULL DEFAULT 0,
  order_id SMALLINT(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (customer_id, order_id),
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  FOREIGN KEY (order_id) REFERENCES `order` (order_id)
);

CREATE TABLE specifies (
  order_id SMALLINT(5) NOT NULL DEFAULT 0,
  theme_id SMALLINT(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id, theme_id),
  FOREIGN KEY (order_id) REFERENCES `order` (order_id),
  FOREIGN KEY (theme_id) REFERENCES theme (theme_id)
);

CREATE TABLE designs (
  employee_id SMALLINT(5) NOT NULL DEFAULT 0,
  theme_id    SMALLINT(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (employee_id, theme_id),
  FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
  FOREIGN KEY (theme_id)    REFERENCES theme (theme_id)
);

CREATE TABLE handles (
  employee_id SMALLINT(5) NOT NULL DEFAULT 0,
  order_id    SMALLINT(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (employee_id, order_id),
  FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
  FOREIGN KEY (order_id)    REFERENCES `order` (order_id)
);

CREATE TABLE administers (
  employee_id SMALLINT(5) NOT NULL DEFAULT 0,
  test_id     SMALLINT(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (employee_id, test_id),
  FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
  FOREIGN KEY (test_id)     REFERENCES test (test_id)
);


INSERT INTO customer (customer_id, first_name, last_name, birthdate) VALUES (1, 'Arabella', 'Ferreira', '1989-11-12');
INSERT INTO customer VALUES(2, 'Lakshmi', 'Albert', '1977-07-23');
INSERT INTO customer VALUES(3, 'Starr', 'Franke', '1973-02-17');
INSERT INTO customer VALUES(4, 'Obed', 'Jeong', '1982-09-07');
INSERT INTO customer VALUES(5, 'Pompey', 'Stephanidis', '1972-11-15');
INSERT INTO customer VALUES(6, 'Hebe', 'Quickley', '1970-08-03');
INSERT INTO customer VALUES(7, 'Tsiuri', 'Langer', '1990-04-25');
INSERT INTO customer VALUES(8, 'Walerian', 'Garfield', '1988-01-18');
INSERT INTO customer VALUES(9, 'Theophanes', 'Agnusdei', '1956-01-30');
INSERT INTO customer VALUES(10, 'Sigmund', 'Sparks', '1944-04-15');

INSERT INTO employee (employee_id, first_name, last_name, birthdate, position, salary) VALUES (1, 'Alex', 'Tai', '1989-11-12', 'CEO', 100);
INSERT INTO employee VALUES (2, 'Clement', 'Chang', '1989-11-12', 'Engineer', 9);
INSERT INTO employee VALUES (3, 'Sabrina', 'Ho', '1989-11-12', 'Consultant', 99);
INSERT INTO employee VALUES (4, 'Annshine', 'Wu', '1989-11-12', 'Administrator', 999);
INSERT INTO employee VALUES (5, 'Joseph', 'Huang', '1989-11-12', 'Engineer', 9999);
INSERT INTO employee VALUES (6, 'Andrew', 'Chen', '1989-11-12', 'Administrator', 1000);
INSERT INTO employee VALUES (7, 'Ruben', 'Pinzon' , '1989-11-12', 'Engineer', 1001);
INSERT INTO employee VALUES (8, 'Johnson', 'Tai', '1989-11-12', 'Consultant', 1002);
INSERT INTO employee VALUES (9, 'Yuhui', 'Lin', '1989-11-12', 'Consultant', 1003);
INSERT INTO employee VALUES (10, 'Ivy', 'Tai', '1989-11-12', 'Administrator', 1004);

INSERT INTO test (test_id, date, result) VALUES (1, '2016-11-12', FALSE);
INSERT INTO test VALUES (2,  '2016-10-13', TRUE);
INSERT INTO test VALUES (3,  '2016-09-14', TRUE);
INSERT INTO test VALUES (4,  '2016-08-15', FALSE);
INSERT INTO test VALUES (5,  '2016-07-16', TRUE);
INSERT INTO test VALUES (6,  '2016-06-17', TRUE);
INSERT INTO test VALUES (7,  '2016-05-18', TRUE);
INSERT INTO test VALUES (8,  '2016-04-19', FALSE);
INSERT INTO test VALUES (9,  '2016-03-20', FALSE);
INSERT INTO test VALUES (10, '2016-02-21', TRUE);

INSERT INTO `order` (order_id, date) VALUES (1, '2017-11-12');
INSERT INTO `order` VALUES (2,  '2017-10-13');
INSERT INTO `order` VALUES (3,  '2017-09-14');
INSERT INTO `order` VALUES (4,  '2017-08-15');
INSERT INTO `order` VALUES (5,  '2017-07-16');
INSERT INTO `order` VALUES (6,  '2017-06-17');
INSERT INTO `order` VALUES (7,  '2017-05-18');
INSERT INTO `order` VALUES (8,  '2017-04-19');
INSERT INTO `order` VALUES (9,  '2017-03-20');
INSERT INTO `order` VALUES (10, '2017-02-21');
INSERT INTO `order` VALUES (11, '2017-01-22');
INSERT INTO `order` VALUES (12, '2017-12-23');
INSERT INTO `order` VALUES (13, '2017-10-24');
INSERT INTO `order` VALUES (14, '2017-04-20');
INSERT INTO `order` VALUES (15, '2017-03-30');
INSERT INTO `order` VALUES (16, '2017-07-30');
INSERT INTO `order` VALUES (17, '2017-09-17');
INSERT INTO `order` VALUES (18, '2017-12-12');
INSERT INTO `order` VALUES (19, '2017-04-12');
INSERT INTO `order` VALUES (20, '2017-08-12');

INSERT INTO theme (theme_id, theme_desc) VALUES (1, 'Vacation at Bora Bora Islands');
INSERT INTO theme VALUES (2, 'Vacation at the Maldives');
INSERT INTO theme VALUES (3, 'Winning the lottery');
INSERT INTO theme VALUES (4, 'Undercover government spy');
INSERT INTO theme VALUES (5, 'Snowboarding in Japan');
INSERT INTO theme VALUES (6, 'Religious pilgrimage to Mecca');
INSERT INTO theme VALUES (7, 'Tibetan photoshoot trip');
INSERT INTO theme VALUES (8, 'Getting an A+ for the SQL Exam');
INSERT INTO theme VALUES (9, 'Longboarding in Spain');
INSERT INTO theme VALUES (10, 'Attending the music festival in Istanbul');

INSERT INTO takes (customer_id, test_id) VALUES (1, 10);
INSERT INTO takes VALUES (2, 9);
INSERT INTO takes VALUES (3, 8);
INSERT INTO takes VALUES (4, 7);
INSERT INTO takes VALUES (5, 6);
INSERT INTO takes VALUES (6, 5);
INSERT INTO takes VALUES (7, 4);
INSERT INTO takes VALUES (8, 3);
INSERT INTO takes VALUES (9, 2);
INSERT INTO takes VALUES (10, 1);

INSERT INTO places (customer_id, order_id) VALUES (1, 10);
INSERT INTO places VALUES (2, 9);
INSERT INTO places VALUES (3, 8);
INSERT INTO places VALUES (4, 7);
INSERT INTO places VALUES (4, 6);
INSERT INTO places VALUES (4, 5);
INSERT INTO places VALUES (4, 4);
INSERT INTO places VALUES (8, 3);
INSERT INTO places VALUES (9, 2);
INSERT INTO places VALUES (10, 1);

INSERT INTO specifies (order_id, theme_id) VALUES (1, 10);
INSERT INTO specifies VALUES (2, 1);
INSERT INTO specifies VALUES (3, 8);
INSERT INTO specifies VALUES (4, 1);
INSERT INTO specifies VALUES (5, 6);
INSERT INTO specifies VALUES (6, 1);
INSERT INTO specifies VALUES (7, 1);
INSERT INTO specifies VALUES (8, 3);
INSERT INTO specifies VALUES (9, 2);
INSERT INTO specifies VALUES (10, 1);

INSERT INTO administers (employee_id, test_id) VALUES (4, 1);
INSERT INTO administers VALUES (6, 2);
INSERT INTO administers VALUES (6, 3);
INSERT INTO administers VALUES (6, 4);
INSERT INTO administers VALUES (6, 5);
INSERT INTO administers VALUES (6, 6);
INSERT INTO administers VALUES (10, 7);
INSERT INTO administers VALUES (6, 8);
INSERT INTO administers VALUES (4, 9);
INSERT INTO administers VALUES (4, 10);


INSERT INTO designs (employee_id, theme_id) VALUES (2, 1);
INSERT INTO designs VALUES (2, 2);
INSERT INTO designs VALUES (2, 3);
INSERT INTO designs VALUES (5, 4);
INSERT INTO designs VALUES (5, 5);
INSERT INTO designs VALUES (5, 6);
INSERT INTO designs VALUES (5, 7);
INSERT INTO designs VALUES (5, 8);
INSERT INTO designs VALUES (5, 9);
INSERT INTO designs VALUES (7, 10);


# Display contents of specified tables
SELECT * FROM employee;
SELECT * FROM customer;
SELECT * FROM test;
SELECT * FROM takes;
SELECT * FROM `order`;
SELECT * FROM specifies;
SELECT * FROM places;
SELECT * FROM theme;
SELECT * FROM administers;
SELECT * FROM designs``;


# 5 Simple Queries
SELECT salary, CONCAT(first_name, ' ', last_name) as Name FROM employee WHERE position = 'CEO';
SELECT customer_id FROM customer WHERE first_name = 'Walerian' AND last_name = 'Garfield';
SELECT salary, position FROM employee WHERE employee_id = 7;
SELECT CONCAT(first_name, ' ', last_name) as Name FROM customer ORDER BY birthdate DESC LIMIT 1;
SELECT customer_id FROM customer WHERE last_name LIKE '%s';


# 5 Complex Queries
SELECT result FROM test INNER JOIN takes USING (test_id) INNER JOIN customer USING (customer_id) WHERE first_name = 'Tsiuri' AND last_name = 'Langer';
SELECT COUNT(*) FROM `order` INNER JOIN places USING (order_id) INNER JOIN customer USING (customer_id) WHERE customer_id = 4;
SELECT COUNT(*) FROM `order` INNER JOIN specifies USING (order_id) INNER JOIN theme USING (theme_id) WHERE theme_id = 1;
SELECT CONCAT(first_name, ' ', last_name) as Name FROM test INNER JOIN administers USING (test_id) INNER JOIN employee USING (employee_id) GROUP BY (employee_id) ORDER BY COUNT(*) DESC LIMIT 1);
SELECT COUNT(*), CONCAT(first_name, ' ', last_name) as Name FROM employee INNER JOIN designs USING (employee_id) INNER JOIN theme USING (theme_id) GROUP BY (employee_id) ORDER BY COUNT(*));