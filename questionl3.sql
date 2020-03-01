-- =======================================================================
-- 6/Get view for fraction of similarity
-- =======================================================================
DROP VIEW IF EXISTS similarity3;

DROP VIEW IF EXISTS similarity2;

DROP VIEW IF EXISTS similarity1;

--6.1
CREATE VIEW similarity1 AS
SELECT
    movie1_id,
    movie2_id,
    actor_fraction,
    tag_fraction
FROM
    fraction_of_common_actors,
    fraction_of_common_tags
WHERE
    movie1_id = tag1_mid
    AND movie2_id = tag2_mid;

-- Test similarity1 views
SELECT
    movie1_id,
    movie2_id,
    actor_fraction,
    tag_fraction
FROM
    similarity1
LIMIT
    10;

-- 6.2
CREATE VIEW similarity2 AS
SELECT
    movie1_id,
    movie2_id,
    actor_fraction,
    tag_fraction,
    genre_fraction
FROM
    similarity1,
    fraction_of_common_genres
WHERE
    movie1_id = genre1_mid
    AND movie2_id = genre2_mid;

-- Test similarity2 views
SELECT
    movie1_id,
    movie2_id,
    actor_fraction,
    tag_fraction,
    genre_fraction
FROM
    similarity2
LIMIT
    10;

-- 6.3
CREATE VIEW similarity3 AS
SELECT
    movie1_id,
    movie1_name,
    movie2_id,
    movie2_name,
    actor_fraction,
    tag_fraction,
    genre_fraction,
    age_gap_fraction
FROM
    similarity2,
    fraction_of_age_gap
WHERE
    movie1_id = movie1_mid_age
    AND movie2_id = movie2_mid_age;

-- Test similarity3 views
SELECT
    movie1_id,
    movie2_id,
    actor_fraction,
    tag_fraction,
    genre_fraction,
    age_gap_fraction
FROM
    similarity3
LIMIT
    10;