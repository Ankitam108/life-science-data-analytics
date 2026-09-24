
-- Q1. PATIENT ANALYSIS: Find the number of patients
--     in each disease and display the diseases from
--     highest to lowest patient count.
SELECT 
       disease, 
       COUNT(patient_id) patient_count
       
FROM patients
GROUP BY 
       disease
ORDER BY  
       COUNT(patient_id) DESC;

-- Q2. APPOINTMENT ANALYSIS: Find the number of
--     appointments for each doctor and identify the
--     doctors with the highest number of appointments.
SELECT 
       d.name doctor,
       COUNT(DISTINCT a.appointment_id) appointment_count
       
FROM doctors d
LEFT JOIN appointments a
       ON d.doctor_id = a.doctor_id
GROUP BY 
       d.name
ORDER BY 
       COUNT(a.appointment_id) DESC;

-- Q3. LAB TEST ANALYSIS: Find the most frequently
--     performed lab tests and display the test name
--     with the total number of tests performed.
SELECT 
       test_name,
       COUNT(test_id) test_count
       
FROM lab_tests
GROUP BY 
       test_name
ORDER BY 
       COUNT(test_id) DESC;

-- Q4. PATIENT + APPOINTMENT ANALYSIS: Find patients
--     who have had more than one appointment and display
--     their total appointment count.
SELECT 
       p.patient_id,
       COUNT(a.appointment_id) appointment_count
       
FROM appointments a 
JOIN patients p
       ON p.patient_id = a.patient_id
GROUP BY 
       p.patient_id
HAVING
       COUNT(a.appointment_id) > 1
ORDER BY 
       p.patient_id;

-- Q5. HEALTHCARE TREND ANALYSIS: Find the monthly number
--     of appointments and identify the month with the
--     highest number of appointments.
SELECT 
       EXTRACT(MONTH FROM appointment_date) 
       AS appointment_month,
       COUNT(appointment_id) 
       AS appointment_count
       
FROM APPOINTMENTS
GROUP BY 
       EXTRACT(MONTH FROM appointment_date)
ORDER BY 
       COUNT(appointment_id) DESC;

-- Q6. GENE ANALYSIS: Find the number of patients tested
--     for each gene and display the genes from highest
--     to lowest number of tests.
SELECT 
       gene_name,
       COUNT(patient_id) patient_count
       
FROM gene_tests
GROUP BY 
       gene_name
ORDER BY 
       COUNT(patient_id) DESC;

-- Q7. FINAL PATIENT INSIGHT: Create a query combining
--     patients, appointments, and lab_tests to display
--     each patient's name, disease, total appointments,
--     and total lab tests.
SELECT 
       p.name patient,
       p.disease disease,
       COUNT(DISTINCT a.appointment_id) appointment_count,
       COUNT(DISTINCT lt.test_id) test_count

FROM patients p
LEFT JOIN lab_tests lt 
       ON lt.patient_id = p.patient_id
LEFT JOIN appointments a
       ON a.patient_id = p.patient_id
GROUP BY 
       p.name, 
       p.disease;
