-- Q1. SEARCH OPTIMIZATION: Add search optimization to
--     the patients table to improve searches on the
--     patient name column.
SELECT * FROM patients;

ALTER TABLE patients
ADD SEARCH OPTIMIZATION
ON EQUALITY (name);

SHOW TABLES LIKE 'patients';

SELECT name
FROM patients
WHERE name = 'vikas kumar';

-- Q2. SEARCH OPTIMIZATION: Add search optimization to
--     the patients table to improve equality searches
--     on the city column.
SELECT * FROM patients;

ALTER TABLE patients
ADD SEARCH OPTIMIZATION
ON EQUALITY (city);

SHOW TABLES LIKE 'patients';

SELECT name, city
FROM patients
WHERE city = 'gurugram';

-- Q5. PERFORMANCE ANALYSIS: Use EXPLAIN to examine the
--     query execution plan for a query that filters
--     patients by city.
EXPLAIN
  
SELECT name, city
FROM patients
WHERE city = 'gurugram';
