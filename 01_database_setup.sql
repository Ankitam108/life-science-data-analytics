CREATE TABLE patients
(
  patient_id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  blood_group VARCHAR(5),
  city VARCHAR(100),
  disease VARCHAR(100)
  );
  
  INSERT INTO patients
  VALUES (1, 'ankita sharma', 25, 'female', 'B+', 'chandigarh', 'COPD'),
  (2, 'RAHUL VERMA', 35, 'male', 'O+', 'delhi', 'diabetes'),
  (3, 'priya singh', 28, 'female', 'A+', 'mohali', 'hypertension'),
  (4, 'amit kumar', 45, 'male', 'AB+', 'gurugram', 'cancer'),
  (5, 'sunita devi', 32, 'female', 'O-', 'shimla', 'COPD'),
  (6, 'neha kapoor', 29, 'female', 'B+', 'amritsar', 'asthma'),
  (7,'rohit sharma', 41, 'male', 'A+', 'chandigarh', 'diabetes'),
  (8, 'meena thakur' , 36, 'female', 'O+', 'shimla', 'hypertension'),
  (9, 'karan singh', 36, 'male', 'AB+', 'mohali', 'COPD'),
  (10, 'pooja mehta', 27, 'female', 'O-', 'delhi', 'cancer'),
  (11, 'vikas kumar', 48, 'male', 'B-', 'gurugram', 'ashthma'),
  (12, 'simran kaur',  33, 'female', 'A-', 'amritsar', 'diabetes'),
  (13, 'manish verma', 39, 'male', 'O+', 'chandigarh', 'COPD'),
  (14, 'richa sharma', 31, 'female', 'AB-', 'mohali', 'hypertension'),
  (15, 'deepak rana', 55, 'male', 'B+', 'shimla', 'cancer');
