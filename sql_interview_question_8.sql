/*
Scenario: An e-commerce company needs to identify orders that have been placed but not yet shipped. Assumptions:

The orders table contains all order details.

An unshipped order is one that lacks a ship_date.

Question: Write a query to determine which orders have been placed but are not yet shipped?
*/

CREATE OR REPLACE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    ship_date DATE
);

INSERT INTO orders (order_id, customer_id, order_date, ship_date) VALUES
(1, 101, '2024-12-25', '2024-12-28'),
(2, 102, '2024-12-26', NULL),
(3, 103, '2024-12-27', '2024-12-30'),
(4, 104, '2024-12-28', NULL),
(5, 105, '2024-12-29', '2025-01-02');

SELECT order_id, customer_id, order_date
FROM orders
WHERE ship_date IS NULL;
