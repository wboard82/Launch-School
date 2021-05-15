/* DROP TABLE IF EXISTS directors_films; */
/* CREATE TABLE directors_films ( */
/*     id serial PRIMARY KEY, */
/*     film_id integer REFERENCES films (id), */
/*     director_id integer REFERENCES directors (id) */
/* ); */

INSERT INTO directors_films (film_id, director_id)
SELECT id, director_id FROM films;

/* ALTER TABLE films DROP COLUMN director_id; */

SELECT films.title, directors.name
FROM films JOIN directors_films ON films.id = directors_films.film_id
JOIN directors ON directors_films.director_id = directors.id
ORDER BY films.title;

/* INSERT INTO directors (name) VALUES */
/* ('Joel Coen'), ('Ethan Coen'), ('Frank Miller'), ('Robert Rodriguez'); */

INSERT INTO films (title, year, genre, duration) VALUES
('Fargo', 1996, 'comedy', 98),
('No Country for Old Men', 2007, 'western', 122),
('Sin City', 2005, 'crime', 124),
('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors_films (film_id, director_id) VALUES
((SELECT id FROM films WHERE title = 'Fargo'), (SELECT id FROM directors WHERE name = 'Joel Coen')),
((SELECT id FROM films WHERE title = 'No Country for Old Men'), (SELECT id FROM directors WHERE name = 'Joel Coen')),
((SELECT id FROM films WHERE title = 'No Country for Old Men'), (SELECT id FROM directors WHERE name = 'Ethan Coen')),
((SELECT id FROM films WHERE title = 'Sin City'), (SELECT id FROM directors WHERE name = 'Frank Miller')),
((SELECT id FROM films WHERE title = 'Sin City'), (SELECT id FROM directors WHERE name = 'Robert Rodriguez')),
((SELECT id FROM films WHERE title = 'Spy Kids'), (SELECT id FROM directors WHERE name = 'Robert Rodriguez'));

