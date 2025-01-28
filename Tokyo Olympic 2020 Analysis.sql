--- Tokyo Olympic 2020 Analysis

--1. List of athlete's names and their disciplines.
SELECT name, discipline 
FROM athletes;

--2. Find the total number of male and female entries for each displine.
SELECT discipline, male, female
FROM entries_gender
ORDER BY discipline ASC;

--3. Retrieve the names of coaches who are associated with the "Hockey" discipline.
SELECT name, discipline 
FROM coaches
WHERE discipline = 'Hockey';

--4. Display the total medal count for each National Olympic Committee (NOC).
SELECT team_noc, total 
FROM medals;

--5. Find all events and their associated teams.
SELECT event, name as teams_name
FROM teams;

--6. Show the top 5 NOCs based on the total number of medals.
SELECT team_noc, total
FROM medals
ORDER BY total DESC
Limit 5;

--7. List all disciplines with their total number of entries.
SELECT discipline, total
FROM entries_gender;

--8. Retrieve the names of athletes and their corresponding coaches who belong to the same NOC and discipline.
SELECT a.name AS athlete, c.name AS coach
FROM athletes a
INNER JOIN coaches c
ON a.discipline = c.discipline AND a.noc = c.noc

--9. Find disciplines where female entries are greater than male entries.
SELECT discipline 
FROM entries_gender 
WHERE female > male;

--10. Calculate the total number of gold, silver, and bronze medals won across all teams.
SELECT SUM(gold) AS total_gold, SUM(silver) AS total_silver, SUM(bronze) AS total_bronze 
FROM medals;

--11. List all disciplines along with the count of teams participating in each discipline.
SELECT discipline, COUNT(noc) as teams_count
FROM teams
GROUP BY discipline

--12. Retrieve the top 3 NOCs based on the number of gold medals.
SELECT team_noc , gold 
FROM medals
ORDER BY gold DESC
LIMIT 3;

--13. Find all events where a team from the "USA" NOC is participating.
SELECT name, event, discipline
FROM teams
WHERE noc = 'United States of America';

--14. List all athletes who compete in disciplines where there are more than 100 total entries.
SELECT a.name, a.discipline , e.total as total_entries
FROM athletes a
JOIN entries_gender e
ON a.discipline = e.discipline
WHERE total > 100;

--15. Find the NOCs with the lowest total medal count.
SELECT team_noc, total 
FROM medals 
WHERE total = (SELECT MIN(total) FROM medals);

--16. Determine the discipline with the highest number of entries across all genders.
SELECT * 
FROM entries_gender
ORDER BY total DESC
LIMIT 1;

--17. Find the NOC with the highest number of gold medals.
SELECT team_noc, gold 
FROM medals 
ORDER BY gold DESC 
LIMIT 1;

--18. Identify the events where teams from different NOCs compete in the same discipline.
SELECT event, discipline 
FROM teams 
GROUP BY event, discipline 
HAVING COUNT(DISTINCT noc) > 1;

--19. List all coaches who are associated with events where USA teams are participating.
SELECT DISTINCT c.name 
FROM coaches c 
JOIN teams t 
ON c.event = t.event 
WHERE t.noc = 'United States of America';

--20. Find the discipline with the largest gender disparity (absolute difference between female and male entries).
SELECT discipline, ABS(female - male) AS gender_disparity 
FROM entries_gender 
ORDER BY gender_disparity DESC 
LIMIT 1;
