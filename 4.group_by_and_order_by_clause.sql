select *
from employee_demographics;

/* create a groups of rows with the same values */
select gender
from employee_demographics
group by gender;

/* average age of female and male (aggregate functions) */
select gender, AVG(age), max(age), min(age), count(age)
from employee_demographics
group by gender;


/* create unique group of occupation and salary */
select occupation, salary
from employee_salary
group by occupation, salary;

-- ORDER BY --

-- asc order (default order)
select *
from employee_demographics
order by first_name;

-- desc order
select *
from employee_demographics
order by first_name desc;

-- Having vs Where

select gender, avg(age)
from employee_demographics
where avg(age) > 40
group by gender;

select gender, avg(age)
from employee_demographics
group by gender
having avg(age) > 40;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager%' 
group by occupation
having avg(salary) > 75000;


