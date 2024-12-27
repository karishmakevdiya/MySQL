-- string functions (these are the inbuilt function in mysql) --
select length('skyfall');

select first_name, length(first_name)
from employee_demographics
order by 2;


/*uppercase*/
select upper('sky');
/*lowercase*/
select lower('SKY');

select first_name, upper(first_name) as uppercase
from employee_demographics;

-- trim (to trim or remove whitespace) --

select trim('   sky  ') as trim;
select ltrim('   sky  ') as ltrim;
select rtrim('   sky  ') as rtrim;

/*substring*/

/* showing 4 character from left  and right and from any position*/
select first_name, 
left(first_name, 4),
right(first_name, 4),
substring(first_name, 3,2),
birth_date,
substring(birth_date, 6,2) as borth_month
from employee_demographics;

/*replace ( replace with different char)*/

select first_name, replace(first_name, 'a', 'z')
from employee_demographics;


/* locate (find the location or char)*/
select locate('x','Alexander');
select first_name, locate('An', first_name)
from employee_demographics;

/*concat to combine values*/

select first_name, last_name,
concat(first_name, ' ',last_name) as full_name
from employee_demographics;
