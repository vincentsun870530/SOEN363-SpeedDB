--select * from movies;
select * from actors;
select * from genres;
select * from tags;
select * from tag_names;
-- problem a
--Print all movie titles starring ’Daniel Craig’, sorted in an ascending alphabetical order
select distinct movies.title 
from movies, actors
where actors.name like 'Daniel Craig'
   and movies.mid = actors.mid
  order by movies.title;
  
  
-- problem b
-- Print names of the cast of the movie ’The Dark Knight’ in an ascending alphabetical order.
select distinct actors.name
from movies, actors
where movies.title like 'The Dark Knight'
   and movies.mid = actors.mid
   order by actors.name;
 
 -- problem c
 --Print the distinct genres in the database and their corresponding number of movies N where
-- N is greater than 1000, sorted in the ascending order of N

select genre, count(*) number_of_movies from genres
group by genre
having count(*) > 1000
order by count(*);

-- problem d

-- For each year, print the movie title, year, and rating, sorted in the ascending order of
-- year and the descending order of movie rating.

select year, title, rating
from movies
order by year asc, rating desc;
  