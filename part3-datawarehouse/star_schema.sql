-- =========================
-- Dimension Table: Date
-- =========================
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    month INT,
    year INT
);

-- =========================
-- Dimension Table: Store
-- =========================
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

-- =========================
-- Dimension Table: Product
-- =========================
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- =========================
-- Fact Table
-- =========================
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_id VARCHAR(20),

    date_id INT,
    store_id INT,
    product_id INT,

    units_sold INT,
    unit_price DECIMAL(10,2),
    total_sales DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- Insert Cleaned Dimension Data
-- =========================

INSERT INTO dim_date VALUES
(1,'2024-01-05',1,2024),
(2,'2024-01-15',1,2024),
(3,'2024-02-10',2,2024),
(4,'2024-02-20',2,2024),
(5,'2024-03-08',3,2024);

INSERT INTO dim_store VALUES
(1,'Central Store','Mumbai'),
(2,'City Mall Store','Pune'),
(3,'Metro Store','Delhi');

INSERT INTO dim_product VALUES
(1,'Laptop','Electronics'),
(2,'T-Shirt','Clothing'),
(3,'Rice Pack','Groceries'),
(4,'Headphones','Electronics');

-- =========================
-- Insert Cleaned Fact Data
-- =========================

INSERT INTO fact_sales 
(transaction_id,date_id,store_id,product_id,units_sold,unit_price,total_sales)
VALUES
('T001',1,1,1,1,60000,60000),
('T002',1,2,2,3,800,2400),
('T003',2,3,3,5,60,300),
('T004',2,1,4,2,2500,5000),
('T005',3,2,1,1,62000,62000),
('T006',3,3,2,4,750,3000),
('T007',4,1,3,6,55,330),
('T008',4,2,4,2,2400,4800),
('T009',5,3,1,1,61000,61000),
('T010',5,1,2,2,900,1800);