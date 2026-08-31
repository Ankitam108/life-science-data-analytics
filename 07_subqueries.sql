
-- Q1. Subquery with IN: Find patients who have
--     at least one scheduled appointment
SELECT name patients
FROM patients
WHERE patient_id IN
(
SELECT patient_id
FROM appointments
WHERE status ='Scheduled'
 );
 
-- Q2. Scalar subquery: Find medicines that are
--     more expensive than the average medicine price
SELECT name medicine
FROM medicines
WHERE price >
(
SELECT AVG(price) average_price
FROM medicines
);

-- Q3. Scalar subquery: Find patients whose age is
--     greater than the average patient age
SELECT name
FROM patients
WHERE age > 
(
SELECT AVG(age) 
FROM patients
);

-- Q4. Subquery with MAX: Find the most expensive
--     medicine
SELECT name medicine
FROM medicines
WHERE price =
(
SELECT MAX(price)
FROM medicines
);

-- Q5. Subquery with NOT IN: Find patients who have
--     never had an appointment
SELECT name
FROM patients
WHERE patient_id NOT IN 
(
SELECT patient_id
FROM appointments
WHERE patient_id IS NOT NULL
);

-- Q6. Correlated subquery: Find doctors who have
--     at least one prescription
SELECT d.name
FROM doctors d
WHERE EXISTS
(
SELECT 1
FROM prescriptions p
WHERE p.doctor_id = d.doctor_id
);

-- Q7. Correlated subquery: Find patients whose age
--     is greater than the average age of patients
--     with the same disease
SELECT name
FROM patients p1
WHERE p1.age >
(
SELECT AVG(age) average_age
FROM patients p2
WHERE p2.disease = p1.disease
);
