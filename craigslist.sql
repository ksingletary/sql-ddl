DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE Region (
    region_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE User (
    user_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    preferred_region_id INT REFERENCES Region(region_id)
);

CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT,
    user_id INT REFERENCES Users(user_id),
    region_id INT REFERENCES Region(region_id),
    category_id INT REFERENCES Category(category_id)
);

--Inserting into Tables


--Insert into Region Table

INSERT INTO Region (name)
VALUES
('Los Angeles'),
('Washington D.C.'),
('New York');

--Insert into User Table

INSERT INTO User (name, preferred_region_id)
VALUES
('John Hancock', 1);

--Insert into Category Table

INSERT INTO Category (name)
VALUES
('Gardening'),
('Entry Jobs');

--Insert into Posts Table

INSERT INTO Posts (title, text, user_id, region_id, category_id)
VALUES
('Cheap Gardening Tools', 'Looking to sell gardening tools to anyone', 1500, 1, 1);