-- Create movies table
CREATE TABLE movies (
  MID Int NOT NULL,
  Title Varchar(255) NOT NULL,
  Year Varchar(50) NOT NULL,
  Rating Real,
  NumRatings Int,
  CHECK(
    Rating >= 0.0
    AND Rating <= 5.0
  ),
  PRIMARY KEY(MID, Title, Year)
);

-- Create actors table
CREATE TABLE actors (
  MID Int NOT NULL,
  Name Varchar(255) NOT NULL,
  cast_position Int NOT NULL
);

-- Create genres table
CREATE TABLE genres (
  MID Int NOT NULL,
  Genre Varchar(255) NOT NULL
);

-- Create tags table
CREATE TABLE tags (MID Int NOT NULL, TID Int NOT NULL);

-- Create tag_names table
CREATE TABLE tag_names (
  TID Int NOT NULL,
  Tag Varchar(255) NOT NULL
);