DROP TABLE castings;
DROP TABLE movies;
DROP TABLE stars;


CREATE TABLE movies(
  title VARCHAR(255),
  genre VARCHAR(255),
  id SERIAL4 PRIMARY KEY
);

CREATE TABLE stars(
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  id SERIAL4 PRIMARY KEY
);

CREATE TABLE castings(
  id SERIAL4 PRIMARY KEY,
  fee INT4,
  movie_id INT4 REFERENCES movies(id),
  star_id INT4 REFERENCES stars(id)
);
