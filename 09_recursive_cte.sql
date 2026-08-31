-- Q1. Simple CTE: Find patients whose age is
--     greater than 40
WITH patients_age50 AS
(
    SELECT patient_id,
           name
    FROM patients 
    WHERE age > 50
)
SELECT * FROM patients_age50;

-- Q2. CTE + aggregation: Find the average age
--     of patients for each disease
WITH disease_average_age AS 
(
    SELECT disease, 
           AVG(age) average_age
    FROM patients
    GROUP BY disease
)
SELECT * FROM disease_average_age;

-- Q3. CTE + JOIN: Find patients who have
--     scheduled appointments
WITH scheduled_patients AS
(
     SELECT name,
     FROM patients p
     JOIN appointments a
     ON p.patient_id = a.patient_id
     WHERE status = 'Scheduled'
)
SELECT * FROM scheduled_patients;

-- Q4. Multiple CTEs: Find doctors who have
--     more than 1 appointment and show their
--     total appointments
WITH total_appointments AS 
(
    SELECT doctor_id,
           COUNT(*) AS total_appointment
    FROM appointments  
    GROUP BY doctor_id
),
  appointment_atleast_one AS
(
    SELECT doctor_id,
           total_appointment
    FROM total_appointments
    WHERE total_appointment > 1
)
    SELECT d.name,
           aao.doctor_id,
           aao.total_appointment
    FROM doctors d
    JOIN appointment_atleast_one aao
    ON d.doctor_id = aao.doctor_id;
    
-- Q5. CTE + GROUP BY + HAVING: Find medicine
--     categories whose average price is greater
--     than the overall average medicine price
WITH medicine_overall_average AS
(
    SELECT AVG(price) overall_average
    FROM medicines
),
  medicine_category_average AS 
(
    SELECT category, 
           AVG(price) category_average
    FROM medicines
    GROUP BY category
),
  category_greater_overall AS
(
    SELECT mca.category,
           mca.category_average,
           moa.overall_average
    FROM medicine_category_average mca
    CROSS JOIN medicine_overall_average moa
    WHERE mca.category_average > moa.overall_average
)
SELECT * FROM category_greater_overall;

-- Q6. CTE + window function: Rank patients
--     by age within each disease
WITH age_rank AS
(
    SELECT name, disease, age,
           RANK() OVER(PARTITION BY disease ORDER BY age)
           AS age_rank
    FROM patients
)
SELECT * FROM age_rank;
