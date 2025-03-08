-- BEGINER (where, and, or, like, group by, avg, min, max, order by, having vs where, limit, aliasing)
-- where
select * 
from parks_and_recreation.employee_salary
where first_name = "Ann";

select * 
from parks_and_recreation.employee_salary
where salary >= 50000;

select * 
from parks_and_recreation.employee_demographics
where gender = 'female';


-- logical operator And, Or
select *
from parks_and_recreation.employee_demographics
where age < 30 or gender = 'female';


-- Like
select *
from parks_and_recreation.employee_demographics
where first_name like '__m' and last_name like '%or_';

-- group by, avg, min, max
select gender
from parks_and_recreation.employee_demographics
group by gender;

select gender, avg(age), min(age), max(age), count(age)
from parks_and_recreation.employee_demographics
group by gender;

-- order by
select *
from parks_and_recreation.employee_demographics
order by gender, age;

select *
from parks_and_recreation.employee_demographics
order by 5, 4;

-- having, where
select gender, avg(age)
from parks_and_recreation.employee_demographics 
group by gender
having avg(age) > 40;

select occupation, salary from employee_salary
where occupation like '%manager%'
group by occupation, salary
having avg(salary) > 75000;


-- Limit
select * from employee_demographics
order by age desc
limit 3;

select * from employee_demographics
order by age desc
limit 5,1;

-- Aliasing
select gender, avg(age) as avg_age from employee_demographics
group by gender
having avg_age > 40;

-- INTERMIDIATE ()
-- Joins (By default Joins are Inner Joins)
select * from employee_demographics;

select * from employee_salary;

select dem.employee_id, dem.age, sal.occupation
from employee_demographics as dem
inner join employee_salary as sal
	ON dem.employee_id = sal.employee_id;
    
-- Outer Joins (left and right joins)
select *
from employee_demographics as dem
right join employee_salary as sal
	ON dem.employee_id = sal.employee_id;
    
-- Self Join
select * 
from employee_salary;

-- joining multiple tables together
select * 
from employee_demographics as dem
right join employee_salary as sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id;