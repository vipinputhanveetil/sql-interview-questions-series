/*
Write a SQL query to rank employees based on their salary. This query should assign a rank to each employee, with the highest salary receiving the highest rank (rank 1), and so on.
*/

CREATE OR REPLACE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    salary DECIMAL(10, 2)
);
INSERT INTO employees (employee_id, first_name, last_name, salary) VALUES
(1, 'John', 'Doe', 75000.00),
(2, 'Jane', 'Smith', 85000.00),
(3, 'Emily', 'Johnson', 95000.00),
(4, 'Michael', 'Williams', 75000.00),
(5, 'Sarah', 'Brown', 65000.00);

SELECT 
    first_name, 
    last_name, 
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM 
    employees
ORDER BY 
    salary_rank;
