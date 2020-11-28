create database lab9;   --1

create table salesman(                  --2
    salesman_id integer,
    name text,
    city text,
    commission real
);
insert into salesman values
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5003, 'Lauson Hen', ' ', 0.12),
    (5007, 'Paul Adam', 'Rome', 0.13);

create table customers(
    customer_id integer,
    cust_name text,
    city text,
    grade integer,
    salesman_id integer
);
insert into customers values
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3001, 'Brad Guzan', 'London', null, 5005),
    (3004, 'Fabian Johns', 'Paris', 300, 5006),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3009, 'Geoff Camero', 'Berlin', 100, 5003),
    (3008, 'Julian Green', 'London', 300, 5002);

create table orders(
    ord_no integer,
    purch_amt real,
    ord_date date,
    customer_id integer,
    salesman_id integer
);
insert into orders values
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001);

create role junior_dev login;   --3

create view New_Yorker as select * from salesman where city = 'New York';     --4

create view order_info as select o.ord_no, c.cust_name, s.name             --5
  from (orders o inner join customers c USING (customer_id, salesman_id)) inner join salesman s USING (salesman_id);

grant all privileges on order_info to junior_dev;

create view highest_grade as select * from customers where              --6
     grade = (select grade from customers order by grade desc limit 1);

grant select on highest_grade to junior_dev;

create view sales_city as select city, count(*)       --7
  from salesman group by city;

create view more_salesman as select * from salesman as s         --8
    where 1 < (select count(customer_id) from customers as c where s.salesman_id = c.salesman_id);

create role intern;          --9

grant junior_dev to intern;




