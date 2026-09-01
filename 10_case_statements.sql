-- Q1. CASE: Classify patients by age as
--     Young, Middle Aged, or Senior
SELECT name,
       age,
       CASE
           WHEN age > 50 THEN 'Senior'
           WHEN age > 30 THEN 'Middle Aged'
           ELSE 'Young'
           END AS age_category
FROM patients
ORDER BY age;

-- Q2. CASE: Classify medicines by price as
--     Affordable, Moderate, or Expensive
SELECT name, 
       price,
       CASE
           WHEN price > 500 THEN 'Expensive'
           WHEN price > 100 THEN 'Moderate'
           ELSE 'Affordable'
           END AS price_category
FROM MEDICINES;

-- Q3. CASE: Classify appointments based on their
--     status as Completed, Scheduled, or Other
SELECT appointment_id, 
       appointment_date, 
       status,
       CASE
           WHEN status = 'Scheduled' THEN 'Pending'
           WHEN status = 'Completed' THEN 'Checked'
           ELSE 'Others'
           END AS status_details
FROM APPOINTMENTS;

-- Q4. CASE + calculation: Display each medicine's
--     price and calculate a discounted price.
--     Apply a 10% discount to medicines costing
--     more than 500, otherwise keep the original price.
SELECT price,
       CASE
           WHEN price > 500 THEN price - (price*0.10)
           ELSE price
           END AS medicine_price
FROM medicines;

-- Q5. CASE + aggregation: Count how many patients
--     belong to each age category
--     (Young, Middle Aged, Senior)
SELECT CASE 
            WHEN age > 50 THEN 'Senior'
            WHEN age > 30 THEN 'Middle aged'
            ELSE 'Young'
            END AS age_category,
       COUNT(*) patients
FROM patients
GROUP BY CASE 
             WHEN age > 50 THEN 'Senior'
             WHEN age > 30 THEN 'Middle aged'
             ELSE 'Young'
       END;

-- Q6. CASE: Create a health-risk category for patients:
--     age above 60 = High Risk
--     age 40–60 = Moderate Risk
--     below 40 = Low Risk
SELECT p.age,
       m.category,
       CASE 
            WHEN p.age > 60 THEN 'High Risk'
            WHEN p.age BETWEEN 40 AND 60 THEN 'Moderate Risk'
            ELSE 'Low Risk'
            END AS health_risk_category
FROM patients p
JOIN prescriptions pr
ON p.patient_id = pr.patient_id
JOIN medicines m
ON pr.medicine_id = m.medicine_id;
