-- 1) Create the following tables «movies» and «theaters»:
create table movies (
  id     serial primary key,
  title  varchar(255) not null unique ,
  rating integer,
  genre  varchar(50)  not null
);
insert into movies values
  (default, 'Citizen Kane', 5, 'Drama'),
  (default, 'Singin'' in the Rain', 7, 'Comedy'),
  (default, 'The Wizard of Oz ', 7, 'Fantasy'),
  (default, 'The Quiet Man', NULL, 'Comedy'),
  (default, 'North by Northwest', NULL, 'Thriller'),
  (default, 'The Last Tango in Paris', 9, 'Drama'),
  (default, 'Some Like it Hot', 4, 'Comedy'),
  (default, 'A Night at the Opera', NULL, 'Comedy');

create table theaters (
  id   serial primary key ,
  name varchar(255) not null unique ,
  size integer not null check (size >= 3),
  city varchar(50) not null
);
insert into theaters values
  (default, 'Kinopark Esentai', 15, 'Almaty'),
  (default, 'Star Cinema Mega ', 7, 'Almaty'),
  (default, 'Kinopark 8', 9, 'Shymkent'),
  (default, 'Star Cinema 15', 11, 'Astana'),
  (default, 'Cinemax', 4, 'Aktau');

-- 2) Select the names of only one movie from each genre.
select distinct on (genre) title from movies;


-- 3) Select the top 3 movies by rating.
select * from movies order by rating desc nulls last limit 3;

-- 4) Select the third biggest theater by size.
select * from theaters order by size desc offset 2 limit 1;


-- 5) Select all unrated movies.
select * from movies where rating is null;


-- 6) Select theaters from Almaty and Shymkent with rating greater than 7.
select * from theaters where size > 7 and city in ('Almaty','Shymkent');


-- 7) Show all movies in the following format with aliases
select id as "Movie ID", format('The genre of %s is %s', title, genre) as "MovieInfo" from movies;


-- 8) Create table named «movietheaters» with pair primary key (theater_id and movie_id):
create table movietheaters (
  theater_id integer references theaters,
  movie_id   integer references movies,
  rating     integer,
  primary key (theater_id, movie_id)
);
insert into movietheaters values (1, 5, 5), (3, 1, 7), (1, 3, 9), (4, 6, 6), (2, 3, 5), (4, 4, 7);


-- 9) Select all theaters that are not currently showing a movie.
select * from theaters where id not in (select theater_id from movietheaters);


-- 10) Select all movies by dividing to three categories (if NULL print «No rating»):
  -- 1) Low rating (0-3);
  -- 2) Medium rating (4-7);
  -- 3) High rating (8-10)
select
  *,
  case
    when rating between 0 and 3
      then 'Low rating'
    when rating between 4 and 7
      then 'Medium rating'
    when rating between 8 and 10
      then 'High rating'
    else 'No rating'
  end as category
from movies;


-- 11) Set the rating of all unrated movies to 1.
update movies set rating = 1 where rating is null;


-- 12) Remove all movies not currently showing in theaters.
delete from movies where id not in (select movie_id from movietheaters);


-- 13) Select all movies which has name with following pattern:
  -- First letter is ’T’,
  -- third letter is ‘e’ and end with letter ’n’.
select * from movies where title like ('T_e%n');


-- 14) Select average rating of each genre.
select avg(rating) from movies group by genre;


-- 15) Select theaters which currently showing more than 1 movie.
select * from theaters where id in (select theater_id from movietheaters group by theater_id having count(theater_id)>1);










