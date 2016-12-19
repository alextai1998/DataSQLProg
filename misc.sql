show DATABASES;
USE musicdb;
show TABLES;
SELECT DISTINCT count(gender) FROM employees WHERE gender = 'M';
select dept_no FROM  departments WHERE dept_name = "Customer Service";

show TABLES;
DESCRIBE employees;


SELECT count(DISTINCT first_name, last_name, hire_date) FROM employees;

use musicdb;

DESCRIBE track;

SELECT count(DISTINCT artist_id) FROM artist;
SELECT DISTINCT lower(artist_name) FROM artist;
SELECT DISTINCT UPPER(artist_name), album_name, count(track_id) FROM artist INNER JOIN album USING (artist_id)
  INNER JOIN track USING (album_id, artist_id) GROUP BY artist_name, album_name;

SELECT track_name, track_id, count(played) FROM played INNER JOIN track USING (track_id, artist_id, album_id) GROUP BY track_id;

SELECT track_name, count(played) from Played INNER JOIN track USING (track_id, artist_id, album_id) GROUP BY track_name;
USE musicdb;

SELECT COUNT(*) FROM artist
INNER JOIN album USING (artist_id)
INNER JOIN track USING (artist_id, album_id)
GROUP BY artist_name;


# INNER JOIN played USING (artist_id, album_id, track_id)
# GROUP BY artist_id, album_id;

USE mystery;

SELECT COUNT(*) FROM (
  SELECT *
  FROM employees
    INNER JOIN salaries USING (emp_no)
) AS T;


DESCRIBE salaries;

SELECT COUNT(*) FROM (
  SELECT
    first_name,
    emp_no,
    COUNT(*) AS num_salaries
  FROM salaries
    INNER JOIN employees USING (emp_no)
  WHERE FLOOR(emp_no/1000) = 14
  AND first_name LIKE "G%"
  GROUP BY emp_no
  HAVING num_salaries = 1
) AS T;


  INNER JOIN dept_emp USING (emp_no)
  INNER JOIN departments USING (dept_no)

    WHERE first_name LIKE "Moon"
    AND dept_name = "Development"
    AND YEAR(birth_date)=1952
    AND MONTH(birth_date) = 12

SHOW TABLES;
DESCRIBE employees;
DESCRIBE dept_emp;
DESCRIBE titles;


SELECT COUNT(*) FROM (
  SELECT
    first_name,
    last_name,
    emp_no,
    COUNT(*) AS num_salaries
  FROM salaries
    INNER JOIN employees USING (emp_no)
    INNER JOIN dept_emp USING (emp_no)
    INNER JOIN departments USING (dept_no)
  WHERE first_name LIKE "Ba%"
  AND dept_name = "Research"
  AND dept_emp.to_date LIKE "2000%"
  AND MONTH(birth_date) = 3
  GROUP BY emp_no
  HAVING num_salaries = 10
) AS T;


SELECT title FROM titles;


SELECT COUNT(*) FROM (
  SELECT
    first_name,
    last_name,
    emp_no,
    title
  FROM employees
#     INNER JOIN salaries USING (emp_no)
      INNER JOIN dept_emp USING (emp_no)
#     INNER JOIN departments USING (dept_no)
      INNER JOIN titles USING (emp_no)
  WHERE title LIKE "Senior Engineer"
    AND gender LIKE "m"
    AND hire_date LIKE "1999%"
    AND dept_emp.to_date LIKE "9999%"
  ORDER BY birth_date DESC LIMIT 1
) AS T;

SELECT COUNT(*) FROM (
  SELECT
    first_name,
    last_name,
    emp_no
  FROM employees
    WHERE first_name LIKE "%kk%"
    AND last_name LIKE "%tt%"
    AND emp_no LIKE "%7%7%"
) AS T;

use mystery;

SELECT COUNT(*) FROM (
  SELECT
    first_name,
    last_name,
    emp_no,
    title
  FROM employees
#     INNER JOIN salaries USING (emp_no)
      INNER JOIN dept_emp USING (emp_no)
#     INNER JOIN departments USING (dept_no)
      INNER JOIN titles USING (emp_no)
  WHERE title LIKE "Technique Leader"
    AND gender LIKE "m"
    AND hire_date LIKE "1999%"
    AND dept_emp.to_date LIKE "9999%"
  ORDER BY birth_date DESC LIMIT 1
) AS T;


