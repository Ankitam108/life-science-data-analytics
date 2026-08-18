
-- Q6. WHERE + AND: Find patients who are older than 35 and have diabetes
SELECT *
FROM patients
WHERE  age > 35
AND disease ='diabetes';

-- Q7. WHERE + OR: Find patients who are from Chandigarh or Amritsar
SELECT *
FROM patients 
WHERE city = 'chandigarh' 
 OR   city = 'amritsar';

-- Q8. IN: Find patients who are from Chandigarh, Amritsar, or Ludhiana
SELECT *
FROM patients
WHERE city IN('chandigarh', 'amritsar', 'ludhiana');

-- Q9. BETWEEN: Find patients whose age is between 30 and 50
SELECT *
FROM patients
WHERE age BETWEEN 30 AND 50;

-- Q10. LIKE: Find patients whose name starts with the letter A
SELECT *
FROM patients
WHERE name LIKE 'a%';
