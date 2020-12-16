create database quiz2;

create or replace function sjj1(ord integer)  --1
  returns table(ProductID integer,
                ProductName text,
                SupplierID  integer,
                CategoryID  integer,
                Unit text,
                price decimal
  )
as $$
begin
  return query select p.ProductID,p.ProductName, p.SupplierID, p.CategoryID,p.Unit,p.price
                 from orderdetails as o
  left join products p on o.productid = p.productid and o.orderid = ord;
end;
$$ language plpgsql;

create  view sjj2 as select extract(year from date(orderdate))   --2
    as year, count(*) from orders group by year;

select sum(price*Quantity) from (select * from orders o join customers c on c.customerid = o.customerid   --3
    where c.customername = 'Ernst Handel' order by OrderDate desc limit 1) oc
        inner join orderdetails o2 on oc.OrderID = o2.orderid
            inner join products p on o2.ProductID = p.productid;

create or replace function func(shipper_name text)                --4
    returns table(
                orderid int,
                cust_name text,
                total_price numeric,
                address text)

as
$$
begin
    return query select o.orderid, c.customername, (p.price * o2.quantity) as total, c.address
        from shippers inner join orders as o on o.shipperid = shippers.shipperid inner join customers as c
            on c.customerid = o.customerid inner join orderdetails as o2 on o2.orderid = o.orderid inner join products as p
                on p.productid = o2.productid where shippers.shippername = shipper_name order by o.orderdate DESC LIMIT 5;
end;
$$ language plpgsql;


create role sjj5;   --5
grant all privileges on database quiz2 to sjj5;