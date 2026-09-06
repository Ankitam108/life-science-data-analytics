-- Q1. DATE PARTS: Display each appointment's date,
--     year, month, and day.
SELECT appointment_date,
       DATE_PART('Day', appointment_date) appointment_day,
       DATE_PART('Month', appointment_date) appointment_month,
       TO_CHAR(appointment_date, 'MMMM') appointment_month2,
       DATE_PART('Year', appointment_date) appointment_year
FROM APPOINTMENTS;

-- Q2. EXTRACT: Find the number of appointments
--     for each month.
SELECT EXTRACT(Month FROM appointment_date) AS appointment_month,
       COUNT(appointment_id) AS total_appointments
FROM appointments
GROUP BY EXTRACT(Month FROM appointment_date);

-- Q3. DATE_TRUNC: Find the number of appointments
--     for each month using the first day of the month.
SELECT DATE_TRUNC('Month', appointment_date) month_truncate,
       COUNT(appointment_id) total_appointments
FROM appointments
GROUP BY DATE_TRUNC('Month', appointment_date);

-- Q4. DATEDIFF: Find the number of days between
--     a patient's lab test date and their appointment date.
SELECT lb.test_name,
       lb.test_date,
       a.appointment_date,
       ABS(DATEDIFF(DAYS, lb.test_date, a.appointment_date)) date_difference
FROM lab_tests lb
JOIN appointments a 
ON lb.patient_id = a.patient_id;

-- Q5. DATEADD: Find the date that is 30 days after
--     each appointment date.
SELECT appointment_date,
       DATEADD(DAY, 30, appointment_date)
FROM appointments;

-- Q6. DATE_TRUNC + GROUP BY: Find the number of
--     appointments for each quarter.
SELECT DATE_TRUNC(QUARTER, appointment_date) quarter_appointments,
       COUNT(appointment_id) total_appointments
FROM appointments
GROUP BY DATE_TRUNC(QUARTER, appointment_date);

-- Q7. Date comparison: Find patients who had a
--     prescription within 7 days of their appointment.
SELECT p.patient_id,
       p.name,
       a.appointment_date,
       pr.prescription_date
FROM patients p
JOIN appointments a
ON p.patient_id = a.patient_id
JOIN prescriptions pr
ON p.patient_id = pr.patient_id
WHERE DATEDIFF(DAYS, a.appointment_date, pr.prescription_date) BETWEEN 0 AND 7;

-- Q8. DATEDIFF + AVG: Find the average number of days
--      between a patient's appointment date and lab test date.
SELECT ABS(AVG(DATEDIFF(DAY, lt.test_date, a.appointment_date))) average_days
FROM patients p
JOIN appointments a
ON p.patient_id = a.patient_id
JOIN lab_tests lt
ON lt.patient_id = p.patient_id;
