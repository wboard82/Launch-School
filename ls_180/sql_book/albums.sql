DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
  id serial PRIMARY KEY,
  album_name varchar(100),
  released date,
  genre varchar(100),
  label varchar(100),
  singer_id int REFERENCES singers(id)
);

INSERT INTO albums (album_name, released, genre, label, singer_id) VALUES
    ('Born to Run', 'August 25, 1975', 'Rock and roll', 'Columbia', (SELECT id FROM singers
            WHERE concat(first_name, ' ', last_name) = 'Bruce Springsteen')),
    ('Purple Rain', 'June 25, 1984', 'Pop, R&B, Rock', 'Warner Bros', (SELECT id FROM singers WHERE first_name = 'Prince')),
    ('Born in the USA', 'June 4, 1984', 'Rock and roll, pop', 'Columbia', (SELECT id FROM singers WHERE concat(first_name, ' ', last_name) = 'Bruce Springsteen')),
    ('Madonna', 'July 27, 1983', 'Dance-pop, post-disco', 'Warner Bros', (SELECT id FROM singers WHERE first_name = 'Madonna')),
    ('True Blue', 'June 30, 1986', 'Dance-pop, Pop', 'Warner Bros', (SELECT id FROM singers WHERE first_name = 'Madonna')),
    ('Elvis', 'October 19, 1956', 'Rock and roll, Rhythm and Blues', 'RCA Victor', (SELECT id FROM singers WHERE concat(first_name, ' ', last_name) = 'Elvis Presley')),
    ('Sign o'' the Times', 'March 30, 1987', 'Pop, R&B, Rock, Funk', 'Paisley Park, Warner Bros', (SELECT id FROM singers WHERE first_name = 'Prince')),
    ('G.I. Blues', 'October 1, 1960', 'Rock and roll, Pop', 'RCA Victor', (SELECT id FROM singers WHERE concat(first_name, ' ', last_name) = 'Elvis Presley'));
