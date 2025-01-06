/*
Scenario: Your team at a retail company is analyzing monthly sales data to identify trends.

Question: Write a query that outputs the name of each product and the difference in the number of units sold between the month with the highest sales and the month with the lowest sales. Arrange the results based on the largest disparity.
*/

CREATE OR REPLACE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    sale_month DATE,
    units_sold INT
);

INSERT INTO sales_data (sale_id, product_name, sale_month, units_sold) VALUES
(1, 'Widget A', '2024-01-01', 100),
(2, 'Widget B', '2024-01-01', 150),
(3, 'Widget A', '2024-02-01', 200),
(4, 'Widget B', '2024-02-01', 100),
(5, 'Widget A', '2024-03-01', 150),
(6, 'Widget B', '2024-03-01', 50),
(7, 'Widget A', '2024-04-01', 250),
(8, 'Widget B', '2024-04-01', 75);

SELECT product_name, MAX(units_sold) - MIN(units_sold) AS sales_disparity
FROM sales_data
GROUP BY product_name
ORDER BY sales_disparity DESC;
