-- Q1. MICRO-PARTITIONS: Examine the metadata of the
--     patients table and identify information related
--     to Snowflake micro-partitions.
USE SCHEMA RAW_DATA;
SELECT * FROM PATIENTS;
SHOW TABLES LIKE 'PATIENTS';

-- Q2. CLUSTERING: Create a clustered table from appointments
--     using appointment_date as the clustering key.
CREATE TABLE appointment_clustering
CLUSTER BY (appointment_date)
AS
SELECT * FROM appointments;

SELECT * FROM appointment_clustering;

-- Q3. MICRO-PARTITIONS: Use SYSTEM$CLUSTERING_INFORMATION
--     to examine the clustering information of the
--     appointments table.
SELECT SYSTEM$CLUSTERING_INFORMATION ('appointment_clustering');

-- Q4. CLUSTERING INFORMATION: Check the clustering
--     information of the clustered appointments table.
SHOW TABLES LIKE 'appointment_clustering'; 

--CAN ALSO USE DESCRIBE
DESCRIBE TABLE appointment_clustering;

-- Q5. CLUSTERING KEY: Alter the clustered appointments
--     table to use patient_id as an additional clustering
--     column.
ALTER TABLE appointment_clustering
CLUSTER BY (appointment_date, patient_id);

SELECT * FROM appointment_clustering;
