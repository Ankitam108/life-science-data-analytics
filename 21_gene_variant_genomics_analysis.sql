-- Q1. GENE ANALYSIS: Find the total number of tests
--     performed for each gene.
SELECT 
        gene_name,
        COUNT(gene_test_id) gene_test_count

FROM gene_tests
GROUP BY gene_name;

-- Q2. GENE ANALYSIS: Find the number of patients
--     tested for each gene.
SELECT 
       gene_name,
       COUNT(patient_id) patient_count

FROM gene_tests
GROUP BY gene_name;

-- Q3. GENE ANALYSIS: Find the most frequently tested
--     gene.
SELECT 
       gene_name,
       COUNT(gene_test_id) test_count
FROM gene_tests
GROUP BY  
         gene_name
ORDER BY    
        COUNT(gene_test_id) DESC;

-- Q4. VARIANT ANALYSIS: Find the number of patients
--     for each gene variant.
SELECT 
       variant_found,
       COUNT(patient_id) patient_count
FROM gene_tests
GROUP BY variant_found;

-- Q5. PATIENT + GENE ANALYSIS: Display each patient's
--     name along with the gene tested and the
--     corresponding variant/result.
SELECT 
       p.name patient_name,
       gt.gene_name gene_name,
       gt.variant_found
       
FROM patients p
LEFT JOIN gene_tests gt
          ON gt.patient_id = p.patient_id;

-- Q6. GENE + VARIANT ANALYSIS: Find the number of
--     different variants/results identified for each gene.
SELECT
        gene_name,
        COUNT(variant_found) variant_count

FROM gene_tests
GROUP BY gene_name;

-- Q7. FINAL GENOMICS ANALYSIS: Find the gene with the
--     highest number of patients tested and display
--     the gene, number of patients, and percentage of
--     all gene-tested patients.
WITH patient_count
AS
(
    SELECT
        gene_name,
        COUNT(DISTINCT patient_id) AS patient_count
    FROM gene_tests
    GROUP BY gene_name
)

SELECT
    gene_name,
    patient_count,
    ROUND(
        patient_count * 100 / SUM(patient_count) OVER (),
        2)
        AS percentage_of_all_patients
        
FROM patient_count
ORDER BY 
      patient_count DESC
LIMIT 1;
