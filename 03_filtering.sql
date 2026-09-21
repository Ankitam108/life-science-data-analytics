
-- Q1. WHERE + AND:
-- Find patients who are older than 35 and have diabetes
SELECT 
 name,
 age,
 gender,
 disease
FROM patients
WHERE  
 age > 35
AND
 disease ='diabetes';

-- Q2. WHERE + OR: 
-- Find patients who are from Chandigarh or Amritsar
SELECT 
 name,
 age,
 gender,
 city,
 disease
FROM patients 
WHERE 
 city = 'chandigarh' 
 OR
 city = 'amritsar';

-- Q3. IN: 
-- Find patients who are from Chandigarh, Amritsar, or Ludhiana
SELECT 
 name,
 gender,
 disease,
 city
FROM patients
WHERE 
 city IN
 ('chandigarh', 'amritsar', 'ludhiana');

-- Q4. BETWEEN: 
-- Find patients whose age is between 30 and 50
SELECT 
 name,
 age,
 disease
FROM patients
WHERE 
 age BETWEEN 30 AND 50;

-- Q5. LIKE: Find patients whose name starts with the letter A
SELECT 
 name,
 age,
 gender,
 city
FROM patients
WHERE 
 name LIKE 'a%';
