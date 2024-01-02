DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY, 
    team_name TEXT NOT NUll,
    ranking INTEGER NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team1_id INTEGER NOT NULL REFERENCES teams,
    team2_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER NOT NULL REFERENCES matches,
    team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE League_times(
    id SERIAL PRIMARY KEY,
    start_time TEXT NOT NULL,
    end_time TEXT NOT NULL
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    match_id INTEGER NOT NULL REFERENCES matches,
    referee_one TEXT NOT NULL,
    assistant_ref_one TEXT NOT NULL,
    assistant_ref_two TEXT NOT NULL
);


INSERT INTO teams
(team_name, ranking)
VALUES ('Spain', 5),
('Hippo', 3);

INSERT INTO players
(name, team_id)
VALUES
('John', 1),
('Teresa', 1);

INSERT INTO matches
(team1_id, team2_id)
VALUES
(1, 2);

INSERT INTO goals
(match_id, team_id)
VALUES
(1, 1),
(1, 2),
(1, 1);

INSERT INTO League_times
(start_time, end_time)
VALUES
('12-04-2007', '07-08-2008');

INSERT INTO referees
(match_id, referee_one, assistant_ref_one, assistant_ref_two)
VALUES
(1, 'Bob', 'Jeff', 'Abraham');