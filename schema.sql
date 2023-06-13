CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  genre VARCHAR(255),
  multiplayer BOOLEAN,
  last_played_at TIMESTAMP
);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);
