-- Q1. GROUP BY: Count the total number of appointments
--     for each doctor
SELECT d.name doctors,
       COUNT(a.appointment_id) appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.name;

-- Q2. GROUP BY: Find the average medicine price
--     for each medicine category
SELECT category,
       ROUND(AVG(price),2) medicine_price
FROM medicines
GROUP BY category;

-- Q3. GROUP BY: Find the total number of prescriptions
--     for each patient
SELECT p.name patients,
       COUNT(pr.prescription_id) prescriptions       
FROM patients p
JOIN prescriptions pr
ON p.patient_id = pr.patient_id
GROUP BY p.name;

-- Q4. HAVING: Find doctors who have more than
--     1 appointment
SELECT d.name,
       COUNT(a.appointment_id) appointments
FROM appointments a
JOIN doctors d 
ON a.doctor_id = d.doctor_id
GROUP BY d.name
HAVING COUNT(a.appointment_id) > 1;

-- Q5. HAVING + GROUP BY: Find medicine categories
--     where the average price is greater than 500
SELECT category,
       ROUND(AVG(price),1) average_price
FROM medicines
GROUP BY category
HAVING AVG(price) > 500;

-- Q6. GROUP BY + HAVING: Find diseases with
--     more than 2 patients
SELECT disease,
       COUNT(patient_id) patients
FROM patients
GROUP BY disease
HAVING COUNT(patient_id) > 2

-- Q7. GROUP BY + JOIN + HAVING: Find doctors who
--     have treated more than 2 unique patients
SELECT d.name doctors,
       COUNT(DISTINCT p.name) patients
FROM appointments a
JOIN doctors d
ON a.doctor_id = d.doctor_id
JOIN patients p
ON a.patient_id = p.patient_id
GROUP BY d.name
HAVING COUNT(DISTINCT p.name) > 2;
