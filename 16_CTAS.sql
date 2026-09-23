-- Q1. CTAS: Create a new table containing all patient
--     records from the patients table.
CREATE TABLE 
       patient_detail 
       AS
       
       SELECT patient_id, 
              name, 
              gender,
              age,
              city, 
              disease
       FROM PATIENTS;

SELECT * FROM patient_detail;

-- Q2. CTAS + WHERE: Create a new table containing only
--     patients who are above 40 years of age
CREATE TABLE 
       patient_age40
       AS 

         SELECT patient_id,
                name,
                age,
                disease
         FROM patients;
         
DROP TABLE 
       patient_age40;

CREATE TABLE 
       patient_age40 
       AS 

        SELECT patient_id, 
               name, 
               age, 
               disease, 
               city
        FROM patients  
        WHERE 
            age > 40;

SELECT * FROM patient_age40;

-- Q3. CTAS + JOIN: Create a new table containing patient
--     details along with their appointment dates.
CREATE TABLE 
       patients_appointment_table 
       AS
   
       SELECT p.patient_id, 
              p.name,
              p.age, 
              p.disease, 
              p.city,
              a.appointment_id, 
              a.appointment_date
       FROM patients p
       JOIN appointments a 
              ON p.patient_id = a.patient_id;

SELECT * FROM patients_appointment_table;

-- Q4. CTAS + GROUP BY: Create a summary table showing
--     the number of patients for each disease.
CREATE TABLE 
       patient_disease_count 
       AS

         SELECT disease,
                COUNT(DISTINCT patient_id) patients_count
         FROM patients
         GROUP BY 
              disease;

SELECT * FROM patient_disease_count;

-- Q5. CTAS + GROUP BY: Create a summary table showing
--     the number of appointments for each appointment status.
CREATE TABLE 
       statusofappointments 
       AS 

         SELECT status,
                COUNT(DISTINCT appointment_id) appointments_count
         FROM appointments
         GROUP BY 
              status;

SELECT * FROM statusofappointments;

-- Q6. CTAS + JOIN + GROUP BY: Create a summary table
--     showing the number of appointments for each disease.
CREATE TABLE 
       diseases_appointments 
       AS 

        SELECT p.disease,
               COUNT(DISTINCT a.appointment_id) appointment_countof_disease
        FROM patients p
        JOIN appointments a 
               ON p.patient_id = a.patient_id
        GROUP BY 
              p.disease;

SELECT * FROM diseases_appointments;
