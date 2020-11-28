create table quiz_tbl(    --1
    location_id numeric(4, 0),
    street_address varchar(40),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(25),
    country_id varchar(2),
    region_id integer
);

alter table quiz_tbl              --2
    alter column country_id type text,
    drop column if exists name;

--3 uploading data;


update department set                          --4
    description=format('The %s department located in %s', dept_name, location);



select city, count(city) as "works here" from employees group by (city)           --5 b
union select city, count(city) as "works here" from customers group by (city);

select * from employees         --6
where department = 37 and (lastname like '%s%' or lastname like '%n%'
        or lastname like 'S%' or lastname like 'N%'
                or name like 'R%' or name like '%r%');

select name from employees         --7
 union distinct select name from customers;

select * from departments where code % 7 = 0 or code % 9 = 0;  --8


select * from customers                     --9
where name like 'E%' and name like '%a_';









