-- questionl
-- =======================================================================
-- 1/Get view for fraction of common actors
-- =======================================================================
DROP VIEW IF EXISTS fraction_of_common_actors;

DROP VIEW IF EXISTS number_of_actors;

DROP VIEW IF EXISTS number_common_actor;

DROP VIEW IF EXISTS common_actors;

-- 1.1
CREATE VIEW common_actors AS
SELECT
    A1.mid AS movie1_id,
    A2.mid AS movie2_id,
    A1.name AS actor_name
FROM
    actors A1,
    actors A2
WHERE
    A1.name = A2.name
    AND A1.mid <> A2.mid
ORDER BY
    A1.mid;

-- 1.2
CREATE VIEW number_common_actor AS
SELECT
    movie1_id,
    movie2_id,
    count(actor_name) AS movie_common_actor_counts
FROM
    common_actors
GROUP BY
    movie1_id,
    movie2_id
ORDER BY
    movie1_id,
    movie2_id;

-- 1.3
CREATE VIEW number_of_actors AS
SELECT
    mid,
    count(name) AS movie_actor_counts
FROM
    actors
GROUP BY
    mid
ORDER BY
    mid;

-- 1.4
CREATE VIEW fraction_of_common_actors AS
SELECT
    A1.movie1_id,
    A1.movie2_id,
    A1.movie_common_actor_counts,
    A2.movie_actor_counts,
    1.0 * A1.movie_common_actor_counts / A2.movie_actor_counts AS actor_fraction
FROM
    number_common_actor AS A1,
    number_of_actors AS A2
WHERE
    A1.movie1_id = A2.mid;

-- Test common_actors view
SELECT
    *
FROM
    common_actors
WHERE
    movie1_id = 1
    AND movie2_id = 2355
LIMIT
    10;

-- Test number_common_actor view
SELECT
    *
FROM
    number_common_actor VIEW
LIMIT
    10;

-- Test number_of_actors view
SELECT
    *
FROM
    number_of_actors
LIMIT
    10;

-- Test fraction_of_common_actors view
SELECT
    *
FROM
    fraction_of_common_actors
LIMIT
    10;

-- =======================================================================
-- 2/Get view for fraction of common tags
-- =======================================================================
DROP VIEW IF EXISTS fraction_of_common_tags;

DROP VIEW IF EXISTS number_of_tags;

DROP VIEW IF EXISTS number_common_tags;

DROP VIEW IF EXISTS common_tags;

-- 2.1
CREATE VIEW common_tags AS
SELECT
    T1.mid AS tag1_mid,
    T2.mid AS tag2_mid,
    T1.tid AS tag_tid
FROM
    tags T1,
    tags T2
WHERE
    T1.tid = T2.tid
    AND T1.mid <> T2.mid
ORDER BY
    T1.mid;

-- 2.2
CREATE VIEW number_common_tags AS
SELECT
    tag1_mid,
    tag2_mid,
    count(tag_tid) AS movie_common_tag_counts
FROM
    common_tags
GROUP BY
    tag1_mid,
    tag2_mid
ORDER BY
    tag1_mid,
    tag2_mid;

-- 2.3
CREATE VIEW number_of_tags AS
SELECT
    mid,
    count(tid) AS movie_tag_counts
FROM
    tags
GROUP BY
    mid
ORDER BY
    mid;

-- 2.4
CREATE VIEW fraction_of_common_tags AS
SELECT
    T1.tag1_mid,
    T1.tag2_mid,
    T1.movie_common_tag_counts,
    T2.movie_tag_counts,
    1.0 * T1.movie_common_tag_counts / T2.movie_tag_counts AS tag_fraction
FROM
    number_common_tags AS T1,
    number_of_tags AS T2
WHERE
    T1.tag1_mid = T2.mid;

-- Test common_tags view
SELECT
    *
FROM
    common_tags
WHERE
    tag1_mid = 1
    AND tag2_mid = 2355
LIMIT
    10;

-- Test number_common_tags view
SELECT
    *
FROM
    number_common_tags VIEW
LIMIT
    10;

-- Test number_of_tags view
SELECT
    *
FROM
    number_of_tags
LIMIT
    10;

-- Test fraction_of_common_tags view
SELECT
    *
FROM
    fraction_of_common_tags
LIMIT
    10;

-- =======================================================================
-- 3/Get view for fraction of common genres
-- =======================================================================
DROP VIEW IF EXISTS fraction_of_common_genres;

DROP VIEW IF EXISTS number_of_genres;

DROP VIEW IF EXISTS number_common_genres;

DROP VIEW IF EXISTS common_genres;

-- 3.1
CREATE VIEW common_genres AS
SELECT
    G1.mid AS genre1_mid,
    G2.mid AS genre2_mid,
    G1.genre AS genre_type
FROM
    genres G1,
    genres G2
WHERE
    G1.genre = G2.genre
    AND G1.mid <> G2.mid
ORDER BY
    G1.mid;

-- 3.2
CREATE VIEW number_common_genres AS
SELECT
    genre1_mid,
    genre2_mid,
    count(genre_type) AS movie_common_genre_counts
FROM
    common_genres
GROUP BY
    genre1_mid,
    genre2_mid
ORDER BY
    genre1_mid,
    genre2_mid;

-- 3.3
CREATE VIEW number_of_genres AS
SELECT
    mid,
    count(genre) AS movie_genre_counts
FROM
    genres
GROUP BY
    mid
ORDER BY
    mid;

-- 3.4
CREATE VIEW fraction_of_common_genres AS
SELECT
    G1.genre1_mid,
    G1.genre2_mid,
    G1.movie_common_genre_counts,
    G2.movie_genre_counts,
    1.0 * G1.movie_common_genre_counts / G2.movie_genre_counts AS genre_fraction
FROM
    number_common_genres AS G1,
    number_of_genres AS G2
WHERE
    G1.genre1_mid = G2.mid;

-- Test common_genres view
SELECT
    *
FROM
    common_genres
WHERE
    genre1_mid = 1
    AND genre2_mid = 2355
LIMIT
    10;

-- Test number_common_genres view
SELECT
    *
FROM
    number_common_genres VIEW
LIMIT
    10;

-- Test number_of_genres view
SELECT
    *
FROM
    number_of_genres
LIMIT
    10;

-- Test fraction_of_common_genres view
SELECT
    *
FROM
    fraction_of_common_genres
LIMIT
    10;

