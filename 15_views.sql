
-- Q1. CREATE VIEW: Create a view that displays
--     basic patient information including patient_id,
--     full_name, age, gender, and disease.
CREATE VIEW patients_details AS

   SELECT patient_id, name AS full_name, age, gender, disease
   FROM patients;

SELECT * FROM patients_details;

-- Q2. CREATE VIEW + JOIN: Create a view that displays
--     patient details along with their appointment dates.
CREATE VIEW patient_appointment AS

    SELECT p.patient_id, p.name, p.disease, p.age, p.blood_group,
           a.appointment_date
    FROM patients p
    JOIN appointments a
    ON a.patient_id = p.patient_id;

SELECT * FROM patient_appointment;

--OTHER WAY
CREATE VIEW patient_appointment2 AS 

    SELECT pd.patient_id, pd.full_name, pd.age, pd.gender, pd.disease,
            a.appointment_date
    FROM patients_details pd
    JOIN appointments a
    ON a.patient_id = pd.patient_id;

SELECT * FROM patient_appointment2;

-- Q3. CREATE VIEW + JOIN: Create a view that displays
--     patient names, prescription details, and medicine names.
CREATE VIEW patient_prescription_medicine AS 

    SELECT p.name patient,
           pr.dosage, pr.duration_days, pr.prescription_date,
           m.name medicine
    FROM patients p
    JOIN prescriptions pr
    ON pr.patient_id = p.patient_id
    JOIN medicines m
    ON pr.medicine_id = m.medicine_id;
    
SELECT * FROM patient_prescription_medicine;

-- Q4. CREATE VIEW + WHERE: Create a view containing
--     only patients who have appointments with a specific
--     appointment status.
CREATE VIEW patient_appointment_scheduled AS

       SELECT p.patient_id, p.name, p.disease,
              a.appointment_id, a.status
       FROM appointments a
       JOIN patients p 
       ON p.patient_id = a.patient_id
       WHERE a.status = 'Scheduled';

SELECT * FROM patient_appointment_scheduled;

-- Q5. CREATE OR REPLACE VIEW: Modify an existing patient
--     view to include the patient's city.
CREATE OR REPLACE VIEW patient_appointment2 AS 
        
        SELECT pd.patient_id, pd.age, pd.gender, pd.disease,
               p.city
        FROM patients_details pd
        JOIN patients p
        ON p.patient_id = pd.patient_id;
    
SELECT * FROM patient_appointment2;

-- Q6. QUERY A VIEW: Using one of the views created above,
--     find the number of patients in each disease.
CREATE OR REPLACE VIEW patient_count AS

       SELECT disease,
              COUNT(DISTINCT patient_id) total_patients
       FROM patients_details
       GROUP BY disease
       ORDER BY disease;

SELECT * FROM patient_count;
