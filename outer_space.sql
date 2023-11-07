-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_id TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons (
  moon_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INT REFERENCES planets(id)
);

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

INSERT INTO stars (name)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, star_id, galaxy)
VALUES
  ('Earth', 1.00, 1, 'Milky Way'),
  ('Mars', 1.88, 1, 'Milky Way'),
  ('Venus', 0.62, 1, 'Milky Way'),
  ('Neptune', 164.8, 1, 'Milky Way'),
  ('Proxima Centauri b', 0.03, 2, 'Milky Way'),
  ('Gliese 876 b', 0.23, 3, 'Milky Way');

INSERT INTO moons (name, planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 2),
  ('Thalassa', 2),
  ('Despina', 2),
  ('Galatea', 2),
  ('Larissa', 2),
  ('S/2004 N 1', 2),
  ('Proteus', 2),
  ('Triton', 2),
  ('Nereid', 2),
  ('Halimede', 2),
  ('Sao', 2),
  ('Laomedeia', 2),
  ('Psamathe', 2),
  ('Neso', 2);




  