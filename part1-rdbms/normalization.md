## 1.1 Anomaly Analysis
Because the dataset stores orders, customers, products and sales representatives in a single table, several anomalies occur.

### 1. Insert Anomaly

Example:
Row 1:
Order Id : ORD1114
Product Id : P007
Product Name: Pen Set

Problem:
If the company wants to add new product but no order has been placed, it cannot be inserted without creating fake product.

Columns involved:
product_id, product_name, category,unit_price

Reason:
Product information depends on product_id  but it exists only when order exists.

### 2. Update Anomaly

Example:
Rows: Row 3 and row 11 both contain:

customer_id : C001
customer_name : Rohan Mehta
customer_email : rohan@gmail.com
If Rohan Mehta changes his email, thye email must be updated in every row where C001 appears.

Columns involved:
customer_id, customer_name, customer_email and customer_email

Problem:
If one row is not updated , the database will contain inconsistant customer data.


### 3. Delete Anomaly

Example:
Row 2:
order_id : ORD1027
product_id : P004
product_name : Notebook

If this row is deleted when order gets cancelled, the database might loose record describing the product "Notebook"

Columns involved:
product_id, product_name, category,unit_price

Problem:
Deleting an order might delete important product information.
