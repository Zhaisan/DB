
-- By default, the parameter’s type of any parameter in
-- PostgreSQL is IN parameter. You can pass the IN
-- parameters to the function but you cannot get them
-- back as a part of result.
--
--
-- The OUT parameters are defined as part of the function
-- arguments list and are returned back as a part of the
-- result.
--
--
-- The INOUT parameter is the combination IN and OUT
-- parameters.
-- It means that the caller can pass the value to the
-- function.
-- The function then changes the argument and passes
-- the value back as a part of the result.
--
--
-- A PostgreSQL function can accept a variable number
-- of arguments with one condition that all arguments
-- have the same data type.
-- The arguments are passed to the function as an array.




create table Highschooler(
    ID int,
    name text,
    grade int);
create table Friend(
    ID1 int,
    ID2 int);
create table Likes(
    ID1 int,
    ID2 int);

insert into Highschooler values (1510, 'Jordan', 9);
insert into Highschooler values (1689, 'Gabriel', 9);
insert into Highschooler values (1381, 'Tiffany', 9);
insert into Highschooler values (1709, 'Cassandra', 9);
insert into Highschooler values (1101, 'Haley', 10);
insert into Highschooler values (1782, 'Andrew', 10);
insert into Highschooler values (1468, 'Kris', 10);
insert into Highschooler values (1641, 'Brittany', 10);
insert into Highschooler values (1247, 'Alexis', 11);
insert into Highschooler values (1316, 'Austin', 11);
insert into Highschooler values (1911, 'Gabriel', 11);
insert into Highschooler values (1501, 'Jessica', 11);
insert into Highschooler values (1304, 'Jordan', 12);
insert into Highschooler values (1025, 'John', 12);
insert into Highschooler values (1934, 'Kyle', 12);
insert into Highschooler values (1661, 'Logan', 12);

insert into Friend values (1510, 1381);
insert into Friend values (1510, 1689);
insert into Friend values (1689, 1709);
insert into Friend values (1381, 1247);
insert into Friend values (1709, 1247);
insert into Friend values (1689, 1782);
insert into Friend values (1782, 1468);
insert into Friend values (1782, 1316);
insert into Friend values (1782, 1304);
insert into Friend values (1468, 1101);
insert into Friend values (1468, 1641);
insert into Friend values (1101, 1641);
insert into Friend values (1247, 1911);
insert into Friend values (1247, 1501);
insert into Friend values (1911, 1501);
insert into Friend values (1501, 1934);
insert into Friend values (1316, 1934);
insert into Friend values (1934, 1304);
insert into Friend values (1304, 1661);
insert into Friend values (1661, 1025);
insert into Friend SELECT ID2, ID1 FROM Friend;

insert into Likes values(1689, 1709);
insert into Likes values(1709, 1689);
insert into Likes values(1782, 1709);
insert into Likes values(1911, 1247);
insert into Likes values(1247, 1468);
insert into Likes values(1641, 1468);
insert into Likes values(1316, 1304);
insert into Likes values(1501, 1934);
insert into Likes values(1934, 1501);
insert into Likes values(1025, 1101);

select h1.name from Highschooler as h1 join Friend as f on f.ID1 = h1.ID
    join Highschooler as h2 on f.ID2 = h2.ID
        where h2.name = "Gabriel";

select h1.name as first_student, h1.grade as s1_grade , h2.name as second_student, h2.grade as s2_grade from Highschooler as h1
    join Likes as l on l.ID1 = h1.ID join Highschooler as h2 on l.ID2 = h2.ID
        where h1.grade - h2.grade >= 2;

select h.name, h.grade from Highschooler as h
    join Likes as l on l.ID2 = h.ID group by ID2, h.name, h.grade
        having count(ID2) > 1;

select name, grade from Highschooler as h1
    where ID not in (select ID1 from Highschooler as h2, Friend as f
            where f.ID1 = h1.ID and f.ID2 = h2.ID and h1.grade != h2.grade)
order by grade, name;

select h1.name as first_student, h1.grade as s1_grade, h2.name as second_student, h2.grade as s2_grade from
    Highschooler as h1, Highschooler as h2, Likes as l1, Likes as l2
        where (h2.ID = l2.ID1 and h1.ID = l2.ID2 and h1.ID = l1.ID1 and h2.ID = l1.ID2 and h2.name > h1.name)
order by h1.name, h2.name;

