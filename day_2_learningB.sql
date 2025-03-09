-- UNIONS

SELECT first_name, last_name 
FROM employee_demographics
UNION -- Distinct by default
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name 
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'Old Lady' AS 'Label'
FROM employee_demographics
WHERE age > 40 And gender = 'Female'
UNION
SELECT first_name, last_name, 'Old Man' AS 'Label'
FROM employee_demographics
WHERE age > 40 And gender = 'Male'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS 'Label'
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;

-- STRING FUNCTIONs

select length('rainbow');

select first_name, length(first_name)
from employee_demographics
order by 2;

select upper('penguin');
select lower('penguin');

select first_name, upper(first_name)
from employee_demographics
order by 2;

select trim('      penguin         ');

select first_name,
left(first_name, 3),
right(first_name, 3),
substring(first_name, 3,2),
birth_date,
substring(birth_date,6,2) as 'birth_month'
from employee_demographics;

select first_name, replace(first_name, 'e', 'u')
from employee_demographics;

select locate('i', 'Dwivedi');

select first_name, locate('An',first_name)
from employee_demographics;

select first_name, last_name, concat(first_name, ' ', last_name) as 'full name'
from employee_demographics;

-- Case Statements
select first_name, 
last_name,
age,
case
	when age <= 30 then 'young'
    when age between 31 and 50 then 'old'
    when age >= 50 then 'on death"s door'
end as 'cases'
from employee_demographics;

-- pay increase and bonus
-- < 50000 = 5%, > 50000 = 7%, finance = 10% bonus

select first_name, last_name, salary,
case
	when salary < 50000 then salary + (salary * 0.05)
    when salary > 50000 then salary + (salary * 0.07)
end as new_salary,
case
	when dept_id = 6 then salary + (salary * 0.10)
end as 'bonus'
from employee_salary;