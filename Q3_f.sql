-- problem f

-- Print all information (mid, title, year, num ratings, rating) for the movie(s) with the
-- highest number of ratings.

select * from movies
where num_rating = (select MAX(num_rating) from movies);

-- Print all information (mid, title, year, num ratings, rating) for the movie(s) with the
-- highest rating (include tuples that tie), sorted by the ascending order of movie id.

select * from movies
where rating = (select MAX(rating) from movies)
order by mid;

-- Is (Are) the movie(s) with the most number of user ratings among these highest rated
-- movies? Print the output of the query that will check our conjecture (i.e., your query
-- will print the movie(s) that has (have) the highest number of ratings as well as the
-- highest rating).

select * from movies
where num_rating = (select MAX(num_rating) from movies)
AND rating = (select MAX(rating) from movies);

-- Print all information (mid, title, year, num ratings, rating) for the movie(s) with the
-- lowest rating (include tuples that tie), sorted by the ascending order of movie id.

select * from movies
where rating = (select MIN(rating) from movies)
order by mid;

-- Is (Are) the movie(s) with the most number of user ratings among these lowest rated
-- movies? Print the output of the query that will check our conjecture (i.e., your query
--will print the movie(s) that has (have) the highest number of ratings as well as the
-- lowest rating).

select * from movies
where num_rating = (select MAX(num_rating) from movies)
AND rating = (select MIN(rating) from movies);

-- In conclusion, is our hypothesis or conjecture true for the MovieLens database?

/* In conclusion, the hypothesis is not true as both queries (lowest rating with
highest number of ratings and highest rating with highest number of ratings) returned no values.
In other words, movie(s) with highest number of ratings is(are) not with the highest rating nor
with the lowest rating. */
