-- i
-- Let us find out who is the actor with the highest ’longevity.’ 
-- Print the name of the actor/actress who has been playing in movies for 
-- the longest period of time (i.e., the time interval
-- between their first movie and their last movie is the greatest).

-- ANSWER:
-- we group by actor name the first year and last year the movies came out
-- this assumes that the actor played in the movie joining with mid 
-- for testing purposes (i)
-- select * from movies where mid in (select mid from actors where name = 'Morgan Jones');
-- look at max and min year of the movies 

select actors.name, min(year), max(year), max(year)-min(year) number_of_years
from movies, actors
where movies.mid = actors.mid
group by actors.name
order by max(year)-min(year) desc ;
