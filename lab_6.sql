create database lab6;       --1

create table customers(           --2
    customer_id integer,
    cust_name varchar(255),
    city varchar(255),
    grade integer,
    salesman_id integer
);

create table orders(
    ord_no integer,
    purch_amt double precision,
    ord_date date,
    customer_id integer,
    salesman_id integer
);

insert into customers(customer_id, cust_name, city, grade, salesman_id)
values(3002, 'Nick Rimando', 'New York', 100, 5001);
insert into customers(customer_id, cust_name, city, grade, salesman_id)
values(3005, 'Graham Zusi', 'California', 200, 5002);
insert into customers(customer_id, cust_name, city, grade, salesman_id)
values(3001, 'Brad Guzan', 'London', null, 5005);
insert into customers(customer_id, cust_name, city, grade, salesman_id)
values(3004, 'Fabian Johns', 'Paris', 300, 5006);
insert into customers(customer_id, cust_name, city, grade, salesman_id)
values(3007, 'Brad Davis', 'New York', 200, 5001);
insert into customers(customer_id, cust_name, city, grade, salesman_id)
values(3009, 'Geoff Camero', 'Berlin', 100, 5003);
insert into customers(customer_id, cust_name, city, grade, salesman_id)
values(3008, 'Julian Green', 'London', 300, 5002);



insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values(70001, 150.5, '2012-10-05', 3005, 5002);
insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values(70009, 270.65, '2012-09-10', 3001, 5005);
insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values(70002, 65.26, '2012-10-05', 3002, 5001);
insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values(70004, 110.5, '2012-08-17', 3009, 5003);
insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values(70007, 948.5, '2012-09-10', 3005, 5002);
insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values(70005, 2400.6, '2012-07-27', 3007, 5001);
insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values(70008, 5760, '2012-09-10', 3002, 5001);


select sum(purch_amt) from orders;   --3

select avg(purch_amt) from orders;   --4

select count(cust_name) from customers;  --5

select min(purch_amt) from orders;   --6

select * from
customers where substring(cust_name from 1 for position(' ' in cust_name) - 1) like '%b';  --7

select * from                       --8
orders where customer_id in (select customer_id from customers where city = 'New York');

select * from
customers where customer_id in (select customer_id from orders where purch_amt > 10);   --9

select sum(grade) from customers;   --10

select * from customers where cust_name notnull;   --11

select max(grade) from customers;   --12






