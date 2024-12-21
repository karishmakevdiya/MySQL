/* display only 3 records from table */

select *
from employee_demographics
limit 3;

/* display only 3 records from table with age in desc order */

select *
from employee_demographics
order by age desc
limit 3;

/* display only 1 record after 2nd row from table with age in desc order */

select *
from employee_demographics
order by age desc
limit 2, 1;

-- Alias (use to change name of column) --

select gender, avg(age) as avg_age
from employee_demographics
group by gender
having avg_age > 40;