-- Unions (combines rows togather) --

/* using union remove all the duplicates with distinct  */
select first_name, last_name
from employee_demographics
union distinct
select first_name, last_name
from employee_salary
;

/* using union all we list all the results with duplicates   */
select first_name, last_name
from employee_demographics
union all
select first_name, last_name
from employee_salary
;



select first_name, last_name, 'old Man' as label
from employee_demographics
where age > 40 AND gender = 'Male'
union
select first_name, last_name, 'old Lady' as label
from employee_demographics
where age > 40 AND gender = 'Female'
union
select first_name, last_name, 'highly paid emp' as label
from employee_salary
where salary > 70000
order by first_name, last_name
;

