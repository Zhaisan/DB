create database lab10;

create table campuses(
    id integer,
    university_name text,
    country text,
    rating integer
);

insert into campuses values
    (1, 'KBTU', 'KAZAKHSTAN', 90),
    (2, 'SDU', 'KAZAKHSTAN', 90),
    (3, 'IT', 'KAZAKHSTAN', 89),
    (4, 'KIMEP', 'KAZAKHSTAN', 89),
    (5, 'STANFORD', 'USA', 98),
    (6, 'HARVARD', 'USA', 97),
    (7, 'OXFORD', 'UK', 95),
    (8, 'YALE UNIVERSITY', 'USA', 93),
    (9, 'MIT', 'USA', 100),
    (10, 'CAMBRIDJE', 'UK', 94);

create or replace  function func_up_low(t text, c varchar)          --1
returns text as $$
    begin
        case when c like 'l'
            then return lower(t);
        else
            return upper(t); end case;
    end;
$$ language plpgsql;

select func_up_low('ALMATY', 't');



create or replace function func_add(id integer,                       --2
                                    university_name text,
                                    country text,
                                    rating integer)
    returns void as $$
begin
    insert into campuses
    values(id, university_name, country, rating);
end
$$ language plpgsql;

select func_add(11, 'KAZNU', 'KAZAKHSTAN', 75);



create or replace function func_in(in t text)              --3
    returns table
            (
                id      integer,
                university_name text,
                country text,
                rating  integer
            )
as
$$
begin
    return query select * from campuses where campuses.university_name = t;
end;
$$ language plpgsql;

select * from func_in('KBTU');

create or replace function func_max_min(variadic nums numeric [],
                                        out maxi integer,
                                        out mini integer)               --4
as
$$
begin
    select into maxi , mini  max(nums[i]), min(nums[i])
    from generate_subscripts(nums, 1) i;

end;
$$ LANGUAGE plpgsql;

select * from func_max_min(2, 3, 4, 12, 88, 7);


create or replace function func_square(inout n integer)        --5
as
$$
begin
    n := n * n;
end;
$$ language plpgsql;

select func_square(5);


create or replace function func_names(in x varchar)           --6
    returns table
            (
                id      integer,
                university_name text,
                country text,
                rating  integer
            )
as
$$
begin
    return query select * from campuses where university_name ilike x;
end;
$$ language plpgsql;

select * from func_names('K%');





