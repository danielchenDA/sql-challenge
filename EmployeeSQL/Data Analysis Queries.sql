-- List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY e.emp_no ASC
;

-- List employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE CAST(hire_date AS VARCHAR) LIKE '1986%'
;

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

SELECT 
d.dept_no,
d.dept_name,
dm.emp_no,
e.last_name,
e.first_name,
dm.from_date,
dm.to_date
FROM departments d
INNER JOIN dept_manager dm ON d.dept_no = dm.dept_no 
INNER JOIN employees e ON dm.emp_no = e.emp_no
;

-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.

SELECT 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
;

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT last_name, first_name
FROM employees 
WHERE (first_name = 'Hercules') AND (last_name LIKE 'B%')
;

-- List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
;

-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
;


--SELECT * FROM dept_emp

--SELECT * FROM employees

--SELECT * FROM departments


-- In descending order, list the frequency count of employee last names, i.e., how many employees 
-- share each last name.

SELECT last_name, count(last_name) AS "Unique Last Name"
FROM employees
GROUP BY last_name
ORDER BY last_name DESC