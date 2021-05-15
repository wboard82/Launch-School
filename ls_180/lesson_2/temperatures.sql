DROP TABLE IF EXISTS temperatures;
CREATE TABLE temperatures (
	"date" date NOT NULL,
	low integer NOT NULL,
	high integer NOT NULL
);

INSERT INTO temperatures ("date", low, high)
    VALUES ('2016-03-01', 34 , 43),
           ('2016-03-02', 32 , 44),
           ('2016-03-03', 31 , 47),
           ('2016-03-04', 33 , 42),
           ('2016-03-05', 39 , 46),
           ('2016-03-06', 32 , 43),
           ('2016-03-07', 29 , 32),
           ('2016-03-08', 23 , 31),
           ('2016-03-09', 17 , 28);

SELECT date, ROUND(low + high / 2.0, 1) AS average FROM temperatures
WHERE date BETWEEN '2016-03-02' AND '2016-03-08';

ALTER TABLE temperatures
ADD COLUMN rainfall integer NOT NULL DEFAULT 0;

UPDATE temperatures SET rainfall = (low + high) / 2 - 35 WHERE (low + high) / 2 > 35;

SELECT * FROM temperatures;

ALTER TABLE temperatures ALTER rainfall TYPE decimal(6,3);
UPDATE temperatures SET rainfall = rainfall * 0.039;

SELECT * FROM temperatures;

ALTER TABLE temperatures RENAME TO weather;

\d weather


