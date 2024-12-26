--Write an SQL query to find the nth highest salary in the Employees table. The nth highest salary is the salary that appears in the nth position when all the salaries are sorted in descending order. 
--The value of n should be specified as a parameter in the query. Ensure that your solution handles cases where there are duplicate salaries and returns the correct result for any valid value of n.
--This question is among the SQL interview problems asked by MLC Australia.

CREATE OR REPLACE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2)
);
INSERT INTO employees (employee_id, first_name, last_name, salary)
VALUES
    (1, 'John', 'Doe', 60000.00),
    (2, 'Jane', 'Smith', 75000.00),
    (3, 'Emily', 'Davis', 80000.00),
    (4, 'Michael', 'Brown', 60000.00),
    (5, 'Sarah', 'Johnson', 90000.00);

WITH salary_ranks AS (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
    FROM employees
)
SELECT salary
FROM salary_ranks
WHERE rank = 10;  -- Replace :n with the desired value of n
