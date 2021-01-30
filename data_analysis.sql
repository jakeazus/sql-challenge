-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no

-- List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.first_name,
employees.last_name,
employees.hire_date
FROM employees
WHERE DATE_PART('year', hire_date) = 1986

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no,
departments.dept_name, 
department_manager.emp_no,
employees.last_name,
employees.first_name
FROM departments
INNER JOIN department_manager
ON departments.dept_no = department_manager.dept_no
INNER JOIN employees
ON department_manager.emp_no  = employees.emp_no

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.last_name,
employees.first_name,
departments.dept_name,
department_employee.emp_no
FROM departments
INNER JOIN department_employee
ON departments.dept_no = department_employee.dept_no
INNER JOIN employees
ON department_employee.emp_no = employees.emp_no

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, 
employees.last_name, 
employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name like 'B%'


-- List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT employees.first_name,
employees.last_name, 
departments.dept_name,
department_employee.emp_no
FROM departments
INNER JOIN department_employee 
ON departments.dept_no = department_employee.dept_no
INNER JOIN employees
ON department_employee.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales'


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.first_name,
employees.last_name,
departments.dept_name, 
department_employee.emp_no
FROM departments 
INNER JOIN department_employee 
ON departments.dept_no = department_employee.dept_no
INNER JOIN employees
ON department_employee.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT employees.last_name, count(employees.last_name)
FROM employees
GROUP BY employees.last_name
ORDER BY COUNT(employees.last_name) DESC 




