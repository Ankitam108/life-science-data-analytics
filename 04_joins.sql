
-- Q1. Find all appointments with patient names and doctor names
SELECT  a.appointment_id,
        a.status,
        a.appointment_date,
        p.name AS patients,
        d.name AS doctors
FROM appointments AS a
JOIN patients AS p
ON a.patient_id = p.patient_id
JOIN doctors AS d
ON a.doctor_id = d.doctor_id;


-- Q2. Find all patients with their lab test results
SELECT p.patient_id, 
       p.name AS patients,
       p.disease,
       l.test_name,
       l.result
FROM patients AS p
JOIN lab_tests AS l
ON p.patient_id = l.patient_id;



-- Q3. Find all prescriptions with patient name and medicine name
SELECT p.name AS patients,
       m.name AS medicine,
       m.price,
       m.category,
       pr.dosage,
       pr.duration_days
FROM prescriptions AS pr
JOIN patients AS p
ON pr.patient_id = p.patient_id
JOIN medicines AS m
ON pr.medicine_id = m.medicine_id;


-- Q4. Find patients who have gene tests done
SELECT g.patient_id,
       p.name, p.disease,
       g.gene_name,
       g.test_date
FROM patients AS p
JOIN gene_tests AS g
ON p.patient_id = g.patient_id;


-- Q5. Find all patients with their doctor and medicine
SELECT p.name AS patients,
       d.name AS doctor,
       m.name AS medicine
FROM patients AS P
JOIN prescriptions AS pr
ON p.patient_id =pr.patient_id
JOIN doctors AS d
ON pr.doctor_id = d.doctor_id
JOIN medicines AS m
ON pr.medicine_id = m.medicine_id;
