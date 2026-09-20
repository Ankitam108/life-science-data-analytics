-- Q1. TRIGGERS: Investigate whether Snowflake supports
--     traditional database triggers such as those available
--     in PostgreSQL or MySQL.

-- Snowflake does not support traditional DML triggers.
-- Streams and Tasks are used for trigger-like automation.


-- Q2. TRIGGERS: Document the Snowflake alternatives to
--     traditional triggers for automating data-processing
--     tasks.

-- Streams → track table changes
-- Tasks → automate SQL/procedure execution
-- Stored Procedures → reusable processing logic


-- Q3. TASKS + STREAMS: Explain how Snowflake Streams and
--     Tasks can be used together to detect and process
--     changes in a table.

-- Stream captures table changes.
-- Task automatically processes those changes.


-- Q4. STREAM + TASK: Design a simple healthcare use case
--     where a Stream captures changes in the patients table
--     and a Task processes those changes automatically.

-- CREATE PATIENT_AUDIT
CREATE TABLE patient_audit 
(
  patient_id NUMBER,
  name VARCHAR,
  action_type VARCHAR,
  action_time TIMESTAMP
);
-- CREATE STREAM
CREATE STREAM patient_stream 
ON TABLE patients;

-- CREATE TASK
CREATE TASK patient_audit_task
WAREHOUSE = COMPUTE_WH
SCHEDULE = '1 HOUR'
AS
INSERT INTO patient_audit
SELECT patient_id,
       name, 
       METADATA$ACTION,
       CURRENT_TIMESTAMP()
FROM patient_stream
WHERE METADATA$ACTION ='INSERT'; 

-- RESUME TASK
ALTER TASK patient_audit_task RESUME;

-- INSERT TEST DATA
INSERT INTO patients
VALUES (22, 'Test Patient', 35, 'Female', 'O+', 'Chandigarh', 'Diabetes');

-- CHEAK PATIENT STREAM
SELECT * FROM patient_stream;

-- Run the task manually for testing
EXECUTE TASK patient_audit_task;

-- CHECK AUDIT TABLE
SELECT * 
FROM patient_audit;
