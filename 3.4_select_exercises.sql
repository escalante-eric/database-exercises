/* Create a new file called 3.4_select_exercises.sql. Do your work for this exercise in that file.
 * Use the albums_db database. */
USE albums_db;

/* Explore the structure of the albums table. */
SHOW TABLES;
DESCRIBE albums;
SELECT * FROM albums;

/* Write queries to find the following information. */

/* The name of all albums by Pink Floyd */
SELECT name 
  FROM albums 
 WHERE artist = 'Pink Floyd';

/* The year Sgt. Pepper's Lonely Hearts Club Band was released */
SELECT release_date 
  FROM albums 
 WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

/* Which albums were released in the 1990s */
SELECT name 
  FROM albums 
 WHERE release_date BETWEEN 1990 AND 1999;

/* Which albums had less than 20 million certified sales */
SELECT name
  FROM albums 
 WHERE sales < 20;

/* All the albums with a genre of "Rock". */
SELECT name
  FROM albums 
 WHERE genre LIKE '%Rock%';
 
/* --------------------------------------------------------------------------------------------------------------------------------------------- */

/* Write a query that shows all the information in the `help_topic` table in the 
 * `mysql` database. */
SELECT * 
  FROM mysql.help_topic;

/* Take a look at the information in the salaries table in the employees
 * database. What do you notice? */
USE employees;
SHOW TABLES;
DESCRIBE salaries;
SELECT * 
  FROM salaries;

/* Explore the `sakila` database. What do you think this database represents? 
 * Create a movie information */
USE sakila;
SHOW TABLES;


/* Write a query that shows all the columns from the `actors` table */
SELECT * 
  FROM actor;

/* Write a query that only shows the last name of the actors from the `actors` table */
SELECT last_name FROM actor;

/* Write a query that displays the title, description, rating, movie length 
 * columns from the `films` table for films that last 3 hours or longer. */
SELECT title,
	   description,
	   rating,
       length
  FROM film
 WHERE length > 180;

/* Select the payment id, amount, and payment date columns from the payments
 * table for payments made on or after 05/27/2005. */
SELECT payment_id,
	   amount,
       payment_date
  FROM payment
 WHERE payment_date > '2005-05-27';

/* Select the primary key, amount, and payment date columns from the payment
 * table for payments made on 05/27/2005. */
SELECT payment_id,
	    amount,
        payment_date
   FROM payment
  WHERE payment_date LIKE '2005-05-27%';

  CODE Updated to fix description in Github
  



