CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_name) VALUES
('Analytics'), ('Marketing'), ('Finance'), ('IT');

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    dept_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees (name, age, dept_id, salary) VALUES
('Dev', 21, 1, 50000),
('Pavni', 12, 2, 45000),
('Amit', 28, 3, 60000),
('Sara', 24, 4, 55000);

SELECT * FROM departments;

SELECT * FROM employees;

SELECT *
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id;

SELECT employees.name, employees.salary, departments.dept_name
FROM employees
LEFT JOIN departments ON employees.dept_id = departments.dept_id;
SELECT employees.name, employees.salary, departments.dept_name
FROM employees
RIGHT JOIN departments ON employees.dept_id = departments.dept_id;

SELECT departments.dept_name, sum(employees.salary) as "Total Salary"
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id
GROUP BY departments.dept_name;

SELECT departments.dept_name, COUNT(employees.emp_id) as "Employee_num"
FROM employees
INNER JOIN departments ON employees.dept_id = departments.dept_id
GROUP BY departments.dept_name;