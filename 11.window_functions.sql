/* window functions (like group by but they dont roll everything up into one row
 whene grouping window functions allow us to look at a partition or a group but they each keep their own unique rows
 in the output. */

select dem.first_name, dem.last_name, gender, avg(salary) as avg_salary
from employee_demographics dem 
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by dem.first_name, dem.last_name, gender
;

select dem.first_name, dem.last_name,gender, avg(salary) over(partition by gender)
from employee_demographics dem 
join employee_salary sal
	on dem.employee_id = sal.employee_id
    ;
    
    
    select dem.first_name, dem.last_name,gender, sum(salary) over(partition by gender)
from employee_demographics dem 
join employee_salary sal
	on dem.employee_id = sal.employee_id
    ;