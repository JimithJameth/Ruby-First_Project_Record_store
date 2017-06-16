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
  artist_id INT4 REFERENCES artists(id)
);

CREATE TABLE genres(
  id serial8 PRIMARY KEY,
  type VARCHAR(255),
  album_id INT4 REFERENCES albums(id)
);


