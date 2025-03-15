create database sql_50;
use sql_50;

-- 1/50 SQL Challenge
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert records into Table 
INSERT INTO employees (name, department, salary) VALUES 
('John Doe', 'Engineering', 63000),
('Jane Smith', 'Engineering', 55000),
('Michael Johnson', 'Engineering', 64000),
('Emily Davis', 'Marketing', 58000),
('Chris Brown', 'Marketing', 56000),
('Emma Wilson', 'Marketing', 59000),
('Alex Lee', 'Sales', 58000),
('Sarah Adams', 'Sales', 58000),
('Ryan Clark', 'Sales', 61000);

/*

Write a Query to find the Second Highest Salary

*/
-- Solution
select * from employees;

-- Approach 1
SELECT *
FROM employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;

/*
Sometimes the employess may have the same Salary then?
*/
-- Adding new record 
INSERT into employees 
            values(11,"SIVA",'NON-IT',63000);
            
-- Approach 2 [ window Function ]

SELECT *
FROM(
     SELECT *,
     dense_rank() over(order by salary DESC) AS D_Rank
	FROM employees
    ) as abc
where D_Rank = 2;