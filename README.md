# Pewlett-Hackard-Analysis

## Challenge:  Analysis Report

Our assignment was to complete data analysis for Pewlett-Hackard to identify how many roles needed to be filled as the “silver tsunami” begins to make an impact. The analysis was to query and quantify employees that are retirement-ready so management can begin to plan for positions that they will need to fill.  Additionally, analyze the current employee database to compile a list of eligible employees to participate in the mentorship program.  These employees to have a date of birth that falls between January 1, 1965 and December 31, 1965. 

To create the retirement-ready employees, we joined and queried the database to identify personnel that were born between 1952 and 1955.  Various data is stored in different database tables, so we had to join and summarize the data with the following queries:

### Table 1:  Number of Retiring Employees by Title
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

### Table 2:  Mentorship Eligibility
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


Overall, there are 41,381 retirement ready employees and only 1,940 employees ready to be involved in the mentorship program.  We recommend further analysis be completed to expand the mentorship program to allow for a larger sample size to backfill the opening positions.  In addition, diving into the data further would summarize the availability and retirement-ready employees by department to identify specific department needs.


### ERD

![ERD](https://github.com/dougacct814/Pewlett-Hackard-Analysis/blob/master/EmployeeDB.png)

