DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    preferred_region TEXT NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text TEXT NOT NULL,
    location TEXT NOT NULL,
    region TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL REFERENCES posts,
    category TEXT NOT NULL
);

INSERT INTO users
(name, preferred_region)
VALUES
('bob', 'New York'), ('Jack', 'Atlanta');

INSERT INTO posts
(title, text, location, region, user_id)
VALUES
('chicken pics', 'Look at these sic chickens', 'Texas', 'South', 1),
('delicious ramen', 'Best ramen I''ve ever had', 'New York', 'North', 2);

INSERT INTO categories
(post_id, category)
VALUES
(1, 'farm animals'),
(2, 'restaraunt food');
