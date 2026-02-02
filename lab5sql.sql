use employees;
desc employees;

-- 1> 
select e.emp_no,e.first_name,s.salary, s.salary*1.10 as new_salary from employees as e
natural join
salaries s limit 100;

-- 2>
SELECT e.emp_no, e.first_name, e.last_name,
       s.salary, (s.salary*12) AS annual_salary
FROM employees e
NATURAL JOIN salaries s
WHERE s.to_date='9999-01-01' -- up to date employees
LIMIT 100;
 
 -- 3>
 SELECT e.emp_no, e.first_name, e.last_name,
       s.salary, (s.salary/2) AS half_month_salary
FROM employees e
NATURAL JOIN salaries s
WHERE s.to_date='9999-01-01'
  AND (s.salary/2) > 30000
LIMIT 100;

 -- 4>
 SELECT e.emp_no,
       CONCAT(e.first_name,' ',e.last_name) AS full_name,
       e.hire_date
FROM employees e
WHERE e.gender = 'M'
  AND e.hire_date > '1995-12-31';
  
  -- 5>
  SELECT e.emp_no, CONCAT(e.first_name,' ',e.last_name) AS full_name, e.gender, e.hire_date
FROM employees e
WHERE e.gender = 'F'
   OR e.hire_date < '1990-01-01';
   
-- 6>
 SELECT e.emp_no, CONCAT(e.first_name,' ',e.last_name) AS full_name, e.gender
FROM employees e
WHERE NOT (e.gender = 'F');

-- 7>
 SELECT e.emp_no, CONCAT(e.first_name,' ',e.last_name) AS full_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
  AND s.salary > 60000;

-- 8>
 SELECT e.emp_no, CONCAT(e.first_name,' ',e.last_name) AS full_name, e.hire_date
FROM employees e
WHERE e.hire_date <= '1992-12-31';

-- 9>
 SELECT e.emp_no, CONCAT(e.first_name,' ',e.last_name) AS full_name, de.dept_no
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
  AND de.dept_no IN ('d001','d002');

-- 10>
 SELECT e.emp_no, CONCAT(e.first_name,' ',e.last_name) AS full_name, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
  AND s.salary BETWEEN 50000 AND 80000;

-- 11>
SELECT e.emp_no, CONCAT(e.first_name,' ',e.last_name) AS full_name, de.dept_no
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01';
 
 -- 12>
 SELECT e.emp_no, e.first_name, e.last_name FROM employees e
WHERE e.first_name LIKE 'A%';

-- 13>
 SELECT e.emp_no, e.first_name, e.last_name FROM employees e
WHERE e.last_name LIKE '%son';

-- 14>
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
WHERE e.first_name LIKE '%an%';

-- 15>
 SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
WHERE e.first_name LIKE '_____';

-- 16>
SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
WHERE e.last_name LIKE '_____%';

-- 17>
 SELECT e.emp_no, e.first_name, e.last_name FROM employees e
WHERE e.first_name NOT LIKE 'Ba%';

-- 18>
 SELECT COUNT(*) AS total_employees FROM employees;
 
 -- 19>
 SELECT AVG(s.salary) AS avg_current_salary FROM salaries s
WHERE s.to_date = '9999-01-01';

-- 20>
  SELECT MAX(s.salary) AS highest_current_salary FROM salaries s
WHERE s.to_date = '9999-01-01';
 
 -- 21>
  SELECT MIN(s.salary) AS lowest_current_salary FROM salaries s
WHERE s.to_date = '9999-01-01';

-- 22>
SELECT SUM(s.salary) AS total_salary_research FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s  ON de.emp_no = s.emp_no
WHERE d.dept_name = 'Research'
  AND de.to_date = '9999-01-01'
  AND s.to_date  = '9999-01-01';
 


 
 





