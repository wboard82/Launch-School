/* Initially, we need to create a billing database with a customers table and a 
   services table. The customers table should include the following columns: */
-- id is a unique numeric customer id that auto-increments and serves as a primary key for this table.
-- name is the customer's name. This value must be present in every record and may contain names of any length.
-- payment_token is an 8-character string that consists of solely uppercase
-- alphabetic letters.
   -- It identifies each customer's payment information with the payment processor the company uses.

DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE customers (
    id serial PRIMARY KEY,
    name text NOT NULL,
    payment_token char(8) CHECK (payment_token ~ '^[A-Z]{8}$')
);

/* The services table should include the following columns: */
-- id is a unique numeric service id that auto-increments and serves as a primary key for this table.
-- description is the service description. This value must be present and may contain any text.
-- price is the annual service price. It must be present, must be greater than or equal to 0.00. The data type is numeric(10, 2).

DROP TABLE IF EXISTS services CASCADE;
CREATE TABLE services (
    id serial PRIMARY KEY,
    description text NOT NULL,
    price numeric(10, 2) NOT NULL CHECK (price >= 0.00)
);

-- Data for the customers table

INSERT INTO customers (name, payment_token) VALUES
('Pat Johnson', 'XHGOAHEQ'),
('Nancy Monreal', 'JKWQPJKL'),
('Lynn Blake', 'KLZXWEEE'),
('Chen Ke-Hua', 'KWETYCVX'),
('Scott Lakso', 'UUEAPQPS'),
('Jim Pornot', 'XKJEYAZA');

-- Data for the services table

INSERT INTO services (description, price) VALUES
('Unix Hosting', 5.95),
('DNS', 4.95),
('Whois Registration', 1.95),
('High Bandwidth', 15.00),
('Business Support', 250.00),
('Dedicated Hosting', 50.00),
('Bulk Email', 250.00),
('One-to-one Training', 999.00);

-- Join table
DROP TABLE IF EXISTS customers_services;
CREATE TABLE customers_services (
    id serial PRIMARY KEY,
    customer_id int REFERENCES customers (id) ON DELETE CASCADE,
    service_id int REFERENCES services (id),
    UNIQUE (customer_id, service_id)
);

INSERT INTO customers_services (customer_id, service_id) VALUES
((SELECT id FROM customers WHERE name = 'Pat Johnson'), (SELECT id FROM services WHERE description = 'Unix Hosting')),
((SELECT id FROM customers WHERE name = 'Pat Johnson'), (SELECT id FROM services WHERE description = 'DNS')),
((SELECT id FROM customers WHERE name = 'Pat Johnson'), (SELECT id FROM services WHERE description = 'Whois Registration')),
((SELECT id FROM customers WHERE name = 'Lynn Blake'), (SELECT id FROM services WHERE description = 'Unix Hosting')),
((SELECT id FROM customers WHERE name = 'Lynn Blake'), (SELECT id FROM services WHERE description = 'DNS')),
((SELECT id FROM customers WHERE name = 'Lynn Blake'), (SELECT id FROM services WHERE description = 'Whois Registration')),
((SELECT id FROM customers WHERE name = 'Lynn Blake'), (SELECT id FROM services WHERE description = 'High Bandwidth')),
((SELECT id FROM customers WHERE name = 'Lynn Blake'), (SELECT id FROM services WHERE description = 'Business Support')),
((SELECT id FROM customers WHERE name = 'Chen Ke-Hua'), (SELECT id FROM services WHERE description = 'Unix Hosting')),
((SELECT id FROM customers WHERE name = 'Chen Ke-Hua'), (SELECT id FROM services WHERE description = 'High Bandwidth')),
((SELECT id FROM customers WHERE name = 'Scott Lakso'), (SELECT id FROM services WHERE description = 'Unix Hosting')),
((SELECT id FROM customers WHERE name = 'Scott Lakso'), (SELECT id FROM services WHERE description = 'DNS')),
((SELECT id FROM customers WHERE name = 'Scott Lakso'), (SELECT id FROM services WHERE description = 'Dedicated Hosting')),
((SELECT id FROM customers WHERE name = 'Jim Pornot'), (SELECT id FROM services WHERE description = 'Unix Hosting')),
((SELECT id FROM customers WHERE name = 'Jim Pornot'), (SELECT id FROM services WHERE description = 'Dedicated Hosting')),
((SELECT id FROM customers WHERE name = 'Jim Pornot'), (SELECT id FROM services WHERE description = 'Bulk Email'));


