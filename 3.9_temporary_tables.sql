/* Create a file named 3.9_temporary_tables.sql to do your work for this exercise. */
USE ada_683;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
  FROM employees.employees
  JOIN employees.dept_emp USING(emp_no)
  JOIN employees.departments USING(dept_no)
 LIMIT 100;

SELECT * FROM employees_with_departments;
 
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);
SELECT * FROM employees_with_departments;

UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);
SELECT * FROM employees_with_departments;

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;
SELECT * FROM employees_with_departments;

/* ----------------------------------------------------------------------------------------------------------------------------------------------- */

/* 2. Create a temporary table based on the payments table from the sakila database. */

CREATE TEMPORARY TABLE temp_payments AS
SELECT amount
FROM sakila.payment;

ALTER TABLE temp_payments ADD payments_int INT(7);
UPDATE temp_payments SET payments_int = amount * 100;

ALTER TABLE temp_payments DROP COLUMN amount;
SELECT * FROM temp_payments;

/* ----------------------------------------------------------------------------------------------------------------------------------------------- */

/* 3. Find out how the average pay in each department compares to the overall average pay.
 * In order to make the comparison easier, you should use the Z-score for salaries.
 * In terms of salary, what is the best department to work for? The worst? */

SELECT AVG(salary),
	   STDDEV(salary)
  FROM employees.salaries
 WHERE to_date > NOW();

SELECT a.dept_name, AVG(a.z_score) AS avg_zscore
  FROM (
		SELECT d.dept_name,
			   s.emp_no,
			   s.salary,
			   ((s.salary - 72012) / 17310) AS z_score
		  FROM employees.salaries AS s
		  JOIN employees.dept_emp AS de
		 USING (emp_no)
		  JOIN employees.departments AS d
		 USING (dept_no) 
		 WHERE s.to_date > NOW()
 ) a
  GROUP BY a.dept_name;
  
CREATE TEMPORARY TABLE agg AS
SELECT AVG(salary) AS avg_salary, STDDEV(salary) AS stdev_salary
FROM employees.salaries
WHERE to_date > NOW();


SELECT a.dept_name, AVG(a.z_salary) AS avg_z_salary
FROM  (
SELECT d.dept_name, s.emp_no, s.salary, ((s.salary-a.avg_salary)/a.stdev_salary) AS z_salary
	FROM employees.salaries s
	JOIN agg a
	JOIN employees.dept_emp de ON s.emp_no = de.emp_no
	JOIN departments d ON de.dept_no = d.dept_no
	WHERE s.to_date > NOW()
	) a
GROUP BY a.dept_name;


/* 4. What is the average salary for an employee based on the number of years they have been with the company?
 * Express your answer in terms of the Z-score of salary. */
 












