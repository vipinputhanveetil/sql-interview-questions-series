/*
Interview Question: Write a SQL query to categorize employees based on their years of service as follows:

Veteran: Employees with 20 or more years of service.

Experienced: Employees with 10 to 19 years of service (inclusive).

Intermediate: Employees with 5 to 9 years of service (inclusive).

Newbie: Employees with less than 5 years of service.

Display the employee's name, years of service, and the corresponding service category. Sort the results by years of service.
*/
CREATE OR REPLACE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    hire_date DATE
);

INSERT INTO employees (employee_id, first_name, last_name, hire_date) VALUES
(1, 'John', 'Doe', '2000-01-15'),
(2, 'Jane', 'Smith', '2010-04-22'),
(3, 'Emily', 'Johnson', '2015-08-30'),
(4, 'Michael', 'Williams', '2020-11-10'),
(5, 'Sarah', 'Brown', '2012-05-18');

SELECT 
    first_name, 
    last_name, 
    DATEDIFF(YEAR, hire_date, GETDATE()) AS years_of_service,
    CASE
        WHEN DATEDIFF(YEAR, hire_date, GETDATE()) >= 20 THEN 'Veteran'
        WHEN DATEDIFF(YEAR, hire_date, GETDATE()) BETWEEN 10 AND 19 THEN 'Experienced'
        WHEN DATEDIFF(YEAR, hire_date, GETDATE()) BETWEEN 5 AND 9 THEN 'Intermediate'
        ELSE 'Newbie'
    END AS service_category
FROM 
    employees
ORDER BY 
    years_of_service;