SELECT
  first_name,
  last_name,
  emp_no
FROM employees
  INNER JOIN titles USING (emp_no)
  INNER JOIN dept_emp USING (emp_no)
  INNER JOIN departments USING (dept_no)
WHERE title LIKE "Senior Engineer"
  AND dept_name LIKE "Development"
  AND emp_no LIKE "%88"
  AND last_name LIKE "D%"
  AND gender LIKE "F"
  AND birth_date > "1960-01-01";


SELECT COUNT(*)
FROM (
       SELECT last_name AS TEXT
       FROM employees
       UNION
       SELECT dept_name
       FROM departments
     ) AS T;


(SELECT CONCAT(Last_name, " ", first_name) as Name,
  AVG(salary) as "Salary",
  count(*) as "N" from employees
INNER JOIN salaries USING (emp_no)
GROUP BY emp_no ORDER BY salary DESC LIMIT 5)
UNION
(SELECT CONCAT(Last_name, " ", first_name) as Name,
  AVG(salary) as "Salary",
  count(*) as "N" from employees
INNER JOIN salaries USING (emp_no)
GROUP BY emp_no ORDER BY salary LIMIT 5);


(SELECT CONCAT(Last_name, " ", first_name) as Name,
  salary as "Salary" FROM employees
INNER JOIN salaries USING (emp_no)
ORDER BY salary DESC LIMIT 5)
UNION ALL
(SELECT CONCAT(Last_name, " ", first_name) as Name,
  salary as "Salary" FROM employees
INNER JOIN salaries USING (emp_no)
ORDER BY salary LIMIT 5);

SELECT track_name, played FROM played
LEFT JOIN track USING (artist_id, album_id, track_id)
ORDER BY played DESC;

SELECT artist_name, album_name, COUNT(played) as TimesPlayed FROM artist
INNER JOIN album USING (artist_id)
INNER JOIN track USING (artist_id, album_id)
LEFT JOIN played USING (artist_id, album_id, track_id)
GROUP BY album.artist_id, album.album_id;

SHOW TABLES;

DESCRIBE employees;

SELECT emp_no, COUNT(salary) FROM salaries;


SELECT COUNT(*) FROM (
  (SELECT
    CONCAT(first_name, " ", last_name) as FullName,
    emp_no,
    COUNT(*) AS num_salaries
  FROM salaries
    INNER JOIN employees USING (emp_no)
  GROUP BY emp_no
  ORDER BY num_salaries LIMIT 3)
  UNION
  (SELECT
    CONCAT(first_name, " ", last_name) as FullName,
    emp_no,
    COUNT(*) AS num_salaries
  FROM salaries
    INNER JOIN employees USING (emp_no)
  GROUP BY emp_no
  HAVING num_salaries = 6 LIMIT 3)
  UNION
  (SELECT
    CONCAT(first_name, " ", last_name) as FullName,
    emp_no,
    COUNT(*) AS num_salaries
  FROM salaries
    INNER JOIN employees USING (emp_no)
  GROUP BY emp_no
  ORDER BY num_salaries DESC LIMIT 3)
) AS T;

DESCRIBE departments;

SELECT COUNT(*) FROM (
  SELECT
    CONCAT(first_name, " ", last_name) as Name,
    emp_no,
    dept_name,
    gender
  FROM employees
      INNER JOIN dept_emp USING (emp_no)
      INNER JOIN departments USING (dept_no)
  WHERE last_name LIKE "M%"
    AND birth_date LIKE "1952%"
    AND hire_date LIKE "1999%"
    AND dept_emp.to_date LIKE "9999%"
  ORDER BY birth_date DESC LIMIT 1
) AS T;



SELECT first_name, last_name, emp_no, birth_date FROM employees
WHERE birth_date LIKE "1965-02%" OR birth_date LIKE "1952-02"
LIMIT 20;



