DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id serial8 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE genres(
  id serial8 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE albums(
  id serial8 PRIMARY KEY,
  title VARCHAR(255),
  quantity INT8,
  price INT8,
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
  genre_id INT8 REFERENCES genres(id) ON DELETE CASCADE
);
