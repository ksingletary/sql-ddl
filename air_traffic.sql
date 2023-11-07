-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  country_id INT REFERENCES countries(id)
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat_letter TEXT NOT NULL,
  seat_number INT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  airline_id INT REFERENCES airlines(id),
  from_city_id INT REFERENCES cities(id),
  from_country_id INT REFERENCES countries(id),
  to_city_id INT REFERENCES cities(id),
  to_country_id INT REFERENCES countries(id)
);

-- Airlines
INSERT INTO airlines (name) VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

-- Countries
INSERT INTO countries (name) VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

-- Cities
INSERT INTO cities (name, country_id) VALUES
  ('Washington DC', 1),
  ('Tokyo', 2),
  ('London', 3),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('Seattle', 1),
  ('Mexico City', 4),
  ('Paris', 5),
  ('Casablanca', 6),
  ('Dubai', 7),
  ('Beijing', 8),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Sao Paolo', 9),
  ('Santiago', 10);


-- Tickets
INSERT INTO tickets
  (first_name, last_name, seat_letter, seat_number, departure, arrival, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  ('Jennifer', 'Finch', 'B', 33, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 6, 1),
  ('Thadeus', 'Gathercoal', 'A', 8, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 2, 3, 3),
  ('Sonja', 'Pauley', 'F', 12, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 4, 1, 5, 1),
  ('Jennifer', 'Finch', 'A', 20, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 6, 1, 7, 4),
  ('Waneta', 'Skeleton', 'D', 23, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9, 6),
  ('Thadeus', 'Gathercoal', 'C', 18, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11, 8),
  ('Berkie', 'Wycliff', 'E', 9, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13, 1),
  ('Alvin', 'Leathes', 'A', 1, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1),
  ('Berkie', 'Wycliff', 'B', 32, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16, 1),
  ('Cory', 'Squibbes', 'D', 10, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10);