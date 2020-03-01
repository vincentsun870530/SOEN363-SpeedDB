-- =======================================================================
-- 4/Get view for fraction of age gap
-- =======================================================================
DROP VIEW IF EXISTS fraction_of_age_gap;

DROP VIEW IF EXISTS age_gaps;

-- 4.1
CREATE VIEW age_gaps AS
SELECT
    M1.mid AS movie1_mid_age,
    M2.mid AS movie2_mid_age,
    M1.title AS movie1_name,
    M2.title AS movie2_name,
    M1.year AS movie1_year,
    M2.year AS movie2_year,
    ABS(M2.year - M1.year) AS age_gaps
FROM
    movies M1,
    movies M2
WHERE
    M1.mid <> M2.mid
ORDER BY
    M1.mid;

-- 4.2
CREATE VIEW fraction_of_age_gap AS
SELECT
    movie1_mid_age,
    movie2_mid_age,
    movie1_name,
    movie2_name,
    age_gaps,
    1.0 * age_gaps / 108 AS age_gap_fraction
FROM
    age_gaps; 
    
-- Test age_gaps view
SELECT
    *
FROM
    age_gaps
LIMIT
    10;

-- Test fraction_of_age_gap
SELECT
    *
FROM
    fraction_of_age_gap
LIMIT
    10;


-- =======================================================================
-- 5/Get view for fraction of rating gap
-- =======================================================================
DROP VIEW IF EXISTS fraction_of_rating_gap;

DROP VIEW IF EXISTS rating_gaps;

-- 5.1
CREATE VIEW rating_gaps AS
SELECT
    M1.mid AS movie1_mid_rating,
    M2.mid AS movie2_mid_rating,
    M1.rating AS movie1_rating,
    M2.rating AS movie2_rating,
    ABS(M2.rating - M1.rating) AS rating_gaps
FROM
    movies M1,
    movies M2
WHERE
    M1.mid <> M2.mid
ORDER BY
    M1.mid;

-- 5.2
CREATE VIEW fraction_of_rating_gap AS
SELECT
    movie1_mid_rating,
    movie2_mid_rating,
    rating_gaps,
    1.0 * rating_gaps / 5 AS rating_gap_fraction
FROM
    rating_gaps; 
    
-- Test rating_gaps view
SELECT
    MAX(rating_gaps)
FROM
    rating_gaps
LIMIT
    10;

-- Test fraction_of_rating_gap
SELECT
    *
FROM
    fraction_of_rating_gap
LIMIT
    10;