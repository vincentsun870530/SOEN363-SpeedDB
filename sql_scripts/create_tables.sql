-- Create movies table
CREATE TABLE movies (
  mid Int NOT NULL,
  title Varchar(255) NOT NULL,
  year Int NOT NULL,
  rating Real,
  num_ratings Int,
  CHECK(
    rating >= 0.0
    AND rating <= 5.0
  ),
  PRIMARY KEY(mid, title, year)
);

-- Create actors table
CREATE TABLE actors (
  mid Int NOT NULL,
  name Varchar(255) NOT NULL,
  cast_position Int NOT NULL
);

-- Create genres table
CREATE TABLE genres (
  mid Int NOT NULL,
  genre Varchar(255) NOT NULL
);

-- Create tags table
CREATE TABLE tags (mid Int NOT NULL, tid Int NOT NULL);

-- Create tag_names table
CREATE TABLE tag_names (
  tid Int NOT NULL,
  tag Varchar(255) NOT NULL
);