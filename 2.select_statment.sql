/* select/list all the data from specific table */
select * 
from employee_demographics;

/* select/list data of specific table from database */
select * 
from parks_and_recreation.employee_demographics;

/* select/list data of specific column of table  */
select first_name 
from parks_and_recreation.employee_demographics;

/* select/list data of MULTIPLE columnS of table  */
select first_name,
last_name,
birth_date,
age 
from parks_and_recreation.employee_demographics;

/* select/list data of MULTIPLE columnS of table  */
select first_name,
last_name,
birth_date,
age,
age + 10
from parks_and_recreation.employee_demographics;

# PEMDAS stands for order of operations in math (Parentheses, Exponents, Multiplication, Division, Addition, Subtraction )

/* select/list calculated data of column with PEMDAS  */
select first_name,
last_name,
birth_date,
age,
(age + 10) * 10 + 10
from parks_and_recreation.employee_demographics;

# DISTINCT (use to select unique values from table)

/* select all the unique name from column first_name  */

select distinct first_name
from parks_and_recreation.employee_demographics;

/* select all the unique gender from column */

select distinct gender
from parks_and_recreation.employee_demographics;

/* select all the unique combinations of columns gender and first_name */

select distinct first_name, gender
from parks_and_recreation.employee_demographics;
