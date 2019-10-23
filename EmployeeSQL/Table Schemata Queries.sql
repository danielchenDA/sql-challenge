-- create departments table
CREATE TABLE departments
(
	dept_no VARCHAR UNIQUE NOT NULL,
    dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
)
;

-- display all rows from departments table
SELECT * FROM departments
;

-- create employees table
CREATE TABLE employees
(
    emp_no INT UNIQUE NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
)
;

-- display all rows from employees table
SELECT * FROM employees
;

-- create dept_emp table
CREATE TABLE dept_emp
(
    emp_no INT UNIQUE NOT NULL,
    dept_no VARCHAR UNIQUE NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
)
;

-- display all rows from dept_emp table
SELECT * FROM dept_emp
;

-- create titles table
CREATE TABLE titles
(
    emp_no INT UNIQUE NOT NULL,
    title VARCHAR NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
)
;

-- display all rows from titles table
SELECT * FROM titles
;

-- create salaries table
CREATE TABLE salaries
(
    emp_no INT UNIQUE NOT NULL,
    salary INT NOT NULL CONSTRAINT positive_salary CHECK (salary > 0),
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
)
;

-- display all rows from salaries table
SELECT * FROM salaries
;

-- create dept_manager table
CREATE TABLE dept_manager
(
    dept_no VARCHAR UNIQUE NOT NULL,
    emp_no INT UNIQUE NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
)
;

-- display all rows from dept_manager table
SELECT * FROM dept_manager
;

-- show data directory
SHOW DATA_DIRECTORY
;