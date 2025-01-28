-- CREATING TABLES FOR ANALYSIS --

-- Athletes
CREATE TABLE athletes (
    name VARCHAR(50),               -- Athlete's name
    noc VARCHAR(50),                -- National Olympic Committee
    discipline VARCHAR(50)          -- Discipline the athlete competes in
);

-- Coaches
CREATE TABLE coaches (
    name VARCHAR(50),               -- Coach's name
    noc VARCHAR(50),                -- National Olympic Committee
    discipline VARCHAR(50),         -- Discipline the coach specializes in
    event VARCHAR(50)               -- Event the coach is associated with
);

-- Entries by Gender
CREATE TABLE entries_gender (
    discipline VARCHAR(50),         -- Discipline name
    female INT,                     -- Number of female entries
    male INT,                       -- Number of male entries
    total INT                       -- Total entries
);

-- Medals
CREATE TABLE medals (
    rank INT,                       -- Rank based on medals won
    team_noc VARCHAR(50),           -- Team or National Olympic Committee
    gold INT,                       -- Number of gold medals
    silver INT,                     -- Number of silver medals
    bronze INT,                     -- Number of bronze medals
    total INT,                      -- Total medals
    rank_by_total INT               -- Rank by total medals
);

-- Teams
CREATE TABLE teams (
    name VARCHAR(50),               -- Team name
    discipline VARCHAR(50),         -- Discipline the team competes in
    noc VARCHAR(50),                -- National Olympic Committee
    event VARCHAR(50)               -- Event the team is associated with
);
