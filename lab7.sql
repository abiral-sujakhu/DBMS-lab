use employees;

-- 1
SELECT e.first_name, e.last_name, d.dept_name FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;
 
-- 2 
 SELECT e.first_name, e.last_name, d.dept_name FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no;

-- 3
 SELECT d.dept_name, SUM(s.salary) AS total_salary FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE s.to_date='9999-01-01'
GROUP BY d.dept_name;

-- 4
SELECT e.first_name, e.last_name, s.salary FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE s.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'
  AND s.salary >
      (SELECT AVG(s2.salary)
       FROM salaries s2
       JOIN dept_emp de2 ON s2.emp_no = de2.emp_no
       WHERE s2.to_date = '9999-01-01'
         AND de2.to_date = '9999-01-01'
         AND de2.dept_no = de.dept_no)
limit 5;

-- 5
 SELECT e.first_name, e.last_name FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
WHERE t.to_date = '9999-01-01'
  AND t.title =
      (SELECT t2.title
       FROM employees e2
       JOIN titles t2 ON e2.emp_no = t2.emp_no
       WHERE e2.first_name = 'Georgi'
         AND t2.to_date = '9999-01-01'
       LIMIT 1)
LIMIT 100;

-- 6
CREATE VIEW emp_detailss AS
SELECT e.first_name, e.last_name, t.title, s.salary
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
JOIN salaries s ON e.emp_no = s.emp_no;

-- 7 
UPDATE salaries s
JOIN dept_emp de ON s.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
SET s.salary = s.salary * 1.10
WHERE d.dept_name = 'Sales'
  AND s.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01';

-- 8
SELECT e.first_name, e.last_name FROM employees e
LEFT JOIN dept_emp de 
  ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
WHERE de.emp_no IS NULL;

-- 9 
SELECT e.first_name, e.last_name, s.salary,
CASE
    WHEN s.salary >= 80000 THEN 'High'
    WHEN s.salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END AS salary_level
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';

-- 10
SELECT d.dept_name, SUM(s.salary) AS total_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY total_salary DESC
LIMIT 1;

-- 11
CREATE VIEW dept_avg_salary AS
SELECT d.dept_name, AVG(s.salary) AS avg_salary -- here just the select query is saved, not executed
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
GROUP BY d.dept_name;

SELECT * FROM dept_avg_salary  --  to see output of view 
LIMIT 2;

-- 13
 SELECT d.dept_name, MAX(s.salary) AS second_highest_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
  AND s.salary <
      (SELECT MAX(s2.salary)
       FROM salaries s2
       JOIN dept_emp de2 ON s2.emp_no = de2.emp_no
       WHERE s2.to_date = '9999-01-01'
         AND de2.dept_no = d.dept_no)
GROUP BY d.dept_name
LIMIT 5;

-- 14
CREATE VIEW emp_after_2018 AS
SELECT *
FROM employees
WHERE hire_date > '2018-12-31';

-- 15
 DELETE FROM employees
WHERE emp_no NOT IN
      (SELECT emp_no FROM dept_emp);

 


 
 
 
 






