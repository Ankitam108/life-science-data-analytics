-- Q1. COALESCE: Display each patient's city.
--     If the city is NULL, display 'Unknown'.
SELECT city,
       COALESCE(city, 'Unknown') cities
FROM patients;

-- Q2. COALESCE + JOIN: Display all patients and
--     their doctor names. If a patient has no doctor,
--     display 'No Doctor Assigned'.
SELECT p.patient_id,
       p.name patient,
       d.name doctor,
        COALESCE(d.name, 'No Doctor Assigned') all_doctors
FROM patients p
LEFT JOIN appointments a
ON p.patient_id = a.patient_id
LEFT JOIN doctors d
ON a.doctor_id = d.doctor_id;

-- Q3. COALESCE: Display each patient's disease.
--     If disease is NULL, display 'Not Available'.
SELECT patient_id,
       name,
       disease,
         COALESCE(disease, 'Not Available') all_diseases
FROM PATIENTS;

-- Q4. NULLIF: Compare the number of completed and
--     scheduled appointments for each doctor.
--     Use NULLIF to avoid division by zero when
--     calculating the ratio.
SELECT d.name,
       COUNT(CASE WHEN a.status = 'Completed' THEN 1 END) AS completed_appointments,
       COUNT(CASE WHEN a.status = 'Scheduled' THEN 1 END) AS scheduled_appointments,
       COUNT(CASE WHEN a.status = 'Completed' THEN 1 END) 
       /
       NULLIF(COUNT(CASE WHEN a.status = 'Scheduled' THEN 1 END), 0)
FROM doctors d
JOIN appointments a
ON a.doctor_id = d.doctor_id
GROUP BY d.name;

-- Q5. CASE + COALESCE: Display each patient's
--     lab test result. If no test/result is available,
--     display 'No Result'.
SELECT p.patient_id,
       p.name,
         COALESCE(lt.result, 'No Result') AS result
FROM patients p
LEFT JOIN lab_tests lt
ON p.patient_id = lt.patient_id;

-- Q6. NULL handling + aggregation: Find the average
--     medicine price by category while handling
--     NULL prices appropriately.
SELECT category,
       AVG(price) average_price,
       COALESCE(AVG(price), 0) average_price2
FROM medicines
GROUP BY category;
