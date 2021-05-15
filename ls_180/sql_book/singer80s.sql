\c encyclopedia

/* Write a query to return the first name and last name of any singer who released */ 
/* an album in the 80s and who is still living, along with the names of the album */ 
/* that was released and the release date. Order the results by the singer's age (youngest first). */

SELECT first_name, last_name, album_name, released
FROM singers JOIN albums ON singers.id = albums.singer_id
WHERE date_part('year', albums.released) BETWEEN 1980 AND 1989
        AND singers.deceased = false
ORDER BY singers.date_of_birth DESC;
