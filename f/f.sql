create database final;

-- 1. The result which operation contains all pairs of tuples from the two relations, regardless of
-- whether their attribute values match.
-- Cartesian product
-- 2. Which one of the following provides the ability to query information from the database and
-- to insert tuples into, delete tuples from, and modify tuples in the database?
-- DML(Data Manipulation Language)
-- 3. An attribute A of datatype varchar(20) has the value "Avi". The attribute B of data type
-- char(20) has value "Reed". Here attribute A has spaces and attribute B has spaces.
-- 3, 20
-- 4. Which of the following statements contains an error?
-- Select empid where empid=1009 and lastname='GELLER';
-- 5. SELECT name __ instructor name, course_id FROM instructor, teaches WHERE
-- instructor.ID = teaches.ID;
-- Which keyword must be used here to rename the field name?
-- As
-- 6. SELECT * FROM instructor ORDER BY salary __, name __;
-- To display the salary from greater to smaller and name in ascending order which of the
-- following options should be used?
-- Desc, Asc
-- 7. __ operation is used for appending two strings.
-- ||
-- 8. A __ consists of a sequence of query and/or update statements.
-- Transaction
-- 9. A Boolean data type that can take values true, false and __.
-- Unknown
-- 10. What type of join is needed when you wish to include rows that do not have matching
-- values?
-- Outer join

--PROBLEMS:
-- #1
--
-- S1: update A = A - 3;
-- S2: update B = B * 2;
-- S3: sum(A);
-- S4: sum(B);
--
--                     Serializable     Read committed    Repeatable read    Read uncommitted
-- 1.S1, S2, S3, S4      13, 44            13, 44            13, 44                13, 44
-- 2.S1, S3, S2, S4      22, 22            22, 44            22, 44                13, 44
-- 3.S1, S3, S4, S2      22, 22            22, 22            22, 22                13, 22
-- 4.S3, S1, S2, S4      22, 22            22, 44            22, 44                22, 44
-- 5.S3, S1, S4, S2      22, 22            22, 22            22, 22                22, 22
-- 6.S3, S4, S1, S2      22, 22            22, 22            22, 22                22, 22
--
-- #2
--
-- Answer is 13. Because 6 + 4 + 3 = 13;
--
--
-- #3
--
-- 1) Updatable views cannot get include GROUP BY or aggregation
-- 2) Updatable view cannot get function COUNT
-- 3) NULL values are not permitted
-- 4) Updatable views get only one table

--Queries

create table pieces(
    code serial primary key,
    name varchar
);

create table providers(
    code varchar primary key,
    name varchar
);

create table provides(
    piece int,
    provider varchar,
    foreign key (piece) references pieces (code),
    foreign key (provider) references providers (code),
    price int
);
insert into providers
values ('HAL', 'Clarke Enterprices'),
       ('RBT', 'Susan Calvin Corp.'),
       ('TNBC', 'Skellington Supplies');

insert into pieces
values (default, 'Spocket'),
       (default, 'Screw'),
       (default, 'Nut'),
       (default, 'Bolt');

insert into provides
values (1, 'HAL', 10),
       (1, 'RBT', 15),
       (2, 'HAL', 20),
       (2, 'RBT', 15),
       (2, 'TNBC', 14),
       (3, 'RBT', 50),
       (3, 'TNBC', 45),
       (4, 'HAL', 5),
       (4, 'RBT', 7);

--1
select Piece, avg(Price) from Provides group by (Piece);

--2

select Providers.Name from Providers join Provides
    on Providers.Code = Provides.Provider and Provides.Piece = 1;

--3
select Pieces.Name from Pieces join Provides
    on Pieces.Code = Provides.Piece and Provides.Provider = 'HAL';

--4
select Pieces.Name, Providers.Name, Price from Pieces
    join Provides ON Pieces.Code = Piece join Providers on Providers.Code = Provider
        where Price = (select max(Price) from Provides where Piece = Pieces.Code);

--5
create index res on provides(price, asc);