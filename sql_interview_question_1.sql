--Question: Write an SQL query to find duplicate records in a table named Employees. Consider a record to be duplicate if it has the same values in the FirstName, LastName, and Email columns. 
--Your query should list the duplicated FirstName, LastName, and Email, along with the count of how many times each combination appears in the table.

CREATE OR REPLACE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO employees (employee_id, first_name, last_name, email)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com'),
    (3, 'John', 'Doe', 'john.doe@example.com'),
    (4, 'Emily', 'Davis', 'emily.davis@example.com'),
    (5, 'John', 'Doe', 'john.doe@example.com');
SELECT 
    first_name, 
    last_name, 
    email, 
    COUNT(*) AS duplicate_count
FROM 
    employees
GROUP BY 
    first_name, 
    last_name, 
    email
HAVING 
    COUNT(*) > 1;
