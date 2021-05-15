CREATE DATABASE quiz;
\c quiz

DROP TABLE IF EXISTS airlines CASCADE;
CREATE TABLE airlines (
  id serial PRIMARY KEY,
  airline_name varchar(30) NOT NULL,
  country varchar(50)
);
ALTER TABLE airlines
  ADD COLUMN iata_code char(2),
  ADD COLUMN icao_code char(3),
  ADD COLUMN website varchar(40),
  ADD CHECK (length(iata_code) = 2),
  ADD CHECK (length(icao_code) = 3);
\d airlines

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id serial PRIMARY KEY,
  flight_code varchar(8) NOT NULL,
  departure_airport varchar(40),
  arrival_airport varchar(40),
  departure_date date,
  arrival_date date,
  departure_time time,
  arrival_time time,
  airline_id int
);
ALTER TABLE flights
  ADD FOREIGN KEY (airline_id)
  REFERENCES airlines(id);
\d flights

ALTER TABLE flights
  ADD CONSTRAINT departure_date_not_null
  SET departure_date NOT NULL;
