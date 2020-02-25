-- Copy .dat file to table
\ copy movies
FROM
    'data/movies.dat';

\ copy genres
FROM
    'data/genres.dat';

\ copy actors
FROM
    'data/actors.dat';

\ copy tags
FROM
    'data/tags.dat';

\ copy tag_names
FROM
    'data/tag_names.dat';

-- Alter year column to date
-- ALTER TABLE movies ALTER COLUMN year TYPE date using to_date(year,'YYYY');