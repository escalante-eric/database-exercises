/* Copy the order by exercise and save it as 3.6_functions_exercises.sql. */
   USE employees;
  SHOW TABLES;
SELECT * FROM employees;

/* Update your queries for employees whose names start and end with 'E'. 
 * Use concat() to combine their first and last name together as a single column named full_name. */
SELECT CONCAT(first_name, ' ', last_name) AS full_name
  FROM employees;

/* Convert the names produced in your last query to all uppercase. */
SELECT UPPER(CONCAT(first_name, last_name)) AS full_name
  FROM employees;

/* For your query of employees born on Christmas and hired in the 90s, use datediff() to
 * find how many days they have been working at the company */
SELECT DATEDIFF(CURDATE(), hire_date)
  FROM employees
 WHERE hire_date LIKE '199%'
   AND birth_date LIKE '%-12-25';
   
/* Find the smallest and largest salary from the salaries table. */
SELECT MAX(salary) AS 'Salary Max',
	   MIN(salary) AS 'Salary Min'
  FROM salaries;

/* Use your knowledge of built in SQL functions to generate a username for all of the employees. 
 * A username should be all lowercase, and consist of the first character of the employees first name, 
 * the first 4 characters of the employees last name, an underscore, the month the employee was born, 
 * and the last two digits of the year that they were born.  */
SELECT LOWER(
		   CONCAT(SUBSTR(first_name, 1, 1), 
				  SUBSTR(last_name, 1, 4),
				  '_',
				  SUBSTR(birth_date, 6, 2),
				  SUBSTR(birth_date, 3, 2)))
	   AS 'username' 	
  FROM employees;



