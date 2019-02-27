/* 1. Use the employees database. */
USE employees;

SELECT *
  FROM dept_manager;

SELECT *
  FROM departments;
  
SELECT *
  FROM employees;
  
SELECT *
  FROM titles;
  
SELECT *
  FROM dept_emp;
  
SELECT *
  FROM salaries;

/* 2. Using the example in the Associative Table Joins section as a guide, write a query that 
 * shows each department along with the name of the current manager for that department. */
SELECT d.dept_name AS 'Department Name',
	   CONCAT(e.first_name,
			  ' ',
              e.last_name) AS 'Department Manager'
  FROM departments AS d
  JOIN dept_manager AS dm
    ON d.dept_no = dm.dept_no
  JOIN employees AS e
    ON dm.emp_no = e.emp_no
 WHERE dm.to_date > NOW();

/* 3. Find the name of all departments currently managed by women. */
SELECT d.dept_name AS 'Department Name',
	   CONCAT(e.first_name,
			  ' ',
              e.last_name) AS 'Department Manager'
  FROM departments AS d
  JOIN dept_manager AS dm
    ON d.dept_no = dm.dept_no
  JOIN employees AS e
    ON dm.emp_no = e.emp_no
 WHERE dm.to_date > NOW() AND
	   e.gender LIKE 'F';
       
/* 4. Find the current titles of employees currently working in the Customer 
 * Service department. */
SELECT t.title AS 'Title',
	   COUNT(t.title) AS 'Count'
  FROM departments AS d
  JOIN dept_emp AS de
    ON d.dept_no = de.dept_no
  JOIN titles AS t
    ON de.emp_no = t.emp_no
 WHERE d.dept_name LIKE 'Customer Service'
   AND de.to_date > NOW()
   AND t.to_date > NOW()
 GROUP BY t.title;
 
/* 5. Find the current salary of all current managers. */
SELECT d.dept_name AS 'Department Name',
	   CONCAT(e.first_name,
			  ' ',
              e.last_name) AS 'Department Manager',
	   s.salary AS 'Salary'
  FROM departments AS d
  JOIN dept_manager AS dm
    ON d.dept_no = dm.dept_no
  JOIN employees AS e
    ON dm.emp_no = e.emp_no
  JOIN salaries AS s
    ON e.emp_no = s.emp_no
 WHERE dm.to_date > NOW() AND
	   s.to_date > NOW()
 ORDER BY d.dept_name;
       
/* 6. Find the number of employees in each department. */
SELECT d.dept_no,
	   d.dept_name,
       COUNT(*)
  FROM departments AS d
  JOIN dept_emp AS de
    ON d.dept_no = de.dept_no
 WHERE de.to_date > NOW()  
 GROUP BY d.dept_name
 ORDER BY d.dept_no;

/* 7. Which department has the highest average salary? */
SELECT d.dept_name,
	   AVG(s.salary) AS 'average_salary'
  FROM departments AS d
  JOIN dept_emp AS de
    ON d.dept_no = de.dept_no
  JOIN salaries AS s
    ON de.emp_no = s.emp_no
 WHERE de.to_date > NOW() AND
       s.to_date > NOW()
 GROUP BY d.dept_name
 ORDER BY AVG(s.salary) DESC
 LIMIT 1;
 
/* 8. Who is the highest paid employee in the Marketing department */
SELECT e.first_name,
	   e.last_name
  FROM departments AS d
  JOIN dept_emp AS de
    ON d.dept_no = de.dept_no
  JOIN salaries AS s
    ON de.emp_no = s.emp_no
  JOIN employees AS e
    ON s.emp_no = e.emp_no
 WHERE d.dept_name LIKE 'Marketing' AND
       de.to_date > NOW() AND
       s.to_date > NOW()
 ORDER BY s.salary DESC
 LIMIT 1;
 
/* 9. Which current department manager has the highest salary? */
SELECT e.first_name,
       e.last_name,
       s.salary,
       d.dept_name
  FROM departments AS d
  JOIN dept_emp AS de
    ON d.dept_no = de.dept_no
  JOIN salaries AS s
    ON de.emp_no = s.emp_no
  JOIN employees AS e
    ON s.emp_no = e.emp_no
 WHERE s.to_date > NOW()  AND
       d.dept_name LIKE 'Marketing'
 ORDER BY s.salary DESC
 LIMIT 1;
 
/* 10. *BONUS* Find the names of all current employees, 
 * their department name, and their current manager's name. */
SELECT CONCAT(e.first_name,
			  ' ',
              e.last_name) AS 'Employee Name',
	   d.dept_name AS 'Department Name',
       CONCAT(m.first_name,
			  ' ',
              m.last_name) AS 'Manager Name'
  FROM employees AS e
  JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
  JOIN departments  AS d
    ON de.dept_no = d.dept_no
  JOIN dept_manager AS dm 
    ON d.dept_no = dm.dept_no 
  JOIN employees AS m
    ON dm.emp_no = m.emp_no
 WHERE de.to_date > NOW() AND
	   dm.to_date > NOW();

/* 11. *BONUS* Find the highest paid employee in each department. */








