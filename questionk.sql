-- questionk
DROP VIEW IF EXISTS co_actors_popular;

-- 1. For the actor Tom Cruise, print his name and the number of distinct co-actors.
SELECT
    A1.name,
    COUNT(DISTINCT(A2.name)) AS co_actors_N
FROM
    actors A1,
    actors A2
WHERE
    A1.mid = A2.mid
    AND A1.name = 'Tom Cruise'
GROUP BY
    A1.name;

-- 2. For each actor, compute the number of distinct co-actors. For the highest such number,
-- print the name of the actor and the number of distinct co-actors. In case of a tie, print
-- the records sorted in alphabetical order by name.Use a view to query the name of the
-- actors and the number of distinct co-actors.
CREATE VIEW co_actors_popular AS
SELECT
    A1.name AS actor_name,
    COUNT(DISTINCT(A2.name)) AS co_actors_N
FROM
    actors A1,
    actors A2
WHERE
    A1.mid = A2.mid
    AND A1.name <> A2.name
GROUP BY
    A1.name
ORDER BY
    co_actors_N DESC;


-- print the most popular actors
SELECT
    *
FROM
    co_actors_popular
WHERE
    co_actors_N >= ALL(
        SELECT
            max(co_actors_N)
        FROM
            co_actors_popular
    );