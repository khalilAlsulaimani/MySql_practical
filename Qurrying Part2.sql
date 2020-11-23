select employee_id,office_id from employees  where office_id=2;

select salary as top_employee_salarys ,first_name from employees where salary between 1000 and 9000;

select  job_title ,o.office_id from employees e, offices o where e.office_id = o.office_id;