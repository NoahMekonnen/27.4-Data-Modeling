-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE location
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL,
  city TEXT NOT NULL
);

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_location_id INTEGER NOT NULL REFERENCES location,
  to_location_id INTEGER NOT NULL REFERENCES location
);

CREATE TABLE people
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id INTEGER NOT NULL REFERENCES flight
);

INSERT INTO location
(country, city)
VALUES
('United States', 'Washington DC'), ('United States', 'Seattle'), ('United States', 'Los Angeles'), ('United States', 'Las Vegas'),
('United States', 'New York'), ('United States', 'Charlotte'), ('United States', 'Cedar Rapids'), ('United States', 'Chicago'),
('United States', 'New Orleans'), ('Japan', 'Tokyo'), ('United Kingdom', 'London'), ('Mexico', 'Mexico City'), ('France', 'Paris'),
('Morocco', 'Casablanca'), ('UAE', 'Dubai'), ('China', 'Beijing'), ('Brazil', 'Sao Paolo'), ('Chile', 'Santiago');

INSERT INTO flight
  (departure, arrival, airline, from_location_id, to_location_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 10, 11),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 3, 4),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 12, 7),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 13, 14),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 15, 16),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 5, 6),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 7, 8),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 6, 9),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 17, 18);

INSERT INTO people
(first_name, last_name, seat, flight_id)
VALUES
('Jennifer', 'Finch', '33B', 1),
  ('Thadeus', 'Gathercoal', '8A', 2),
  ('Sonja', 'Pauley', '12F', 3),
  ('Jennifer', 'Finch', '20A', 4),
  ('Waneta', 'Skeleton', '23D', 5),
  ('Thadeus', 'Gathercoal', '18C', 6),
  ('Berkie', 'Wycliff', '9E', 7),
  ('Alvin', 'Leathes', '1A', 8),
  ('Berkie', 'Wycliff', '32B', 9),
  ('Cory', 'Squibbes', '10D', 10);

