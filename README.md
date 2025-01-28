# Olympic Data Analysis Project

## Project Overview
This project involves analyzing Olympic data using PostgreSQL. The data spans multiple aspects of the Olympics, including athletes, coaches, gender-based entries, medal tallies, and team participation. By leveraging SQL queries, we aim to extract meaningful insights from the data.

---

## Tools and Technologies
- **Database:** PostgreSQL
- **Data Loading:** COPY command for efficient data ingestion
- **Analysis:** SQL queries

---

## Database Setup

### 1. Create Tables
We designed and created the following tables:

- **athletes**: Contains information about athletes, including their names, National Olympic Committees (NOCs), and disciplines.
- **coaches**: Stores details about coaches, their NOCs, disciplines, and associated events.
- **entries_gender**: Tracks gender-based entries for each discipline.
- **medals**: Summarizes medal tallies for each NOC.
- **teams**: Includes data about teams, their disciplines, NOCs, and events.

The SQL scripts used to create these tables are as follows:
```sql
-- Athletes Table
CREATE TABLE athletes (
    name VARCHAR(50),
    noc VARCHAR(50),
    discipline VARCHAR(50)
);

-- Coaches Table
CREATE TABLE coaches (
    name VARCHAR(50),
    noc VARCHAR(50),
    discipline VARCHAR(50),
    event VARCHAR(50)
);

-- Entries by Gender Table
CREATE TABLE entries_gender (
    discipline VARCHAR(50),
    female INT,
    male INT,
    total INT
);

-- Medals Table
CREATE TABLE medals (
    rank INT,
    team_noc VARCHAR(50),
    gold INT,
    silver INT,
    bronze INT,
    total INT,
    rank_by_total INT
);

-- Teams Table
CREATE TABLE teams (
    name VARCHAR(50),
    discipline VARCHAR(50),
    noc VARCHAR(50),
    event VARCHAR(50)
);
```

### 2. Load Data
Data was loaded into the PostgreSQL database using the `COPY` command for efficiency. Below is an example of loading data into the `athletes` table:
```sql
COPY athletes (name, noc, discipline) 
FROM '/path/to/athletes.csv' 
DELIMITER ',' 
CSV HEADER;
```
Ensure that the file paths are correct and accessible by the PostgreSQL instance, and the user has the necessary permissions.

---

## Analysis Questions

### 1. **List all athletes' names and their disciplines.**
```sql
SELECT name, discipline 
FROM athletes;
```

### 2. **Find the total number of male and female entries for each discipline.**
```sql
SELECT discipline, female, male 
FROM entries_gender;
```

### 3. **Retrieve the names of coaches who are associated with the "Swimming" discipline.**
```sql
SELECT name 
FROM coaches 
WHERE discipline = 'Swimming';
```

### 4. **Display the total medal count for each National Olympic Committee (NOC).**
```sql
SELECT team_noc, total 
FROM medals;
```

### 5. **Find all events and their associated teams.**
```sql
SELECT event, name AS team_name 
FROM teams;
```

### 6. **Show the top 5 NOCs based on the total number of medals.**
```sql
SELECT team_noc, total 
FROM medals 
ORDER BY total DESC 
LIMIT 5;
```

### 7. **List all disciplines with their total number of entries.**
```sql
SELECT discipline, total 
FROM entries_gender;
```

### 8. **Retrieve the names of athletes and their corresponding coaches who belong to the same NOC and discipline.**
```sql
SELECT a.name AS athlete, c.name AS coach 
FROM athletes a 
JOIN coaches c 
ON a.noc = c.noc AND a.discipline = c.discipline;
```

### 9. **Find disciplines where female entries are greater than male entries.**
```sql
SELECT discipline 
FROM entries_gender 
WHERE female > male;
```

### 10. **Calculate the total number of gold, silver, and bronze medals won across all teams.**
```sql
SELECT SUM(gold) AS total_gold, SUM(silver) AS total_silver, SUM(bronze) AS total_bronze 
FROM medals;
```

### 11. **List all disciplines along with the count of teams participating in each discipline.**
```sql
SELECT discipline, COUNT(*) AS team_count 
FROM teams 
GROUP BY discipline;
```

### 12. **Retrieve the top 3 NOCs based on the number of gold medals.**
```sql
SELECT team_noc, gold 
FROM medals 
ORDER BY gold DESC 
LIMIT 3;
```

### 13. **Find all events where a team from the "USA" NOC is participating.**
```sql
SELECT event 
FROM teams 
WHERE noc = 'USA';
```

### 14. **List all athletes who compete in disciplines where there are more than 100 total entries.**
```sql
SELECT a.name, a.discipline 
FROM athletes a 
JOIN entries_gender e 
ON a.discipline = e.discipline 
WHERE e.total > 100;
```

### 15. **Find the NOCs with the lowest total medal count.**
```sql
SELECT team_noc, total 
FROM medals 
WHERE total = (SELECT MIN(total) FROM medals);
```

### 16. **Determine the discipline with the highest number of entries across all genders.**
```sql
SELECT discipline 
FROM entries_gender 
ORDER BY total DESC 
LIMIT 1;
```

### 17. **Find the NOC with the highest number of gold medals.**
```sql
SELECT team_noc, gold 
FROM medals 
ORDER BY gold DESC 
LIMIT 1;
```

### 18. **Identify the events where teams from different NOCs compete in the same discipline.**
```sql
SELECT event, discipline 
FROM teams 
GROUP BY event, discipline 
HAVING COUNT(DISTINCT noc) > 1;
```

### 19. **List all coaches who are associated with events where USA teams are participating.**
```sql
SELECT DISTINCT c.name 
FROM coaches c 
JOIN teams t 
ON c.event = t.event 
WHERE t.noc = 'USA';
```

### 20. **Find the discipline with the largest gender disparity (absolute difference between female and male entries).**
```sql
SELECT discipline, ABS(female - male) AS gender_disparity 
FROM entries_gender 
ORDER BY gender_disparity DESC 
LIMIT 1;
```

---

## Conclusion
This project demonstrates the power of PostgreSQL for analyzing complex datasets like Olympic data. By creating a structured database and using efficient SQL queries, we extracted insights across multiple dimensions. The project serves as a portfolio showcase of skills in database design, data loading, and SQL analysis.

