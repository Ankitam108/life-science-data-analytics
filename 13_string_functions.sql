-- Q1. UPPER + LOWER: Display each patient's name in
--     uppercase and lowercase.
SELECT 
       name,
       UPPER(name) capital_name,
       LOWER(name) lower_name
       
FROM patients;

-- Q2. LENGTH: Find the length of each patient's name.
SELECT 
       name,
       LENGTH(name) name_length
       
FROM patients;

-- Q3. CONCAT: Display each patient's full name along
--     with a fixed label such as 'Patient: ' before the name.
SELECT 
       name,
       CONCAT('Patient', ' ', ':', ' ', name) full_patient_name
       
FROM patients;

-- Q4. SUBSTRING: Display the first three characters
--     of each patient's name.
SELECT 
       name,
       SUBSTRING(name, 1, 3) substring_name
       
FROM PATIENTS;

-- Q5. TRIM: Display patient names after removing any
--     leading or trailing spaces.
SELECT 
       name,
       LENGTH(name) name_length,
       TRIM(name) name_trim
       
from PATIENTS;

-- Q6. REPLACE: Replace a specific value in the patient's
--     city name with another value.
SELECT 
       city,
       REPLACE(city, 'gurugram', 'gurgaon') city_name
       
FROM patients;

-- Q7. String Functions + GROUP BY: Find the number of
--     patients in each city after converting city names
--     to uppercase.
SELECT 
       UPPER(city) capital_city,
       COUNT(patient_id) patient_count
       
FROM patients
GROUP BY
       UPPER(city);
