/* Create a file named 3.8.3_subqueries_exercises.sql and craft queries to return the results for the following criteria */
USE employees;

SELECT *
  FROM employees
 LIMIT 1;

SELECT *
  FROM salaries
 LIMIT 1;
 
SELECT *
  FROM titles
 LIMIT 1;

SELECT *
  FROM dept_emp
 LIMIT 1;

SELECT *
  FROM dept_manager
 LIMIT 1; 

/* 1. Find all the employees with the same hire date as employee 101010 using a sub-query. */
SELECT CONCAT(first_name,
              ' ',
              last_name) AS 'Employee Name'
  FROM employees
 WHERE hire_date IN(
	   SELECT hire_date
         FROM employees
        WHERE emp_no = 101010);
        
/* 2. Find all the titles held by all employees with the first name Aamod. */
SELECT title,
       COUNT(*)
  FROM titles
 WHERE emp_no IN(
	   SELECT emp_no
         FROM employees
		WHERE first_name LIKE 'Aamod')
 GROUP BY title;
 
/* 3. How many people in the employees table are no longer working for the company? */
SELECT COUNT(*) AS 'Left Company'
  FROM employees
 WHERE emp_no NOT IN(
       SELECT emp_no
         FROM salaries
        WHERE to_date > NOW());

/* 4. Find all the current department managers that are female. */
SELECT CONCAT(first_name,
              ' ',
              last_name) AS 'Employee Name'
  FROM employees
 WHERE gender LIKE 'F' AND
       emp_no IN(
       SELECT emp_no
         FROM dept_manager
        WHERE to_date > NOW());

/* 5. Find all the employees that currently have a higher than average salary. */
SELECT CONCAT(first_name,
              ' ',
              last_name) AS 'Employee Name'
  FROM employees
 WHERE emp_no IN(
       SELECT emp_no
         FROM salaries
        WHERE to_date > NOW() + 2 AND 
              salary > (
			  SELECT AVG(salary)
                FROM salaries));
                
/* 6. How many current salaries are within 1 standard deviation of the highest salary?
 * (Hint: you can use a built in function to calculate the standard deviation.) 
 * What percentage of all salaries is this? */
SELECT (COUNT(*) / (SELECT COUNT(*) FROM salaries WHERE to_date > NOW())) * 100
  FROM salaries
 WHERE salary >= (
	   SELECT MAX(salary) - STDDEV(salary)
	     FROM salaries
	   )
   AND to_date > NOW();
           
/* BONUS Find all the department names that currently have female managers. */
SELECT dept_name
  FROM departments
 WHERE dept_no IN
       (
	   SELECT dept_no
         FROM dept_manager
		WHERE emp_no IN
              (
			  SELECT emp_no
                FROM employees
               WHERE gender LIKE 'F'
		      )
		  AND to_date > NOW()
       );
                 
/* BONUS Find the first and last name of the employee with the highest salary. */
SELECT CONCAT(first_name,
              ' ',
              last_name) AS 'Employee Name'
  FROM employees
 WHERE emp_no = 
 (
	   SELECT emp_no
         FROM salaries
	    ORDER By salary DESC
        LIMIT 1
 );







