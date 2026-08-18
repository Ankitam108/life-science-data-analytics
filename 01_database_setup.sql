-- TABLE 1: PATIENTS
CREATE TABLE patients
( patient_id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  blood_group VARCHAR(5),
  city VARCHAR(100),
  disease VARCHAR(100)
  );
  
  INSERT INTO patients
  VALUES 
  (1, 'ankita sharma', 25, 'female', 'B+', 'chandigarh', 'COPD'),
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

--TABLE 2: DOCTORS
CREATE TABLE doctors 
( doctor_id INT PRIMARY KEY,
  name VARCHAR(100),
  specialization VARCHAR(100),
  department VARCHAR(100),
  experience_years INT,
  phone VARCHAR(15)
  );

INSERT INTO doctors 
VALUES
(1, 'Dr. Rajesh Kumar', 'Genetics', 'Molecular Biology', 15, '9876543220'),
(2, 'Dr. Sunita Sharma', 'Cardiology', 'Heart Care', 10, '9876543221'),
(3, 'Dr. Amit Gupta', 'Endocrinology', 'Diabetes Care', 8, '9876543222'),
(4, 'Dr. Priya Nair', 'Oncology', 'Cancer Care', 12, '9876543223'),
(5, 'Dr. Vikram Singh', 'Pulmonology', 'Lung Care', 7, '9876543224');

-- TABLE 3: APPOINTMENTS
CREATE TABLE appointments 
( appointment_id INT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,   
  appointment_date DATE,
  status VARCHAR(20),
  notes TEXT,
  FOREIGN KEY (patient_id) 
  REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) 
  REFERENCES doctors(doctor_id)
   );

INSERT INTO appointments 
VALUES
(1, 1, 1, '2026-01-15', 'Completed', 'COPD checkup'),
(2, 2, 3, '2026-01-20', 'Completed', 'Diabetes review'),
(3, 3, 2, '2026-02-10', 'Completed', 'BP checkup'),
(4, 4, 4, '2026-02-15', 'Completed', 'Cancer followup'),
(5, 5, 5, '2026-03-01', 'Completed', 'COPD treatment'),
(6, 1, 5, '2026-03-10', 'Scheduled', 'COPD followup'),
(7, 2, 3, '2026-03-15', 'Scheduled', 'Diabetes checkup'),
(8, 6, 5, '2026-03-20', 'Scheduled', 'Asthma review');

--TABLE 4: LAB TESTS
CREATE TABLE lab_tests 
( test_id INT PRIMARY KEY,
  patient_id INT,
  test_name VARCHAR(100),
  test_date DATE,
  result VARCHAR(200),
  normal_range VARCHAR(100),
  status VARCHAR(20),
  FOREIGN KEY (patient_id) 
  REFERENCES patients(patient_id)
   );

INSERT INTO lab_tests 
VALUES
(1, 1, 'Blood Count', '2026-01-16', 'Abnormal', '4000-11000', 'Done'),
(2, 2, 'Blood Sugar', '2026-01-21', '180 mg/dl', '70-100', 'Done'),
(3, 3, 'Blood Pressure', '2026-02-11', '150/90', '120/80', 'Done'),
(4, 4, 'Tumor Marker', '2026-02-16', 'Elevated', 'Normal', 'Done'),
(5, 1, 'Lung Function', '2026-03-11', 'Reduced', 'Normal', 'Done');

--TABLE 5: MEDICINE
CREATE TABLE medicines 
( medicine_id INT PRIMARY KEY,
  name VARCHAR(100),
  category VARCHAR(100),
  price DECIMAL(10,2),
  stock_quantity INT,
  manufacturer VARCHAR(100)
  );

INSERT INTO medicines 
VALUES
(1, 'Metformin', 'Diabetes', 50.00, 500, 'Sun Pharma'),
(2, 'Amlodipine', 'Hypertension', 30.00, 300, 'Cipla'),   
(3, 'Salbutamol', 'Respiratory', 80.00, 200, 'GSK'),
(4, 'Prednisolone', 'COPD', 60.00, 400, 'Abbott'),
(5, 'Paclitaxel', 'Cancer', 5000.00, 50, 'Roche');

--TABLE 6: PRESCRIPTIONS
CREATE TABLE prescriptions 
( prescription_id INT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  medicine_id INT,
  dosage VARCHAR(100),
  duration_days INT,
  prescription_date DATE,
  FOREIGN KEY (patient_id) 
  REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) 
  REFERENCES doctors(doctor_id),
  FOREIGN KEY (medicine_id) 
  REFERENCES medicines(medicine_id)
   );

INSERT INTO prescriptions 
VALUES
(1, 1, 1, 4, '2 times daily', 30, '2026-01-15'),
(2, 2, 3, 1, '1 time daily', 60, '2026-01-20'),
(3, 3, 2, 2, '1 time daily', 30, '2026-02-10'),
(4, 4, 4, 5, 'As directed', 90, '2026-02-15'),
(5, 5, 5, 3, '2 times daily', 30, '2026-03-01');

--TABLE 7: GENE TESTS
CREATE TABLE gene_tests 
( gene_test_id INT PRIMARY KEY,
  patient_id INT,
  gene_name VARCHAR(100),
  variant_found VARCHAR(100),
  chromosome VARCHAR(10),
  test_date DATE,
  result VARCHAR(200),
  FOREIGN KEY (patient_id) 
  REFERENCES patients(patient_id)
   );

INSERT INTO gene_tests 
VALUES
(1, 1, 'Galectin-3', 'rs4644', 'Chr19', '2026-01-20', 'Variant detected'),
(2, 2, 'BRCA1', 'rs1799950', 'Chr17', '2026-02-25', 'No variant found'),
(3, 4, 'TP53', 'Mutation', 'Chr17', '2026-03-15', 'Variant detected'),
(4, 10, 'EGFR', 'Deletion', 'Chr7', '2026-03-20', 'Variant detected'),
(5, 5, 'CFTR', 'rs75961395', 'Chr7', 2026-03-25', 'No variant found');
