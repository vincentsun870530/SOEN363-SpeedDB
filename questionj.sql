-- Problem J
-- Drop exsiting view
DROP VIEW IF EXISTS non_existent;

DROP VIEW IF EXISTS all_combinations;

DROP VIEW IF EXISTS co_actors;

-- First, create a view called co_actors, which returns the distinct names of actors who
-- played in at least one movie with Annette Nicole. Print the number of rows in this
-- view.
CREATE VIEW co_actors AS
SELECT
    DISTINCT A1.name
FROM
    actors AS A1
WHERE
    A1.mid IN (
        SELECT
            A2.mid
        FROM
            actors AS A2
        WHERE
            A2.name = 'Annette Nicole'
    );

-- Print number of rows
SELECT
    count(*)
FROM
    co_actors;

-- Second, create a view called all_combinations which returns all possible combinations
-- of co_actors and the movie ids in which Annette Nicole played. Print the number of
-- rows in this view. Note how that this view contains fake (co_actor, mid) combinations!
CREATE VIEW all_combinations AS
SELECT
    co_actors.name,
    actors.mid
FROM
    co_actors
    JOIN actors ON actors.name = 'Annette Nicole';

-- Print number of rows
SELECT
    count(*)
FROM
    all_combinations;

-- Third, create a view called non_existent from the view all_combinations by removing
-- all legitimate (co_actor,mid) pairs (i.e., pairs that exist in the actors table). Print
-- the number of rows in this view.
CREATE VIEW non_existent AS
SELECT
    A1.name,
    A1.mid
FROM
    all_combinations AS A1
EXCEPT
SELECT
    A1.name,
    A1.mid
FROM
    all_combinations AS A1
WHERE
    A1.mid IN(
        SELECT
            actors.mid
        FROM
            actors
        WHERE
            A1.mid = actors.mid
            AND A1.name = actors.name
    );

-- Print number of rows
SELECT
    count(*)
FROM
    non_existent;

-- Finally, from the view co_actors, eliminate the distinct actors that appear in the view
-- non_extistent. Print the names of all co_actors except Annette Nicole.
SELECT
    A1.name
FROM
    co_actors AS A1
WHERE
    A1.name <> 'Annette Nicole'
EXCEPT
SELECT
    A2.name
FROM
    non_existent AS A2;