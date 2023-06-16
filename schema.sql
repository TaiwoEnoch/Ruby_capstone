CREATE DATABASE catalog_for_my_team;

CREATE TABLE label (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  color VARCHAR(100) NOT NULL,
  item_id INT NOT NULL,
  FOREIGN KEY(item_id) REFERENCES item(id)
);

CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT NOT NULL,
  author_id INT NOT NULL,
  label_id INT NOT NULL,
  published_at DATE NOT NULL,
  is_archived BOOLEAN NOT NULL,
);

CREATE TABLE book (
  item_id INT PRIMARY KEY,
  publisher VARCHAR(100) NOT NULL,
  book_cover VARCHAR(100) NOT NULL,
  FOREIGN KEY (item_id) REFERENCES item (id)
);
