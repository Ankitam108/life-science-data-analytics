-- Q1. ROW_NUMBER: Assign a unique row number to each
--     patient based on their age, from oldest to youngest.
SELECT 
       patient_id,
       name,
       age,
        ROW_NUMBER() OVER(ORDER BY age DESC) 
        row_number
       
FROM patients;

-- Q2. RANK: Rank patients according to their age within
--     each disease.
SELECT 
       name,
       disease,
       age,
          RANK() OVER(PARTITION BY disease ORDER BY age) 
        AS disease_rank
       
FROM patients;

-- Q3. DENSE_RANK: Rank patients according to their age
--     within each city, without gaps in ranking.
SELECT 
       name,
       city,
       age,
         DENSE_RANK() OVER(PARTITION BY city ORDER BY age) 
        AS dense_rank_age
       
FROM patients;

-- Q4. COUNT + PARTITION BY: Display each patient's
--     prescription count along with the total number
--     of prescriptions for their disease.
SELECT 
       p.patient_id,
       p.disease,
       p.name,
         COUNT(pr.prescription_id) OVER(PARTITION BY p.patient_id) 
        AS patient_prescription_count,
         COUNT(pr.prescription_id) OVER(PARTITION BY p.disease) 
        AS disease_prescription_count
       
FROM patients p
JOIN prescriptions pr
       ON p.patient_id = pr.patient_id;

-- Q5. AVG + PARTITION BY: Display each patient's age
--     along with the average age of patients in their disease.
SELECT 
       patient_id,
       name, 
       age,
       disease,
         AVG(age) OVER(PARTITION BY disease) average_age
       
FROM patients
ORDER BY 
       disease;

-- Q6. LAG: Display each patient's appointment date along
--     with the previous appointment date for the same patient.
SELECT 
       p.patient_id,
       p.name,
       a.appointment_date,
        LAG(a.appointment_date) OVER(PARTITION BY p.patient_id ORDER BY a.appointment_date ASC)
               AS previous_appointment_date
       
FROM patients p
JOIN appointments a
ON a.patient_id = p.patient_id
ORDER BY a.appointment_date ASC;

-- Q7. Running Count: Calculate the running count of
--     prescriptions for each patient ordered by
--     prescription date.
SELECT
       pr.prescription_id,
       p.patient_id,
       p.name,
       pr.prescription_date,
         COUNT(pr.prescription_id) OVER(PARTITION BY p.patient_id ORDER BY pr.prescription_date) 
       AS running_count
FROM patients p
JOIN prescriptions pr
       ON p.patient_id = pr.patient_id;
