# Life Science Data Analytics — SQL Project

## About

A comprehensive SQL portfolio project combining **Healthcare Analytics with Genomics/Gene Variant Tracking**. The project demonstrates SQL skills ranging from fundamentals to advanced database and analytical concepts, using **Snowflake**.

The project combines healthcare data such as patients, doctors, appointments, laboratory tests, medicines, and prescriptions with genomic data for gene variant analysis.

## Database Structure

**Database:** `HEALTHCARE_ANALYTICS`  
**Schema:** `RAW_DATA`

### Tables

- `patients` — Patient demographic and disease information
- `doctors` — Specialist doctor information
- `appointments` — Patient-doctor appointments
- `lab_tests` — Diagnostic laboratory test results
- `medicines` — Medicine inventory and pricing
- `prescriptions` — Medicines prescribed to patients
- `gene_tests` — Gene testing and gene variant tracking

## SQL Topics Covered

The project covers SQL concepts from beginner to advanced level:

- SELECT and basic queries
- Filtering and operators
- Aggregate functions
- Basic Joins
- Advanced Joins
- GROUP BY and HAVING
- Subqueries
- CTEs
- Recursive CTEs
- CASE statements
- NULL handling and NULL functions
- Date and Time functions
- String functions
- Window functions
- Views
- CTAS (CREATE TABLE AS SELECT)
- Indexing concepts
- Table Partitioning
- Stored Procedures and Functions
- Triggers
- Healthcare and Genomics data analysis

## SQL Files

| File | Topics Covered |
|---|---|
| `01_database_setup.sql` | Tables + Data |
| `02_aggregate_functions.sql` | COUNT, AVG, MAX, SUM, MIN |
| `03_filtering.sql` | WHERE, AND, OR, IN, BETWEEN, LIKE |
| `04_joins_basic.sql` | INNER, LEFT, RIGHT, FULL JOIN |
| `05_joins_advanced.sql` | Multiple Joins, Self Joins, Advanced Join Queries |
| `06_group_by_having.sql` | GROUP BY, HAVING |
| `07_subqueries.sql` | Scalar, Multi-row, Correlated Subqueries |
| `08_cte.sql` | Common Table Expressions |
| `09_recursive_cte.sql` | Recursive CTE |
| `10_case_statements.sql` | CASE Expressions |
| `11_null_functions.sql` | COALESCE, NULLIF, NULL Handling |
| `12_date_time_functions.sql` | Date and Time Analysis |
| `13_string_functions.sql` | String Manipulation |
| `14_window_functions.sql` | Ranking, LAG, LEAD, Running Totals |
| `15_views.sql` | CREATE VIEW, Querying Views |
| `16_ctas.sql` | CREATE TABLE AS SELECT |
| `17_indexing.sql` | Indexing Concepts |
| `18_table_partitioning.sql` | Table Partitioning |
| `19_stored_procedures_functions.sql` | Stored Procedures and Functions |
| `20_triggers.sql` | Triggers |
| `21_gene_analysis.sql` | Gene Variant and Genomics Analysis |
| `22_final_healthcare_analysis.sql` | End-to-End Healthcare Data Analysis |

## Unique Feature

### Genomics & Gene Variant Analysis

A key feature of this project is the `gene_tests` table, which combines SQL with **Life Science and Human Genetics domain knowledge**.

The analysis includes genes such as:

- Galectin-3
- BRCA1
- TP53
- EGFR

The project explores gene test results, detected variants, chromosomes, diseases, and patient-level genomic information.

## Project Goals

- Demonstrate practical SQL skills
- Practice SQL using a realistic healthcare dataset
- Apply advanced SQL concepts to real-world analytical questions
- Combine SQL with Life Science and Genomics domain knowledge
- Build a portfolio project for Data Analyst / Analytics roles

## Technologies

- **Snowflake**
- **SQL**
- **GitHub**

## Project Status

🚧 Currently in development.

The project is being expanded progressively from basic SQL queries to advanced SQL, database concepts, and final healthcare analytics.
