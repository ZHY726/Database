USE employees;

# task1
SElECT salaries.emp_no, first_name, last_name, SUM(salary) 
FROM salaries JOIN employees ON salaries.emp_no = employees.emp_no
GROUP BY salaries.emp_no
ORDER BY MAX(salary) DESC
LIMIT 5;

# task2
SELECT dept_name, COUNT(emp_no)
FROM departments JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
GROUP BY dept_emp.dept_no
ORDER BY COUNT(emp_no)
LIMIT 1;

# task3
SELECT titles.emp_no, first_name, last_name, title 
FROM titles JOIN employees ON titles.emp_no = employees.emp_no
WHERE title LIKE '%senior%';

# task4
SELECT dept_name, MAX(salary), AVG(salary)
FROM departments JOIN dept_emp ON departments.dept_no = dept_emp.dept_no 
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
GROUP BY dept_name
ORDER BY MAX(salary) DESC
LIMIT 1;

# task5
SELECT title, AVG(salary)
FROM titles JOIN salaries ON titles.emp_no = salaries.emp_no
WHERE title LIKE '%senior engineer%'
GROUP BY title;
