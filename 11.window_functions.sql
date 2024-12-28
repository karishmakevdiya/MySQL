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
    
    
    select dem.first_name, dem.last_name,gender, salary,
    sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics dem 
join employee_salary sal
	on dem.employee_id = sal.employee_id
    ;
    
    -- row_number is aggregate function
       select dem.first_name, dem.employee_id, dem.last_name,gender, salary,
    row_number() over(partition by gender order by salary desc) as row_num,
    rank() over(partition by gender order by salary desc) as rank_num,
    dense_rank() over(partition by gender order by salary desc) as dense_rank_num
from employee_demographics dem 
join employee_salary sal
	on dem.employee_id = sal.employee_id
    ;