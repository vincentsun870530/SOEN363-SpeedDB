-- problem g

-- Print the movie title, year, and rating of the lowest and highest movies for each year in 2005
-- - 2011, inclusive, in the ascending order of year. In case of a tie, print the records in the
-- ascending order of title.

(select m1.year, m1.title, m1.rating from movies m1
where m1.rating = (select MAX(rating) from movies)
AND m1.year >= 2005 AND m1.year <= 2011
)
UNION
(select m2.year, m2.title, m2.rating from movies m2
where m2.rating = (select MIN(rating) from movies)
AND m2.year >= 2005 AND m2.year <= 2011
)
order by year,title;
