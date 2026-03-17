## ETL Decisions

### Decision 1 — Standardizing Date Format
Problem: The raw dataset contained inconsistent date formats such as 
MM/DD/YYYY and DD-MM-YYYY, which would cause errors during analysis.

Resolution: All dates were converted to the ISO standard format 
YYYY-MM-DD before loading into the warehouse. A separate `dim_date`
table was created to store structured time attributes like month and year.

---

### Decision 2 — Fixing Category Casing
Problem: Product categories appeared with inconsistent casing such as
"electronics", "Electronics", and "ELECTRONICS".

Resolution: All category values were standardized to proper title case
(e.g., Electronics, Clothing, Groceries) before inserting them into
the `dim_product` table to ensure consistent grouping in reports.

---

### Decision 3 — Handling NULL Values
Problem: Some rows in the raw dataset had NULL values in important fields
like category or units_sold, which could lead to incorrect calculations.

Resolution: Missing categorical values were replaced using the correct
category from product reference data, and numeric NULL values were either
filled with 0 or removed if the record could not be validated.
