-----DATA ANALYSIS QUERIES---------------------------------------------- 
--1:LIST THE FOLLOWING DETAILS OF EACH EMPLOYEE: employee number, last name, first name ,gender,and salary.

SELECT employees.emp_no, employees.last_name , employees.first_name,employees.gender ,salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no= salaries.emp_no;

--2:LIST EMPLOYEES WHO WERE HIRED IN 1986.
SELECT first_name ,last_name ,hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'


--3:LIST THE MANAGER OF EACH DEPARTMENT WITH THE FOLLOWING INFORMATION: DEPARTMENT NUMBER, DEPARTMENT NAME, THE MANAGER'S EMPLOYEE NUMBER, LAST NAME, FIRST NAME, AND START AND END EMPLOYMENT DATES.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM departments
JOIN dept_manager
ON departments.dept_no= dept_manager.dept_no
JOIN employees 
ON dept_manager.emp_no=employees.emp_no

--4:LIST THE DEPARTMENT OF EACH EMPLOYEE WITH THE FOLLOWING INFORMATION: EMPLOYEE NUMBER , LAST NAME, FIRST NAME ,AND DEPARTMENT NAME.
SELECT dept_emp.emp_no, employees.last_name,employees.first_name,departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no=employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no


--5.LIST ALL EMPLOYEES WHOSE FIRST NAME IS "HERCULES" AND LAST NAMES BEGIN WITH "B."
SELECT first_name,last_name
FROM employees
WHERE first_name= 'Hercules'
AND last_name LIKE 'B%';

--6.LIST ALL EMPLOYEES IN THE SALES DEPARTMENT, INCLUDING THEIR EMPLOYEE NUMBER ,LAST NAME ,FIRST NAME, AND DEPARTMENT NAME.
SELECT dept_emp.emp_no,employees.last_name, employees.first_name,departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no=employees.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name= 'Sales';


--7.LIST ALL EMPLOYEES IN THE SALES AND DEVELOPMENT DEPARTMENTS, INCLUDING THEIR EMPLOYEE NUMBER, LAST NAME, FIRST NAME, AND DEPARTMENT NAME.
SELECT dept_emp.emp_no,employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no=employees.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales'
OR departments.dept_name='Development'

--8.IN DESCENDING ORDER, LIST THE FREQUENCY COUNT OF EMPLOYEE LAST NAMES, 1.E., HOW MANY EMPLOYEES SHARE EACH LAST NAME.

SELECT last_name,
COUNT (last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY 
COUNT(last_name) DESC
---------------------------------------------------------------------------------

