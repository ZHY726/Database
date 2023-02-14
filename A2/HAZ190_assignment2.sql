USE employees;

# task1
SElECT salaries.emp_no AS 'Employee number', first_name AS 'First Name', last_name AS 'Last Name', MAX(salary) AS 'Highest Salary'
FROM salaries JOIN employees ON salaries.emp_no = employees.emp_no
GROUP BY salaries.emp_no
ORDER BY MAX(salary) DESC
LIMIT 5;

# task2
SELECT dept_name AS 'Department name', COUNT(emp_no) AS 'Count of employees'
FROM departments JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
GROUP BY dept_emp.dept_no
ORDER BY COUNT(emp_no)
LIMIT 1;

# task3
SELECT titles.emp_no AS 'Employee number', first_name AS 'First name', last_name AS 'Last name', title AS 'Title'
FROM titles JOIN employees ON titles.emp_no = employees.emp_no
WHERE title LIKE '%senior%';

# task4
SELECT dept_name AS 'Department name', MAX(salary) AS 'Highest maximum salary', AVG(salary) AS 'Highest average salary'
FROM departments JOIN dept_emp ON departments.dept_no = dept_emp.dept_no 
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
GROUP BY dept_name
ORDER BY MAX(salary) DESC
LIMIT 1;

# task5
SELECT title AS 'Title', AVG(salary) AS 'Average salary'
FROM titles JOIN salaries ON titles.emp_no = salaries.emp_no
WHERE title LIKE '%senior engineer%'
GROUP BY title;
