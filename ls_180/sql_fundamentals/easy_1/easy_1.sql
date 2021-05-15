/* 1 - CREATE DATABASE
 * Create a new database called animals
 */

CREATE DATABASE animals;

/* 2 - CREATE TABLE
 * Now that we have an animals database, we can lay the groundwork needed to add some data to it.
 * 
 * Make a table called birds. It should have the following fields:
 * 
 * id (a primary key)
 * name (string with space for up to 25 characters)
 * age (integer)
 * species (a string with room for no more than 15 characters)
 */

DROP TABLE IF EXISTS birds;
CREATE TABLE birds (
    id serial PRIMARY KEY,
    name varchar(25),
    age int,
    species varchar(15)
);

/* 3 - INSERT DATA
 * For this exercise, we'll add some data to our birds table. Add five records to this database so that our data looks like:
 * 
 *  id |   name   | age | species
 * ----+----------+-----+---------
 *   1 | Charlie  |   3 | Finch
 *   2 | Allie    |   5 | Owl
 *   3 | Jennifer |   3 | Magpie
 *   4 | Jamie    |   4 | Owl
 *   5 | Roy      |   8 | Crow
 * (5 rows)
 */

INSERT INTO birds (name, age, species) VALUES
  ('Charlie', 3, 'Finch'),
  ('Allie', 5, 'Owl'),
  ('Jennifer', 3, 'Magpie'),
  ('Jamie', 4, 'Owl'),
  ('Roy', 8, 'Crow');


/* Further exploration: There is a form of INSERT INTO that doesn't require the
 * column names. How does that form of INSERT INTO work, and when would you use
 * it?
 * 
 * If you are inserting data into all the columns of a table, you do not need to
 * specify the column names. Here we could have used that form, but then we
 * would need to specify the values of the 'id' column. We could have done that
 * using the `DEFAULT` keyword:
 * INSERT INTO animals VALUES
 *  (DEFAULT, 'Charlie', 3, 'Finch'),
 *  (DEFAULT, 'Allie', 5, 'Owl'),
 *  (DEFAULT, 'Jennifer', 3, 'Magpie'),
 *  (DEFAULT, 'Jamie', 4, 'Owl'),
 *  (DEFAULT, 'Roy', 8, 'Crow')
);
 * 
 */

 /* 4 - SELECT DATA
  * Write an SQL statement to query all data that is currently in our birds table.  */

SELECT * FROM birds;

/* 5 - WHERE Clause
 * In this exercise, let's practice filtering the data we want to query. Using a
 * WHERE clause, SELECT records for birds under the age of 5. */

SELECT * FROM birds WHERE age < 5;

/* 6 - Update Data
 * It seems there was a mistake when we were inserting data in the birds table.
 * One of the rows has a species of 'Crow', but that bird is actually a Raven.
 * Update the birds table so that a row with a species of 'Crow' now reads 'Raven'. */

UPDATE birds
SET species = 'Raven' WHERE species = 'Crow';

/* Further Exploration
Oops. Jamie isn't an Owl - he's a Hawk. Correct his information. */

UPDATE birds
SET species = 'Hawk' WHERE name = 'Jamie';

/* 7 - Delete Data
 * Write an SQL statement that deletes the record that describes a 3 year-old
 * finch. */

DELETE FROM birds WHERE age = 3 AND species = 'Finch';

/* 8 - Add Constraint
 * When we initially created our birds table, we forgot to take into account a
 * key factor: preventing certain values from being entered into the database. 
 * For instance, we would never find a bird that is negative n years old. We could
 * have included a constraint to ensure that bad data isn't entered for a database
 * record, but we forgot to do so.

 * For this exercise, write some code that ensures that only birds with a positive
 * age may be added to the database. Then write and execute an SQL statement to
 * check that this new constraint works correctly.
 */

ALTER TABLE birds ADD CHECK (age >= 0);
INSERT INTO birds (name, age, species) VALUES
  ('Tweetie', 0, 'Cartoon');
INSERT INTO birds (name, age, species) VALUES
  ('Donald', -1, 'Duck');

SELECT * FROM birds;

DELETE FROM birds WHERE name = 'Tweetie';

SELECT * FROM birds;

/* Drop Table */
/* It seems we are done with our birds table, and no longer have a need for it
 * in our animals database. Write an SQL statement that will drop the birds table
 * and all its data from the animals database. */

DROP TABLE birds;

/* Drop Database */
/* Let's finish things up by dropping the database animals.
 * With no tables in it, we don't have much use for it any more.
 * Write a SQL statement or PostgreSQL command to drop the animals database. */

DROP DATABASE animals;
