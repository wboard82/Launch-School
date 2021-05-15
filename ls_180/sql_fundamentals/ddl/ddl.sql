/* 1 - Create an Extrasolar Planetary Database:

For this exercise set, we will be working with the DDL statements to create and
modify tables in a database that tracks planets around stars other than our Sun.
To get started, first create a postgresql database named "extrasolar", and then 
create two tables in the database as follows:

** stars table **
- id: a unique serial number that auto-increments and serves as a primary key for this table.
- name: the name of the star,e,g., "Alpha Centauri A". Allow room for 25 characters. Must be unique and non-null.
- distance: the distance in light years from Earth. Define this as a whole number (e.g., 1, 2, 3, etc) 
            that must be non-null and greater than 0.
- spectral_type: the spectral type of the star: O, B, A, F, G, K, and M. Use a one character string.
- companions: how many companion stars does the star have? A whole number will do. Must be non-null and non-negative.

** planets table **
- id: a unique serial number that auto-increments and serves as a primary key for this table.
- designation: a single alphabetic character that uniquely identifies the planet in its star system ('a', 'b', 'c', etc.)
- mass: estimated mass in terms of Jupiter masses; use an integer for this value.
*/

/* DROP DATABASE IF EXISTS extrasolar; */
/* CREATE DATABASE extrasolar; */
\c extrasolar

DROP TABLE IF EXISTS stars CASCADE;
CREATE TABLE stars (
    id serial PRIMARY KEY,
    name varchar(25) UNIQUE NOT NULL,
    distance integer NOT NULL,
    spectral_type char(1),
    companions integer NOT NULL,
    CHECK (distance > 0),
    CHECK (companions >= 0)
);

DROP TABLE IF EXISTS planets CASCADE;
CREATE TABLE planets (
    id serial PRIMARY KEY,
    designation char(1),
    mass integer
);

ALTER TABLE planets
    ADD COLUMN star_id integer NOT NULL REFERENCES stars(id);

/* Increase Star Name Length */
/* Hmm... it turns out that 25 characters isn't enough room to store a star's complete name.
 * For instance, the star "Epsilon Trianguli Australis A" requires 30 characters.
 * Modify the column so that it allows star names as long as 50 characters. */

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4, 'K', 3);
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Orionis', 643, 'M', 9);

ALTER TABLE stars ALTER COLUMN name TYPE varchar(50);
/* Stellar Distance Precision */
/* For many of the closest stars, we know the distance from Earth fairly accurately;
 * for instance, Proxima Centauri is roughly 4.3 light years away. Our database, as
 * currently defined, only allows integer distances, so the most accurate value we
 * can enter is 4. Modify the distance column in the stars table so that it allows
 * fractional light years to any degree of precision required. */

ALTER TABLE stars ALTER distance TYPE numeric;

SELECT * FROM stars;

/* Check Values in List */
/* The spectral_type column in the stars table is currently defined as a one-character
 * string that contains one of the following 7 values: 'O', 'B', 'A', 'F', 'G', 'K', and 'M'.
 * However, there is currently no enforcement on the values that may be entered.
 * Add a constraint to the table stars that will enforce the requirement that a row
 * must hold one of the 7 listed values above. Also, make sure that a value is
 * required for this column. */

ALTER TABLE stars
  ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
  ALTER spectral_type SET NOT NULL;

DROP TYPE IF EXISTS spectral_type_enum;
CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
  DROP CONSTRAINT stars_spectral_type_check,
  ALTER spectral_type TYPE spectral_type_enum USING spectral_type::spectral_type_enum;

SELECT * FROM stars;

/* Planetary Mass Precision */

ALTER TABLE planets
  ALTER mass TYPE numeric,
  ALTER mass SET NOT NULL,
  ADD CHECK (mass > 0),
  ALTER designation SET NOT NULL;

/* Add a Semi-Major Axis Column */

DELETE FROM stars;
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4.37, 'K', 3);
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Epsilon Eridani', 10.5, 'K', 0);

INSERT INTO planets (designation, mass, star_id)
           VALUES ('b', 0.0036, (SELECT id FROM stars WHERE name = 'Alpha Centauri B')); -- check star_id; see note below
INSERT INTO planets (designation, mass, star_id)
           VALUES ('c', 0.1, (SELECT id FROM stars WHERE name = 'Epsilon Eridani')); -- check star_id; see note below

ALTER TABLE planets
  ADD COLUMN semi_major_axis numeric NOT NULL DEFAULT 0;

SELECT * FROM planets;

UPDATE planets SET semi_major_axis = 0.04 WHERE id = 1;
UPDATE planets SET semi_major_axis = 40 WHERE id = 2;

ALTER TABLE planets
    ALTER COLUMN semi_major_axis SET NOT NULL,
    ALTER COLUMN semi_major_axis DROP DEFAULT;
SELECT * FROM planets;

/* Add a Moons Table */
/* Someday in the future, technology will allow us to start observing the moons of
   extrasolar planets. At that point, we're going to need a moons table in our extrasolar
   database. For this exercise, your task is to add that table to the database.
   The table should include the following data: */

-- id: a unique serial number that auto-increments and serves as a primary key for this table.
-- designation: the designation of the moon. We will assume that moon designations will be numbers, with the first moon discovered for each planet being moon 1, the second moon being moon 2, etc. The designation is required.
-- semi_major_axis: the average distance in kilometers from the planet when a moon is farthest from its corresponding planet. This field must be a number greater than 0, but is not required; it may take some time before we are able to measure moon-to-planet distances in extrasolar systems.
-- mass: the mass of the moon measured in terms of Earth Moon masses. This field must be a numeric value greater than 0, but is not required.

/* Make sure you also specify any foreign keys necessary to tie each moon to other rows in the database. */

DROP TABLE IF EXISTS moons;
CREATE TABLE moons (
    id serial PRIMARY KEY,
    designation int NOT NULL,
    semi_major_axis numeric CHECK (semi_major_axis > 0),
    mass numeric CHECK (mass > 0),
    planet_id int NOT NULL REFERENCES planets (id) ON DELETE CASCADE
);

