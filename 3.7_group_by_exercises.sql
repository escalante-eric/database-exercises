/* 1. Create a new file named 3.7_group_by_exercises.sql */

/* 2. In your script, use DISTINCT to find the unique titles in the titles table. */
   USE employees;
  SHOW TABLES;
SELECT * FROM titles;

SELECT DISTINCT title
  FROM titles;

/* 3. Find your query for employees whose last names start and end with 'E'. 
 * Update the query find just the unique last names that start and end with 'E' using GROUP BY.  */
SELECT last_name
  FROM employees
 WHERE last_name LIKE 'E%e'
 GROUP BY last_name;
 
/* 4. Update your previous query to now find unique combinations of first and last name where
 * the last name starts and ends with 'E'. */
SELECT last_name, 
	   first_name
  FROM employees
 WHERE last_name LIKE 'E%e'
 GROUP BY last_name,
		  first_name;
          
/* 5. Find the unique last names with a 'q' but not 'qu'. */
SELECT last_name
  FROM employees
 WHERE last_name LIKE '%q%'
   AND last_name NOT LIKE '%qu%'
 GROUP BY last_name;
 
/* 6. Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose
 * unusual name is shared with others. */
SELECT last_name
  FROM employees
 WHERE last_name LIKE '%q%'
   AND last_name NOT LIKE '%qu%'
 GROUP BY last_name
 ORDER BY COUNT(*);
 
 /* (cont.) Which (across all employees) name is the most common, the least common? 
  * Find this for both first name, last name, and the combination of the two. */
SELECT first_name, last_name, COUNT(*)
  FROM employees
 GROUP BY first_name, last_name
 ORDER BY COUNT(first_name), COUNT(last_name)
 LIMIT 1;
 
/* 7. Update your query for 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the
 * number of employees for each gender with those names. */
SELECT gender,
       COUNT(*)
  FROM employees
 WHERE first_name IN ('Irena', 'Vidya', 'Maya')
 GROUP By gender;
 
/* 8. Recall the query the generated usernames for the employees from the last lesson. Are there any duplicate usernames? 
 * Bonus: how many duplicate usernames are there? */
SELECT LOWER(
	   CONCAT(SUBSTR(first_name, 1, 1), 
			  SUBSTR(last_name, 1, 4),
              '_',
              SUBSTR(birth_date, 6, 2),
              SUBSTR(birth_date, 3, 2)))
	    AS 'username',
      COUNT(*)
  FROM employees
 GROUP BY username;










 
