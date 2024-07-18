-- Write your PostgreSQL query statement below
SELECT e1.name AS "Employee" FROM employee e1
JOIN employee e2 ON e1.managerId = e2.id
WHERE e1.salary > e2.salary
