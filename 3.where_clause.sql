-- where clause with comparison operators 

# where is used to return specific condition

/* return all the records with first_name 'Leslie' */

# comparison operator '='

select * 
from employee_salary
where first_name = 'Leslie';

# comparison operator '>'

select * 
from employee_salary
where salary > 50000;

select * 
from employee_salary
where salary >= 50000;

# comparison operator '<'

select * 
from employee_salary
where salary < 50000;

select * 
from employee_salary
where salary <= 50000;

#  operator '!'

select * 
from employee_demographics
where gender != 'Female';

select * 
from employee_demographics
where birth_date > '1985-01-01';

-- A Logical operators -- AND OR NOT
	
/* return data if both conditions are true */
select * 
from employee_demographics
where birth_date > '1985-01-01' 
AND gender = 'male';

/* return data if any one condition is true */
select * 
from employee_demographics
where birth_date > '1985-01-01' 
OR gender = 'male';

/* return data if any one condition is true */
select * 
from employee_demographics
where birth_date > '1985-01-01' 
OR NOT gender = 'male';

#PEMDAS with where clause

select * 
from employee_demographics
where (first_name > 'Leslie' 
AND age = 44) OR age > 55;

-- Like statment -- to find specific pattern
-- %(anything) and _(specific value)

select * 
from employee_demographics
where first_name LIKE 'Jer%'
;

select * 
from employee_demographics
where first_name LIKE '%Jer%'
;
/* anything before and after a */
select * 
from employee_demographics
where first_name LIKE '%a%'
;

/* start with 'a' and two character after it no more no less */
select * 
from employee_demographics
where first_name LIKE 'a__'
;

/* start with 'a' and three character after it and anything after that */
select * 
from employee_demographics
where first_name LIKE 'a___&'
;

select * 
from employee_demographics
where birth_date LIKE '1989%'
;
