-- Tiggrs and events
-- its a block of code that execute automatically whene event takes place
select * 
from employee_demographics;

select *
from employee_salary;

delimiter $$
create trigger employee_insert
	after insert on employee_salary
    for each row
    begin
		insert into employee_demographics (employee_id, first_name, last_name)
        values( new.employee_id, new.first_name, new.last_name);
    end $$
    delimiter ;
    
    insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
    values ('13', 'jean-ralphio', 'saperstein', 'Exntertainment 720 CEO', 1000000, null);
    
    -- events 
    -- kind of similar to trigger a trigger happens when an event takes place
    -- whereas an event takes place when its scheduled
    
    select * 
    from employee_demographics;
    
    delimiter $$
    create event delete_all_retirees
    on schedule every 30 second
    do
    begin
		delete
        from employee_demographics
        where age >= 60;
    end $$
    delimiter ;
    
    show variables like 'event%';