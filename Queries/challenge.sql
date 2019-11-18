--Challenge
--1) # of titles retiring
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
titles.title,
titles.from_date,
s.salary
INTO titles_info
FROM current_emp as ce
RIGHT JOIN titles
ON (ce.emp_no = titles.emp_no)
INNER JOIN salaries AS s
ON (ce.emp_no = s.emp_no)

-- most recent titles
SELECT COUNT(emp_no), title
INTO title_count
FROM titles_info
GROUP by title
--ORDER by from_date DESC


--2) Mentor
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
e.birth_date,
ti.from_date,
ti.to_date
INTO mentor_info
FROM employees as e
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')

select count(emp_no), title
from mentor_info
group by title
