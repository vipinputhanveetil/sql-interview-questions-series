--Write a SQL query to find customers who made repeat purchases and calculate their total spend. This involves identifying customers who have placed more than one order and summing up their total spending.
CREATE OR REPLACE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE,
    country VARCHAR(50)
);

CREATE OR REPLACE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Sarah Johnson', 'sarah@email.com', '2023-01-15', 'USA'),
(2, 'Mike Chen', 'mike@email.com', '2023-02-20', 'Canada'),
(3, 'Emma Wilson', 'emma@email.com', '2023-03-10', 'USA'),
(4, 'Luis Garcia', 'luis@email.com', '2023-04-05', 'Mexico'),
(5, 'Anna Brown', 'anna@email.com', '2023-05-15', 'USA');

INSERT INTO orders VALUES
(1, 1, '2024-01-01', 1225.99, 'Delivered'),
(2, 1, '2024-01-15', 89.99, 'Delivered'),
(3, 2, '2024-01-20', 1279.99, 'Shipped'),
(4, 3, '2024-02-01', 125.98, 'Processing'),
(5, 4, '2024-02-05', 89.99, 'Delivered');


SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS number_of_orders,
    SUM(o.total_amount) AS total_spend
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name
HAVING 
    COUNT(o.order_id) > 1;

