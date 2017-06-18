DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id serial8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums(
  id serial8 PRIMARY KEY,
  title VARCHAR(255),
  artist_id INT8 REFERENCES artists(id),
  genre_id INT8 REFERENCES genres(id)
);

CREATE TABLE genres(
  id serial8 PRIMARY KEY,
  type VARCHAR(255)
);


