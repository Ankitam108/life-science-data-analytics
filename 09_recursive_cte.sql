-- Q1. RECURSIVE CTE: Generate a sequence of numbers
--     from 1 to 10 using a recursive CTE.
WITH RECURSIVE 
   my_cte 
   AS
   (
    SELECT 1 AS n
  
    UNION ALL

    SELECT n+1 
    FROM my_cte
    WHERE n < 10
    )
   
SELECT * FROM my_cte;

-- Q2. RECURSIVE CTE: Generate all dates from the
--     earliest appointment date to the latest appointment
--     date, one day at a time
WITH RECURSIVE 
   appointment_date_series 
   AS
   (
      SELECT MIN(appointment_date) AS earliest_date
            FROM appointments 
  
      UNION ALL
  
      SELECT DATEADD(DAY, 1, earliest_date)
      FROM appointment_date_series
      WHERE earliest_date < (SELECT 
                              MAX(appointment_date) 
                              FROM appointments)
   )
   
SELECT earliest_date::DATE 
   AS recursive_appointment_dates
FROM appointment_date_series;

-- Q3. RECURSIVE CTE: Generate a sequence of appointment
--     days starting from the earliest appointment date
--     and continue for 30 days.

WITH RECURSIVE 
   appointment_dates_sequence
   AS
   (
    SELECT MIN(appointment_date) AS earliest_date,
           MIN(appointment_date) AS start_date
    FROM appointments

    UNION ALL

    SELECT DATEADD(DAY, 1, earliest_date),
           start_date
    FROM appointment_dates_sequence
    WHERE earliest_date < DATEADD(DAY, 30, start_date)
   )

SELECT earliest_date::DATE
FROM appointment_dates_sequence;
