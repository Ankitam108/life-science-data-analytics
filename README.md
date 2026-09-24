# Life Science Data Analytics — SQL Project

## About

A comprehensive SQL project combining **Healthcare Analytics with Genomics and Gene Variant Tracking** using **Snowflake**.

The project uses a healthcare dataset containing patients, doctors, appointments, laboratory tests, medicines, prescriptions, and genomic testing data.

It covers SQL concepts from fundamentals to advanced analytical techniques and Snowflake-specific database concepts, while also applying **Life Science and Human Genetics domain knowledge** to healthcare and genomic data.

---

## Database Structure

**Database:** `HEALTHCARE_ANALYTICS`  
**Schema:** `RAW_DATA`

### Tables

- `patients` — Patient demographic and disease information
- `doctors` — Doctor and specialist information
- `appointments` — Patient-doctor appointment records
- `lab_tests` — Diagnostic laboratory test information
- `medicines` — Medicine inventory and pricing
- `prescriptions` — Medicines prescribed to patients
- `gene_tests` — Gene testing and gene variant information

---

## SQL Topics Covered

The project covers **22 SQL and Snowflake topics**, progressing from fundamental SQL to advanced analytical and database concepts.

### SQL Fundamentals

- SELECT and Basic Queries
- Filtering and Operators
- Aggregate Functions
- Basic Joins
- Advanced Joins
- GROUP BY and HAVING
- Subqueries
- Common Table Expressions (CTEs)
- Recursive CTEs
- CASE Expressions
- NULL Handling and NULL Functions

### Advanced SQL & Analytics

- Date and Time Functions
- String Functions
- Window Functions
- Views
- CTAS (CREATE TABLE AS SELECT)

### Snowflake Database Concepts

- Search Optimization
- Micro-Partitioning and Clustering
- Trigger Concepts and Snowflake Alternatives
- Stored Procedures and Functions

### Data Analysis

- Healthcare Data Analysis
- Genomics and Gene Variant Analysis
- End-to-End Healthcare Analysis

---

## SQL Files

| File | Topics Covered |
|---|---|
| `01_database_setup.sql` | Tables and Data |
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
| `17_indexing.sql` | Search Optimization Concepts |
| `18_table_partitioning.sql` | Micro-Partitioning and Clustering |
| `19__triggers.sql` | Trigger Concepts and Snowflake Alternatives |
| `20_stored_procedures_functions.sql` | Stored Procedures and Functions |
| `21_gene_analysis.sql` | Gene Variant and Genomics Analysis |
| `22_final_healthcare_analysis.sql` | End-to-End Healthcare Data Analysis |

---

## Genomics & Gene Variant Analysis

A key feature of this project is the integration of **genomics data with healthcare analytics**.

The `gene_tests` table contains genetic testing information and includes genes such as:

- **Galectin-3**
- **BRCA1**
- **TP53**
- **EGFR**

The analysis explores:

- Gene testing patterns
- Gene test results
- Detected variants
- Patient-level genomic information
- Gene and disease relationships
- Variant/result distribution
- Genomics-based aggregations

This demonstrates the application of SQL to **Life Science and Human Genetics data**.

---

## Snowflake Concepts

The project also covers Snowflake-specific concepts, including:

- **Search Optimization** as an alternative to traditional database indexing
- **Micro-partitions**
- **Clustering**
- `SYSTEM$CLUSTERING_INFORMATION`
- **Stored Procedures**
- **User-defined Functions**
- **Streams and Tasks**
- Snowflake SQL syntax and analytical functions

For trigger-related functionality, the project explores Snowflake's approach using **Streams and Tasks** rather than traditional DML triggers.

---

## Healthcare Analysis

The final analysis combines multiple healthcare tables to perform practical analysis involving:

- Patient demographics
- Disease distribution
- Doctor and appointment activity
- Laboratory testing
- Prescription information
- Patient healthcare activity
- Date-based trends
- Genomic testing

The project progresses from individual SQL concepts to **multi-table healthcare analysis**.

---

## Technologies

- **Snowflake**
- **SQL**
- **Git**
- **GitHub**

---

## Project Structure

```text
Life Science Data Analytics — SQL Project
│
├── 01_database_setup.sql
├── 02_aggregate_functions.sql
├── 03_filtering.sql
├── 04_joins_basic.sql
├── 05_joins_advanced.sql
├── 06_group_by_having.sql
├── 07_subqueries.sql
├── 08_cte.sql
├── 09_recursive_cte.sql
├── 10_case_statements.sql
├── 11_null_functions.sql
├── 12_date_time_functions.sql
├── 13_string_functions.sql
├── 14_window_functions.sql
├── 15_views.sql
├── 16_ctas.sql
├── 17_indexing.sql
├── 18_table_partitioning.sql
├── 19_triggers.sql
├── 20_stored_procedures_functions.sql
├── 21_gene_analysis.sql
└── 22_final_healthcare_analysis.sql
