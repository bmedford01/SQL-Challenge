-- Create titles table
-- All importing of csv's done via the import/export function in pgAdmin, thus no code
CREATE TABLE Title (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_Title PRIMARY KEY (title_id)
);

SELECT *
FROM Title

-- Create employees table
CREATE TABLE Employee (
    emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
    first_name VARCHAR   NOT NULL,
	last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
	CONSTRAINT pk_Employee PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES Title(title_id)
);

SELECT * 
FROM Employee

-- create salaries table
CREATE TABLE Salaries (
    emp_no int,
    salary int NOT NULL,
	CONSTRAINT pk_Salaries PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES Employee(emp_no)
);

SELECT * 
FROM salaries

-- create department table
CREATE TABLE department (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (dept_no)
);

SELECT *
FROM department

-- create department manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no int   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

SELECT * 
FROM dept_manager

-- create department employee table
CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
	dept_no VARCHAR   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

SELECT * 
FROM dept_emp
