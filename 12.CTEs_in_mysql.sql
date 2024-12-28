-- CTEs (stands for common table expression and allows to define subquery block that you can reference within the main query)
-- use to perform more advanced calculations which we can not do just within one query

 /* way to define cte */
with CTE_example as
(select gender, avg(salary)avg_sal, max(salary) max_sal, 
min(salary) min_sal, count(salary) count_sal
from employee_demographics dem 
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal)
from CTE_example
;
 -- same subquery as cte
select avg(avg_sal)
from (select gender, avg(salary)avg_sal, max(salary) max_sal, 
min(salary) min_sal, count(salary) count_sal
from employee_demographics dem 
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
) example_subquery
;

-- multiple ctes


with CTE_example as
(select employee_id, gender, birth_date
from employee_demographics
where birth_date > '1985-01-01'
),
CTE_Example2 as
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select *
from CTE_example
join CTE_Example2
	on CTE_example.employee_id = CTE_Example2.employee_id
;