use  employees;
-- 1 
SELECT gender, COUNT(*)  FROM employees
GROUP BY gender;

-- 2
SELECT d.dept_name, COUNT(de.emp_no) AS total_employees FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
GROUP BY d.dept_name;
 
 -- 3
SELECT d.dept_name, AVG(s.salary) AS avg_salary FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date  = '9999-01-01'
GROUP BY d.dept_name;

-- 4
 SELECT t.title, MAX(s.salary) AS max_salary FROM titles t
JOIN salaries s ON t.emp_no = s.emp_no
GROUP BY t.title;

-- 5
 SELECT d.dept_name, COUNT(de.emp_no) AS total_employees
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
GROUP BY d.dept_name
HAVING COUNT(de.emp_no) > 20000;

-- 6
 SELECT t.title, AVG(s.salary) AS avg_salary FROM titles t
JOIN salaries s ON t.emp_no = s.emp_no
GROUP BY t.title
HAVING AVG(s.salary) > 60000;

-- 7
SELECT d.dept_name, MAX(s.salary) AS max_salary FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date  = '9999-01-01'
GROUP BY d.dept_name
HAVING MAX(s.salary) > 100000;

-- 8
 SELECT t.title, MIN(s.salary) AS min_salary FROM titles t
JOIN salaries s ON t.emp_no = s.emp_no
WHERE t.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
GROUP BY t.title;

-- 9
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS total_employees FROM employees
GROUP BY YEAR(hire_date);

-- 10
 SELECT title, COUNT(emp_no) AS total_employees FROM titles
WHERE to_date = '9999-01-01'
GROUP BY title;

-- 11
 SELECT emp_no, first_name, last_name FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE salary > (
        SELECT AVG(salary)
        FROM salaries
        WHERE to_date = '9999-01-01'
    )
    AND to_date = '9999-01-01'
);

-- 12
 SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM salaries
    WHERE salary = (
        SELECT MAX(salary)
        FROM salaries
        WHERE to_date = '9999-01-01'
    )
    AND to_date = '9999-01-01'
);

-- 13
SELECT DISTINCT d.dept_name FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
  AND s.salary > 90000;
  
  -- 14
  SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date = '9999-01-01'
);

-- 15
SELECT first_name, last_name FROM employees
WHERE emp_no NOT IN (
    SELECT emp_no
    FROM dept_manager
);





 






