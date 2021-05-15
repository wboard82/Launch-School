DROP TABLE IF EXISTS bidders CASCADE;
CREATE TABLE bidders (
    id serial PRIMARY KEY,
    name text NOT NULL
);


DROP TABLE IF EXISTS items CASCADE;
CREATE TABLE items (
    id serial PRIMARY KEY,
    name text NOT NULL,
    initial_price numeric(6,2) NOT NULL
                  CHECK (initial_price BETWEEN 0.01 AND 1000.00),
    sales_price numeric(6,2)
                CHECK (sales_price BETWEEN 0.01 AND 1000.00)
);


DROP TABLE IF EXISTS bids CASCADE;
CREATE TABLE bids (
    id serial PRIMARY KEY,
    bidder_id integer
              NOT NULL
              REFERENCES bidders (id)
              ON DELETE CASCADE,
    item_id integer
            NOT NULL
            REFERENCES items (id)
            ON DELETE CASCADE,
    amount numeric(6,2) NOT NULL
                        CHECK (amount BETWEEN 0.01 AND 1000.00)
);

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders FROM 'bidders.csv' WITH CSV HEADER
\copy items FROM 'items.csv' WITH CSV HEADER
\copy bids FROM 'bids.csv' WITH CSV HEADER

/* Write a SQL query that shows all items that have had bids put on them.
   Use the logical operator IN for this exercise, as well as a subquery. */

SELECT name "Bid on items" FROM items
WHERE id IN (SELECT DISTINCT item_id FROM bids);


/* Write a SQL query that shows all items that have not had bids put on them.
   Use the logical operator NOT IN for this exercise, as well as a subquery. */

SELECT name "Not bid on" FROM items
WHERE id NOT IN (SELECT DISTINCT item_id FROM bids);

/* Write a SELECT query that returns a list of names of everyone who has bid in the auction.
   While it is possible (and perhaps easier) to do this with a JOIN clause, we're going to
   do things differently: use a subquery with the EXISTS clause instead. Here is the expected output: */

SELECT name AS "Bidders in Auction" FROM bidders
WHERE EXISTS (SELECT bidder_id FROM bids WHERE bidder_id = bidders.id);

SELECT DISTINCT name AS "Bidders in Auction"
FROM bidders JOIN bids ON bids.bidder_id = bidders.id;


/* Write an SQL query that finds the largest number of bids from an individual bidder. */

/* For this exercise, you must use a subquery to generate a result table (or virtual table),
   and then query that table for the largest number of bids. */

SELECT MAX(bid_counts.count)
    FROM (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

/*
For this exercise, use a scalar subquery to determine the number of bids on each item.
The entire query should return a table that has the name of each item along with the
number of bids on an item.
*/

--EXPLAIN ANALYZE
SELECT items.name, COUNT(bids.id)
FROM items LEFT JOIN bids ON items.id = item_id
GROUP BY items.name;

--EXPLAIN ANALYZE
SELECT name,
       (SELECT COUNT(bids.id) FROM bids WHERE items.id = item_id)
FROM items;

--EXPLAIN ANALYZE
SELECT id FROM items
WHERE ROW('Painting', 100.00, 250.00) =
      ROW(name, initial_price, sales_price);

--EXPLAIN ANALYZE
/* SELECT id FROM items */
/* WHERE name = 'Painting' AND */
/*       initial_price = 100.00 AND */
/*       sales_price = 250.00; */

-- EXPLAIN
SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

-- EXPLAIN ANALYZE
SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

EXPLAIN ANALYZE
SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

EXPLAIN ANALYZE
SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;