/* Write a query to retrieve the customer data for every customer who currently subscribes to at least one service. */
SELECT * FROM customers
WHERE customers.id IN (SELECT DISTINCT customer_id FROM customers_services);

SELECT DISTINCT customers.* FROM customers
INNER JOIN customers_services
        ON customers.id = customers_services.customer_id;


/* Write a query to retrieve the customer data for every customer who does not currently subscribe to any services. */
SELECT customers.* FROM customers
LEFT OUTER JOIN customers_services
             ON customers.id = customers_services.customer_id
WHERE customers_services.id IS NULL;

/* Further Exploration */
SELECT customers.*, services.* FROM customers
FULL JOIN customers_services
       ON customers.id = customers_services.customer_id
FULL JOIN services
       ON customers_services.service_id = services.id
WHERE customers_services.id IS NULL;

SELECT c.*, s.* FROM customers AS c
FULL JOIN customers_services AS c_s
       ON c.id = c_s.customer_id
FULL JOIN services AS s
       ON c_s.service_id = s.id
WHERE c_s.id IS NULL;


/*
Using RIGHT OUTER JOIN, write a query to display a list of all services that 
are not currently in use. Your output should look like this:

 description
-------------
 One-to-one Training
(1 row)
 */

SELECT description FROM customers_services
RIGHT JOIN services
        ON services.id = customers_services.service_id
WHERE customers_services.id IS NULL;

/* Write a query to display a list of all customer names together with a comma-separated list of the services they use. */
SELECT c.name, STRING_AGG(s.description, ', ') AS services
FROM customers AS c
FULL JOIN customers_services AS c_s
       ON c.id = c_s.customer_id
FULL JOIN services AS s
       ON c_s.service_id = s.id
GROUP BY name;

SELECT CASE WHEN customers.name = lag(customers.name)
                                  OVER (ORDER BY customers.name)
                 THEN ''
            ELSE customers.name
       END,
       services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;


/* 
Write a query that displays the description for every service that is subscribed
to by at least 3 customers. Include the customer count for each description in 
the report. The report should look like this:
 */

SELECT s.description, COUNT(c_s.id)
FROM services AS s JOIN customers_services AS c_s
                     ON s.id = c_s.service_id
GROUP BY s.description
  HAVING COUNT(c_s.id) >= 3
ORDER BY s.description;

/*
Assuming that everybody in our database has a bill coming due, and that all of 
them will pay on time, write a query to compute the total gross income we expect to receive. 
 */

SELECT SUM(price) AS gross
FROM services JOIN customers_services
  ON services.id = customers_services.service_id;

/*
A new customer, 'John Doe', has signed up with our company. His payment token is 
'EYODHLCN'. Initially, he has signed up for UNIX hosting, DNS, and Whois Registration.
Create any SQL statement(s) needed to add this record to the database.
 */

INSERT INTO customers (name, payment_token)
VALUES ('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id) VALUES
((SELECT id FROM customers WHERE name = 'John Doe'), (SELECT id FROM services WHERE description ILIKE 'UNIX hosting')),
((SELECT id FROM customers WHERE name = 'John Doe'), (SELECT id FROM services WHERE description = 'DNS')),
((SELECT id FROM customers WHERE name = 'John Doe'), (SELECT id FROM services WHERE description = 'Whois Registration'));


SELECT c.name, STRING_AGG(s.description, ', ') AS services
FROM customers AS c
FULL JOIN customers_services AS c_s
       ON c.id = c_s.customer_id
FULL JOIN services AS s
       ON c_s.service_id = s.id
GROUP BY name;

/*
The company president is looking to increase revenue. As a prelude to his decision making,
he asks for two numbers: the amount of expected income from "big ticket" services 
(those services that cost more than $100) and the maximum income the company could
achieve if it managed to convince all of its customers to select all of the company's big ticket items.
*/
SELECT SUM(services.price) FROM services
JOIN customers_services
  ON services.id = customers_services.service_id
WHERE services.price > 100.00;

SELECT SUM(services.price) FROM customers
CROSS JOIN services WHERE services.price > 100.00;

SELECT SUM(services.price) * (SELECT COUNT(id) FROM customers) FROM services
WHERE services.price > 100.00;

DELETE FROM customers_services
      WHERE service_id = (
                          SELECT id FROM services
                           WHERE description = 'Bulk Email');
DELETE FROM services WHERE description = 'Bulk Email';

DELETE FROM customers WHERE name = 'Chen Ke-Hua';
