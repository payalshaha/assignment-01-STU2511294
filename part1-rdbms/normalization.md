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

## Normalization Justification

## Normalization Justification

The original orders_flat.csv dataset stores information about customers, products, orders, and sales representatives in a single table. This design causes significant redundancy because the same customer details, product information, and sales representative data are repeated across multiple rows whenever a new order is recorded. Such repetition leads to data anomalies such as insert, update, and delete anomalies. To resolve these issues, the dataset was normalized to Third Normal Form (3NF).

The first step toward normalization was identifying the main entities present in the data: Customers, Products, Sales Representatives, Orders, and Order Items. Each entity was separated into its own table so that attributes depend only on their respective primary key. For example, customer details such as name, email, and city are stored only in the customers table and referenced through `customer_id` in the orders table. Similarly, product information like product name, category, and unit price is stored in the products table and referenced through `product_id`.

The orders table stores order-level information such as order date, customer, and sales representative, while the order_items table stores the relationship between orders and products along with the quantity purchased. This structure removes repeating groups and ensures that each table represents a single entity.

By applying this design, all non-key attributes depend only on the primary key, eliminating partial and transitive dependencies. As a result, the schema satisfies the requirements of Third Normal Form (3NF). This normalized structure reduces redundancy, prevents data inconsistencies, and ensures that updates, inserts, and deletions can be performed without causing anomalies in the database.


Columns involved:
product_id, product_name, category,unit_price

Problem:
Deleting an order might delete important product information.
