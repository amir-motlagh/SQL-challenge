-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.first_name, 
		e.last_name,
		e.sex,
		s.salary
FROM employees as e
INNER JOIN salaries as s
	ON e.emp_no = s.emp_no



-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date between '1/1/1986' and '12/31/1986'
ORDER BY hire_date ASC




-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT
	d.dept_no as department_number,
	d.dept_name as department_name,
	m.emp_no as manager_employee_num,
	e.first_name as manager_first_name,
	e.last_name manager_last_name
FROM departments as d
INNER JOIN dept_manager as m 
    ON m.dept_no = d.dept_no
INNER JOIN employees as e 
    ON m.emp_no = e.emp_no




-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

SELECT e.emp_no as employee_nummber,
		e.last_name as emp_last_name,
		e.first_name as emp_first_name,
		d.dept_name as department_name
		
FROM employees as e

INNER JOIN dept_emp as dn
	ON e.emp_no = dn.emp_no
INNER JOIN departments as d
	ON d.dept_no = dn.dept_no


-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."

SELECT first_name,
		last_name,
		sex
FROM employees
WHERE first_name = 'Hercules' AND 
		last_name like 'B%'


-- 6. List all employees in the Sales department, including 
-- their employee number, last name, first name, and department name.

SELECT  de.emp_no as employee_num,
		e.last_name as emp_last_name,
		e.first_name as emp_first_name,
		d.dept_name as department_name

FROM dept_emp as de
INNER JOIN departments as d
	ON d.dept_no = de.dept_no
INNER JOIN employees as e
	ON de.emp_no = e.emp_no

WHERE d.dept_name = 'Sales'


-- 7. List all employees in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.

SELECT  de.emp_no as employee_num,
		e.last_name as emp_last_name,
		e.first_name as emp_first_name,
		d.dept_name as department_name

FROM dept_emp as de
INNER JOIN departments as d
	ON d.dept_no = de.dept_no
INNER JOIN employees as e
	ON de.emp_no = e.emp_no

WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'



-- 8. List the frequency count of employee last names
-- (i.e., how many employees share each last name) in descending order.

SELECT 	last_name,
		COUNT(last_name) as count
FROM employees
GROUP BY last_name
ORDER BY count DESC



