-- Q1. SQL FUNCTION: Create a function that accepts a
--     patient's age and returns whether the patient is
--     an adult or minor.
CREATE OR REPLACE FUNCTION 
  patients_age (age NUMBER)
RETURNS VARCHAR
LANGUAGE SQL
AS
  
$$
  
     CASE
     WHEN age >= 18 THEN 'Adult'
     ELSE 'Minor'
     END
  
$$;

SELECT age, patients_age(age)
FROM patients;

-- Q2. SQL FUNCTION: Create a function that accepts a
--     patient's age and returns the patient's age group:
--     'Young', 'Middle-aged', or 'Senior'.
CREATE OR REPLACE FUNCTION 
  patient_age_detail(age NUMBER)
RETURNS VARCHAR
LANGUAGE SQL
AS
  
$$
  
  CASE 
  WHEN age >= 60 THEN 'Senior'
  WHEN age >= 30 THEN 'Middle-aged'
  ELSE 'Young'
  END
  
$$;

SELECT age, patient_age_detail(age) age_detail
FROM patients; 

-- Q3. SQL FUNCTION: Create a function that accepts a
--     disease name and returns the number of patients
--     having that disease.
CREATE FUNCTION 
  disease_name(disease_name VARCHAR)
RETURNS NUMBER
LANGUAGE SQL 
AS
  
$$
  SELECT COUNT(patient_id)
  FROM patients
  WHERE disease = disease_name
  
$$;

SELECT disease_name ('asthma');

-- Q4. STORED PROCEDURE: Create a stored procedure that
--     displays all patients belonging to a given city.
CREATE OR REPLACE PROCEDURE 
  patient_city(city_name VARCHAR)
RETURNS TABLE (
    patient_id NUMBER,
    name VARCHAR
  )
LANGUAGE SQL
AS
  
$$
  
DECLARE
    res RESULTSET;

BEGIN
    res := (
        SELECT patient_id, name
        FROM patients
        WHERE city = :city_name
    );

    RETURN TABLE(res);

END;

$$;

CALL patient_city('gurugram');

-- Q5. STORED PROCEDURE: Create a stored procedure that
--     inserts a new patient record into the patients table.

CREATE OR REPLACE PROCEDURE 
  new_patients 
         (p_patient_id NUMBER,
          p_name VARCHAR,
          p_age NUMBER,
          p_gender VARCHAR,
          p_blood_group VARCHAR,
          p_city VARCHAR,
          p_disease VARCHAR)
RETURNS VARCHAR
LANGUAGE SQL
AS
  
$$
BEGIN 
  
    INSERT INTO patients (patient_id,
                 name,
                 age, 
                 gender,
                 blood_group,
                 city,
                 disease)
  
    VALUES (:p_patient_id,
            :p_name,
            :p_age,
            :p_gender,
            :p_blood_group,
            :p_city,
            :p_disease);

RETURN 'Patient inserted successfully';
END;

$$;

CALL new_patients (21, 'Rahul', 25, 'M', 'O+', 'gurugram', 'COPD');

SELECT * FROM PATIENTS;

SELECT * FROM PATIENTS 
WHERE patient_id = 21;
