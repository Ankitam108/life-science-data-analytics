-- Q1. Basic WHERE: Find patients from Chandigarh
SELECT *
FROM patients
WHERE city = 'chandigarh';

-- Q2. WHERE + comparison operator: Find patients older than 35
SELECT *
FROM patients
WHERE age > 35;

-- Q3. COUNT + GROUP BY: Count patients for each disease
SELECT disease, COUNT(*) AS patient_count
FROM patients
GROUP BY disease;

-- Q4. AVG + GROUP BY: Find average age for each disease
SELECT disease, AVG(age) AS average_count
FROM patients
GROUP BY disease;

-- Q5. MAX + GROUP BY: Find the oldest patient in each city
SELECT city, MAX(age) AS max_age
FROM patients
GROUP BY city;
