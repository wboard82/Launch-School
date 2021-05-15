\c workshop

/* One table should be called devices. This table should have columns that meet the following specifications: */

-- Includes a primary key called id that is auto-incrementing.
-- A column called name, that can contain a String. It cannot be NULL.
-- A column called created_at that lists the date this device was created.
-- It should be of type timestamp and it should also have a default value related to when a device is created.

DROP TABLE IF EXISTS devices CASCADE;
CREATE TABLE devices (
    id serial PRIMARY KEY,
    name text NOT NULL,
    created_at timestamp DEFAULT NOW()
);

/* In the workshop, we have several devices, and each device should have many different parts.
   These parts are unique to each device, so one device can have various parts, but those parts
   won't be used in any other device. Make a table called parts that reflects the information
   listed above. Table parts should have the following columns that meet the following specifications: */

-- An id which auto-increments and acts as the primary key
-- A part_number. This column should be unique and not null.
-- A foreign key column called device_id. This will be used to associate various parts with a device.

DROP TABLE IF EXISTS parts;
CREATE TABLE parts (
    id serial PRIMARY KEY,
    part_number integer UNIQUE NOT NULL,
    device_id integer REFERENCES devices (id) ON DELETE CASCADE
);

INSERT INTO devices (name) VALUES ('Accelerometer'), ('Gyroscope');

INSERT INTO parts (part_number, device_id) VALUES
(1001, 1), (1002, 1), (1003, 1),
(2001, 2), (2002, 2), (2003, 2), (2004, 2), (2005, 2),
(3001, NULL), (3002, NULL), (3003, NULL);

SELECT devices.name, parts.part_number
FROM devices INNER JOIN parts ON devices.id = parts.device_id;

SELECT * FROM parts WHERE substring(part_number::text FROM 1 FOR 1) = '3';

SELECT devices.name, COUNT(parts.id) AS number_of_parts
FROM devices LEFT OUTER JOIN parts ON devices.id = parts.device_id
GROUP BY devices.name
ORDER BY devices.name DESC;


SELECT part_number, device_id FROM parts WHERE device_id IS NOT NULL;
SELECT part_number, device_id FROM parts WHERE device_id IS NULL;

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);

SELECT name FROM devices ORDER BY created_at ASC LIMIT 1;

UPDATE parts SET device_id = 1 WHERE part_number IN (2004, 2005);

SELECT * FROM parts;

/* DELETE FROM parts WHERE device_id = (SELECT id FROM devices WHERE name = 'Accelerometer'); */
DELETE FROM devices WHERE name = 'Accelerometer';
