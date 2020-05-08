-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;




-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;


--Using Alias

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

--Using Alias and exporting to table
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_employee as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_employee as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;




SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

copy (SELECT * FROM emp_info) to 'C:\tmp\persons_client.csv' with csv


copy (SELECT * FROM emp_info) to 'C:\Users\dritter\Berkeley\Pewlett-Hackard-Analysis\Queries\emp_info.csv' with csv


SELECT e.emp_no,
	e.first_name,
e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');


SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name	
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_employee AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);


SELECT e.emp_no,
	e.first_name,
e.last_name,
d.







-- CHALLENGE SKILL DRILL
-- Create a query that will return only the information relevant to the Sales team. The requested list includes:

-- Employee numbers
-- Employee first name
-- Employee last name
-- Employee department name

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name,
	de.dept_no
FROM employees as e
LEFT JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
on (d.dept_no = de.dept_no)
WHERE (d.dept_name = 'Sales')



-- Create a query that will return only the information relevant to the Sales team. The requested list includes:

-- Employee numbers
-- Employee first name
-- Employee last name
-- Employee department name



SELECT e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name,
	de.dept_no
FROM employees as e
LEFT JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
on (d.dept_no = de.dept_no)
WHERE (d.dept_name IN ('Sales', 'Development'))


-- Challenge 1
SELECT r.emp_no,
	r.first_name,
	r.last_name,
	t.title,
	t.from_date,
    s.salary
FROM retirement_info as r
INNER JOIN titles as t
ON (r.emp_no = t.emp_no)
INNER JOIN salaries as s
on (r.emp_no = s.emp_no)


-- Challenge 2

SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO challenge2
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')