

select e.first_name, e.last_name from employees as e inner join employees as e2 on e2.EMPLOYEE_ID = e.manager_id  --1
    inner join departments d on e2.department_id = d.department_id inner join
        locations on d.location_id = locations.location_id
            where locations.country_id = 'US';


select avg(e.salary), count(e.employee_id), d.department_name  --2
    from departments d inner join employees e on d.department_id = e.department_id
        group by d.department_id, department_name;



select count(distinct e.job_id) as j_cnt, count(e.first_name) as name_amount, l.location_id      --3
    from employees e join departments d on e.department_id = d.department_id
         join locations l on d.location_id = l.location_id group by l.location_id;

select first_name from employees group by employees.department_id, first_name   --4
    having department_id = (select d.department_id from employees inner join
        departments d on d.department_id = employees.department_id group by d.department_id
            order by avg(salary) desc limit 1 offset 2);

