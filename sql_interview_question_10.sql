/*
An online store wants to identify the top 3 products that were sold the most in June 2023. The sales table contains information about each sale. 
Question: Write a query to find the IDs of the top 3 products along with the total quantity sold in June 2023. Display the results in descending order based on the quantity sold.
*/

CREATE OR REPLACE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE
);

INSERT INTO sales (sale_id, product_id, quantity, sale_date) VALUES
(1, 1, 10, '2023-06-01'),
(2, 2, 15, '2023-06-05'),
(3, 3, 5, '2023-06-07'),
(4, 1, 7, '2023-06-10'),
(5, 2, 10, '2023-06-15'),
(6, 3, 20, '2023-06-20'),
(7, 1, 15, '2023-06-25'),
(8, 2, 5, '2023-06-28'),
(9, 3, 10, '2023-06-30');

SELECT product_id, SUM(quantity) AS total_quantity
FROM sales
WHERE sale_date BETWEEN '2023-06-01' AND '2023-06-30'
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 3;
