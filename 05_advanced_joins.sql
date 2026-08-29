-- Q1. Multiple JOINs: Find each patient's name, doctor name,
--     and medicine prescribed to them
SELECT p.name patients,
       d.name doctors,
       m.name medicine
FROM prescriptions pr
JOIN patients p
ON pr.patient_id = p.patient_id
JOIN doctors d
ON pr.doctor_id = d.doctor_id
JOIN medicines m
ON pr.medicine_id = m.medicine_id;

-- Q2. LEFT JOIN: Find all doctors and the patients
--     they have appointments with, including doctors
--     who have no appointments
SELECT d.name doctors,
       p.name patients
FROM doctors d
LEFT JOIN appointments a
ON d.doctor_id = a.doctor_id
LEFT JOIN patients p
ON a.patient_id = p.patient_id;

-- Q3. JOIN + GROUP BY: Find the number of patients
--     treated by each doctor
SELECT d.name doctors,
       COUNT(DISTINCT p.patient_id) patients
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
GROUP BY d.name;

-- Q4. Multiple JOINs + aggregation: Find each doctor
--     and the total number of medicines prescribed by them
SELECT d.name,
       COUNT(m.medicine_id) medicine
FROM doctors d
JOIN prescriptions p
ON p.doctor_id = d.doctor_id
JOIN medicines m
ON p.medicine_id = m.medicine_id
GROUP BY d.name;

-- Q5. SELF JOIN: Find pairs of doctors who have
--     the same specialization
SELECT d1.name doctors1,
       d2.name doctors2,
       d1.specialization
FROM doctors d1
JOIN doctors d2
ON d1.specialization = d2.specialization
WHERE d2.doctor_id < d1.doctor_id;
-- WHERE Condition is only to avoid duplicates

-- Q6. JOIN + filtering: Find patients who have both
--     a lab test and a gene test recorded
SELECT p.patient_id p_id,
       p.name patients,
       lab.test_id test_id,
       gt.gene_test_id gene_id
FROM patients p
JOIN lab_tests lab
ON p.patient_id = lab.patient_id
JOIN gene_tests gt
ON p.patient_id = gt.patient_id;
