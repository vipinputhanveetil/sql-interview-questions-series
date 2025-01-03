/*
Interview Question: Find Employees with Salaries Above the Average
You have a table named employees with the following columns:
employee_id
employee_name
department
salary
Write a query to list the names of employees who earn a salary above the average salary in their respective departments. You'll need to use a subquery to solve this problem.
*/

CREATE OR REPLACE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, employee_name, department, salary) VALUES
(1, 'John Doe', 'IT', 75000.00),
(2, 'Jane Smith', 'HR', 65000.00),
(3, 'Emily Davis', 'IT', 80000.00),
(4, 'Michael Brown', 'Marketing', 72000.00),
(5, 'Sarah Johnson', 'HR', 62000.00),
(6, 'David Lee', 'Marketing', 68000.00),
(7, 'Laura Wilson', 'IT', 90000.00),
(8, 'Daniel Thomas', 'HR', 70000.00);

SELECT employee_name, department, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);
