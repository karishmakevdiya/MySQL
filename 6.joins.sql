-- joins (join two tables or more )--

select * 
from employee_demographics;

select * 
from employee_salary;

--- inner join --

/*return column which is same in both table*/
select * 
from employee_demographics
inner join employee_salary
on employee_demographics.employee_id = employee_salary.employee_id
;
/* above query with alias to reduce length of query */
select * 
from employee_demographics as ed
inner join employee_salary as es
on ed.employee_id = es.employee_id
;

/* select columns from both the table with join (employee 
_id is in both the table so we seperate it by giving alias of the table)*/

select ed.employee_id, age, occupation
from employee_demographics as ed
inner join employee_salary as es
on ed.employee_id = es.employee_id
;

--- outer join ---

/*left and right outer join*/

/* left join select everything from the left table even if there is no match in the join
 and only return the matches from right table */
 
select *
from employee_demographics as ed
left join employee_salary as es
on ed.employee_id = es.employee_id
;

/* right join select everything from the right table even if there is no match in the join
 and only return the matches from left table */
 
select *
from employee_demographics as ed
right join employee_salary as es
on ed.employee_id = es.employee_id
;


-- self join --

/*self join to tie the table with it self*/

select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
 emp2.employee_id as emp_name,
emp2.first_name as first_name,
emp2.last_name as last_name
from employee_salary emp1
join employee_salary emp2
 on emp1.employee_id + 1 = emp2.employee_id ;
 
 -- joinning multiple tables togather --
 
select *
from employee_demographics as ed
inner join employee_salary as es
on ed.employee_id = es.employee_id
inner join parks_departments as pd
on es.dept_id = pd.department_id
;

select * 
from parks_departments;
