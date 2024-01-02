DROP DATABASE IF EXISTS outer_space
CREATE DATABASE outer_space
\c outer_space

CREATE TABLE orbits_around(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE galaxies(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
)

CREATE TABLE planets(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbits_around_id INTEGER NOT NULL REFERENCES orbits_around,
    galaxy_id INTEGER NOT NULL REFERENCES galaxies
)


