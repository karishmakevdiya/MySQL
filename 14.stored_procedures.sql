-- stored procedures
-- helpfull to store complex query simplify repitative code and enhance performance

select * 
from employee_salary
where salary >= 50000
;


create procedure large_salaries()
select * 
from employee_salary
where salary >= 50000
;

call large_salaries();

DELIMITER $$
create procedure large_salaries2()
BEGIN
select * 
from employee_salary
where salary >= 50000;
select * 
from employee_salary
where salary >= 10000;
END $$
DELIMITER ;


DELIMITER $$
create procedure large_salaries3()
BEGIN
select * 
from employee_salary
where salary >= 50000;
select * 
from employee_salary
where salary >= 10000;
END $$
DELIMITER ;

call large_salaries3();

DELIMITER $$
create procedure large_salaries3()
BEGIN
select * 
from employee_salary
where salary >= 50000;
select * 
from employee_salary
where salary >= 10000;
END $$
DELIMITER ;

-- parameters

DELIMITER $$
create procedure large_salaries4(empId int)
BEGIN
select salary
from employee_salary
where employee_id = empId;
END $$
DELIMITER ;


call large_salaries4(1)

