--Table 1: emp_details including employee number, last name, first name, sex, and salary

SELECT e.emp_no
	,e.last_name
	,e.first_name
	,e.sex
	,s.salary
INTO emp_details
FROM
	employees e
	JOIN salaries s on e.emp_no = s.emp_no

--Table 2: emp_hired_1986 including first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name
	,last_name
	,hire_date
INTO emp_hired_1986
FROM
	employees
WHERE 1=1 AND hire_date >= '1986-01-01'

--Table 3: manager_details including the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT man.dept_no
	,d.dept_name
	,man.emp_no
	,e.last_name
	,e.first_name
INTO manager_details
FROM
	dept_manager man
	JOIN departments d on man.dept_no = d.dept_no
	JOIN employees e on man.emp_no = e.emp_no

--Table 4: dept_details including the department of each employee with the following information: employee number, last name, first name, and department name

SELECT e.emp_no
	,e.last_name
 	,e.first_name
 	,de.dept_no
	,d.dept_name
INTO dept_details
FROM
 	employees e
 	JOIN dept_emp de on e.emp_no = de.emp_no
	JOIN departments d on de.dept_no = d.dept_no;

ALTER TABLE dept_details DROP dept_no;

--Table 5: hercules_b_list including first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name
	,last_name
	,sex
INTO hercules_b_list
FROM emp_details
WHERE 1=1 AND first_name = 'Hercules'
			AND last_name ilike 'B%'

--Table 6: sales_dept including all employees in the Sales department, including their employee number, last name, first name, and department name

SELECT *
INTO sales_dept
FROM dept_details
WHERE dept_name = 'Sales'

--Table 7: sales_dev_depts including all employees in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT *
INTO sales_dev_depts
FROM dept_details
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--Table 8: emp_last_name_count including how many employees share each last name in descending order

SELECT 
	last_name
	,count(last_name) AS frequency_count
INTO emp_last_name_count
FROM employees
GROUP BY 1
ORDER BY frequency_count DESC

