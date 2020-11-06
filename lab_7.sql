
select department_name, first_name, last_name, hire_date, salary                     --1
    from employees inner join departments using(department_id) where
        date_part('year', current_date::date) - date_part('year', hire_date::date) > 15
            and employee_id in (select manager_id from employees);


select concat(e.first_name, ' ', e.last_name) as name, d.department_id, d.department_name       --2
    from employees as e inner join departments as d using(department_id);

select concat(e.first_name, ' ', e.last_name) as name, e.job_id, d.department_name, d.department_id   --3
    from employees as e inner join departments as d using(department_id) inner join locations
        as l using(location_id) where d.location_id = 2400;


select e1.employee_id, e1.last_name as Employee, e1.manager_id, e2.last_name as Manager      --4
    from employees as e1 inner join employees as e2 on e1.manager_id = e2.employee_id;


select concat(e1.first_name, ' ', e1.last_name) as name, e1.hire_date                 --5
    from employees as e1 inner join employees as e2 using(employee_id)
        where(select hire_date from employees where last_name = 'Jones') < e1.hire_date;


select department_name, count(*) from employees inner join departments         --6
    using(department_id) group by(department_name);

select e1.employee_id, e1.job_id, current_date::date - e2.hire_date::date as amount_days    --7
    from employees as e1 inner join employees as e2 using(employee_id)
        where e1.department_id = 90;

select department_id, department_name, first_name    --8
    from employees inner join departments using(department_id);