-- Importing data from CSV to tables

-- Import athletes data
COPY athletes(name, noc, discipline)
FROM 'D:\PROJECTS-1\Tokyo Olympic 2020\athletes.csv'
DELIMITER ','
CSV HEADER;

-- Import coaches data
COPY coaches(name, noc, discipline, event)
FROM 'D:\PROJECTS-1\Tokyo Olympic 2020\coaches.csv'
DELIMITER ','
CSV HEADER;

-- Import entries_gender data
COPY entries_gender(discipline, female, male, total)
FROM 'D:\PROJECTS-1\Tokyo Olympic 2020\entriesgender.csv'
DELIMITER ','
CSV HEADER;

-- Import medals data
COPY medals(rank, team_noc, gold, silver, bronze, total, rank_by_total)
FROM 'D:\PROJECTS-1\Tokyo Olympic 2020\medals.csv'
DELIMITER ','
CSV HEADER;

-- Import teams data
COPY teams(name, discipline, noc, event)
FROM 'D:\PROJECTS-1\Tokyo Olympic 2020\teams.csv'
DELIMITER ','
CSV HEADER;

-- -------------------------------
-- Confirming Data Insertion
-- -------------------------------
-- After running the import statements, it's important to confirm that data has been inserted correctly.
-- The following commands help ensure that the data was successfully imported.

-- Check the first 10 rows from athletes table to confirm data insertion
SELECT * FROM athletes LIMIT 10;

-- Check the first 10 rows from coaches table to confirm data insertion
SELECT * FROM coaches LIMIT 10;

-- Check the first 10 rows from entries_gender table to confirm data insertion
SELECT * FROM entries_gender LIMIT 10;

-- Check the first 10 rows from medals table to confirm data insertion
SELECT * FROM medals LIMIT 10;

-- Check the first 10 rows from teams table to confirm data insertion
SELECT * FROM teams LIMIT 10;

-- -------------------------------
-- Data Count Validation
-- -------------------------------
-- These count queries can help confirm the number of rows in each table,
-- ensuring that the data was successfully imported (assuming you know the expected row count).

-- Check number of rows in athletes table
SELECT COUNT(*) FROM athletes;

-- Check number of rows in coaches table
SELECT COUNT(*) FROM coaches;

-- Check number of rows in entries_gender table
SELECT COUNT(*) FROM entries_gender;

-- Check number of rows in medals table
SELECT COUNT(*) FROM medals;

-- Check number of rows in teams table
SELECT COUNT(*) FROM teams;

-- -------------------------------