SELECT FullName, num_dept, num_salaries FROM (
  SELECT
    CONCAT(first_name, " ", last_name) as FullName,
    emp_no,
    COUNT(DISTINCT dept_name) AS num_dept,
    COUNT(*) AS num_salaries
    FROM employees
      INNER JOIN dept_emp USING (emp_no)
      INNER JOIN departments USING (dept_no)
    GROUP BY emp_no
    HAVING num_dept = 2
) AS T
GROUP BY emp_no
HAVING num_salaries = 2;












USE sakila;


show tables;


DESCRIBE payment;
DESCRIBE film;
DESCRIBE category;
DESCRIBE actor;
DESCRIBE city;
DESCRIBE address;
DESCRIBE customer;


SELECT active FROM customer;


SELECT return_date FROM rental WHERE return_date IS NULL
AND rental_date + INTERVAL film.rental_duration DAY < CURRENT_DATE();


SELECT DISTINCT name FROM category;


SELECT title, film_id FROM film
  INNER JOIN film_category USING(film_id)
  INNER JOIN category USING(category_id)
WHERE category.name = "Horror";

SELECT distinct name from language;

SELECT * FROM film
  INNER JOIN film_category USING(film_id)
  INNER JOIN category USING(category_id)
  INNER JOIN language USING(language_id)
WHERE language.name = "German"
AND category.name = "Sci-Fi";

SELECT title FROM film
  INNER JOIN inventory USING(film_id)
  INNER JOIN rental USING(inventory_id)
WHERE return_date IS NOT NULL;

SELECT COUNT(*) FROM film;

SELECT country, city, district FROM payment
  INNER JOIN address USING()
  INNER JOIN city USING(city_id)
  INNER JOIN country USING()
  GROUP BY amount
  WHERE amount = 0
ORDER BY last_update DESC LIMIT 1;


SELECT title FROM film
  INNER JOIN film_category USING(film_id)
  INNER JOIN category USING(category_id)
  INNER JOIN film_actor USING (film_id)
  INNER JOIN actor USING(actor_id)
  WHERE name.category = "action" AND actor = "Mena Hopper";


SELECT COUNT(*) FROM (
  SELECT
    title
  FROM film
  WHERE description LIKE "%forensic%"
    AND length < 100
) AS T;

longest movie

SELECT title FROM film
INNER JOIN actor


SELECT COUNT(*) FROM (
  SELECT
    rental_date
  FROM rental
    INNER JOIN
  WHERE description LIKE "%forensic%"
    AND length < 100
) AS T;



SELECT phone FROM address
  INNER JOIN city USING (city_id)
WHERE city = "Abu Dhabi"


SELECT COUNT(*) FROM (
  SELECT rental_date FROM rental
    INNER JOIN inventory USING(inventory_id)
    INNER JOIN film USING(film_id)
  WHERE title LIKE "Pelican Comforts"
) AS T;


DESCRIBE store;
describe customer;
# Address that contains a 3 and person first name starts with s and Last name  with ll

SELECT address FROM address
  INNER JOIN customer USING(address_id)
WHERE address LIKE "%3%" AND first_name LIKE "S%" AND last_name LIKE "%ll%"


SELECT actor_id from actor
INNER JOIN film_actor USING(actor_id)
INNER JOIN film USING(film_id)

list of names of customers from store_id 1

SELECT first_name FROM customer
INNER JOIN store USING()
WHERE


SELECT rental_date FROM rental
  INNER JOIN inventory USING(inventory_id)
  INNER JOIN film USING(film_id)
  INNER JOIN customer USING(customer_id)
WHERE title LIKE "Pelican Comforts"


SELECT DISTINCT amount FROM payment;

SELECT title FROM film
  INNER JOIN rental USING(rental_id)
  INNER JOIN film USING(film_id)
  INNER JOIN customer USING(customer_id)


amount of money cus spent in DESCRIBE

SELECT first_name, sum(amount) AS money FROM customer
INNER JOIN payment USING(customer_id)
GROUP BY customer_id
  ORDER BY money DESC;


SELECT * FROM film
  INNER JOIN language USING(language_id)
  GROUP BY film_id
WHERE COUNT(language.name) = 3;


