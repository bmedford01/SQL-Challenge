--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salaries.salary
FROM employee
JOIN salaries ON
employee.emp_no=salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employee.first_name, employee.last_name, employee.hire_date
FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, department.dept_name, dept_manager.emp_no, employee.last_name, employee.first_name
FROM dept_manager
   INNER JOIN department ON dept_manager.dept_no = department.dept_no
   INNER JOIN employee ON dept_manager.emp_no = employee.emp_no;
   
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM employee
   INNER JOIN dept_emp ON employee.emp_no = dept_emp.emp_no
   INNER JOIN department ON dept_emp.dept_no = department.dept_no
   
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employee.first_name, employee.last_name, employee.sex
FROM employee
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM employee
   INNER JOIN dept_emp ON employee.emp_no = dept_emp.emp_no
   INNER JOIN department ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM employee
	INNER JOIN dept_emp ON employee.emp_no = dept_emp.emp_no
	INNER JOIN department ON dept_emp.dept_no = department.dept_no
	WHERE department.dept_name = 'Sales' or department.dept_name = 'Development';
	
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employee.last_name, COUNT(employee.last_name) AS count_last_names
FROM employee
GROUP BY employee.last_name
HAVING COUNT(employee.last_name ) >1
ORDER BY count_last_names DESC;