-- problem h

-- Create a view called high ratings which contains the distinct names of all actors who
-- have played in movies with a rating greater than or equal to 4. Similarly, create a view
-- called low ratings which contains the distinct names of all actors who have played in
-- movies with a rating less than 4. Print the number of rows in each view.

drop view if exists high_ratings ;
create view high_ratings as
(select distinct name from actors a, movies m
where a.mid = m.mid AND m.rating >= real '4.0');

drop view if exists low_ratings ;
create view low_ratings as
(select distinct name from actors a, movies m
where a.mid = m.mid AND m.rating < real '4.0');

select count(*) from high_ratings;
select count(*) from low_ratings;

-- Use the above views to print the number of ’no flop’ actors in the database.

select count(*) from (
select name from high_ratings
EXCEPT
select name from low_ratings) as no_flop_actors;

-- For each ’no flop’ actor, print the name of the actor and the number of movies N that
-- he/she played in, sorted in descending order of N.

select name, count(*) as number_of_movies from actors a, movies m
where name IN(
select name from high_ratings
EXCEPT
(select name from low_ratings)) AND a.mid = m.mid
group by name
order by count(*) desc;

-- Finally, print the top 10 only.

select name, count(*) as number_of_movies from actors a, movies m
where name IN(
select name from high_ratings
EXCEPT
(select name from low_ratings)) AND a.mid = m.mid
group by name
order by count(*) desc
limit 10;
