--Write a SQL query to find all employees who have never taken a leave. This involves identifying employees in the employees table who do not have corresponding records in the leaves table.
  
CREATE OR REPLACE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE OR REPLACE TABLE leaves (
    leave_id INT PRIMARY KEY,
    employee_id INT,
    leave_date DATE
);

INSERT INTO employees (employee_id, first_name, last_name)
VALUES
    (101, 'John', 'Doe'),
    (102, 'Jane', 'Smith'),
    (103, 'Emily', 'Davis'),
    (104, 'Michael', 'Brown'),
    (105, 'Sarah', 'Johnson');

INSERT INTO leaves (leave_id, employee_id, leave_date)
VALUES
    (1, 101, '2024-01-05'),
    (2, 101, '2024-01-10'),
    (3, 102, '2024-02-01'),
    (4, 104, '2024-03-05');
SELECT 
    e.employee_id, 
    e.first_name, 
    e.last_name
FROM 
    employees e
LEFT JOIN 
    leaves l ON e.employee_id = l.employee_id
WHERE 
    l.employee_id IS NULL;
