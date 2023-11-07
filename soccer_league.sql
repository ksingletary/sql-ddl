DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE Season (
    season_id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Team (
    team_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    points INT DEFAULT 0
);

CREATE TABLE Player (
    player_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INT REFERENCES Team(team_id)
);

CREATE TABLE Referee (
    referee_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Match(
    match_id SERIAL PRIMARY KEY,
    team1_id INT REFERENCES Team(team_id),
    team2_id INT REFERENCES Team(team_id),
    referee_id INT REFERENCES Referee(referee_id),
    season_id INT REFERENCES Season(season_id)
);

CREATE TABLE Goal (
    goal_id SERIAL PRIMARY KEY,
    player_id INT REFERENCES Player(player_id),
    match_id INT REFERENCES Match(match_id)
);

-- Insert into Season
INSERT INTO Season (start_date, end_date) VALUES ('2023-01-01', '2023-12-31');

-- Insert into Team
INSERT INTO Team (name, points) VALUES ('Chelsea', 4), ('Tottenham', 1);

-- Insert into Player
INSERT INTO Player (name, team_id) VALUES ('Sterling', 1), ('Son', 2);

-- Insert into Referee
INSERT INTO Referee (name) VALUES ('Referee 1');

-- Insert into Match
INSERT INTO Match (team1_id, team2_id, referee_id, season_id) VALUES (1, 2, 1, 1);

-- Insert into Goal
INSERT INTO Goal (player_id, match_id) VALUES (1, 1);