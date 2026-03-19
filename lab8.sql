use employees;

-- 1
SELECT e.emp_no, e.first_name, e.last_name, s.salary FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary > (
    SELECT AVG(salary) FROM salaries
);

-- 2
SELECT emp_no, first_name, last_name FROM employees
WHERE emp_no IN (
    SELECT emp_no 
    FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no 
        FROM departments 
        WHERE dept_name = 'Sales'
    )
);

-- 3
SELECT emp_no, first_name, last_name FROM employees
WHERE emp_no IN (
    SELECT emp_no FROM dept_manager
);

-- 4
CREATE TABLE high_salary_emp LIKE employees;

-- 5
 INSERT INTO high_salary_emp
SELECT e.*
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary > 80000;

-- 6
CREATE TABLE sales_emp LIKE employees;

-- 7
 INSERT INTO sales_emp
SELECT *
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no 
        FROM departments 
        WHERE dept_name = 'Sales'
    )
);

-- 8
CREATE TABLE new_salaries AS
SELECT * FROM salaries;

-- 9
UPDATE salaries
SET salary = salary * 1.10
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Development'
    )
);

-- 10
   UPDATE salaries
SET salary = salary + 5000
WHERE salary < (
    SELECT AVG(salary) FROM (
        SELECT salary FROM salaries
    ) AS temp
);

-- 11
DELETE FROM salaries
WHERE salary < (
    SELECT AVG(salary) FROM (
        SELECT salary FROM salaries
    ) AS temp
);

-- 12
  CREATE TABLE new_employee AS
SELECT * FROM employees;


-- 13
 DELETE FROM employees
WHERE emp_no NOT IN (
    SELECT emp_no FROM dept_emp
);

-- 14
 
 DROP TABLE high_salary_emp;
DROP TABLE sales_emp;
DROP TABLE new_salaries;
DROP TABLE new_employee;


  


 



 
 
 