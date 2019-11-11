--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees 
ON employees.emp_no = salaries.emp_no;

--2. List employees who were hired in 1986.
SELECT first_name
FROM employees
WHERE hire_date LIKE '1986%'; 

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments AS d, dept_manager AS m, employees AS e
WHERE m.dept_no = d.dept_no AND e.emp_no = m.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e, dept_emp, departments AS dp
WHERE e.emp_no = dept_emp.emp_no AND dp.dept_no = dept_emp.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e, dept_emp, departments AS dp
WHERE e.emp_no = dept_emp.emp_no
AND dp.dept_no = dept_emp.dept_no
AND dp.dept_name LIKE 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e, dept_emp, departments AS dp
WHERE e.emp_no = dept_emp.emp_no
AND dp.dept_no = dept_emp.dept_no
AND dp.dept_name LIKE 'Sales' 
OR dp.dept_name LIKE 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS frequencySharedLastName
FROM employees
GROUP BY last_name
ORDER BY frequencySharedLastName DESC;