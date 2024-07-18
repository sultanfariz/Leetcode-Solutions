-- Write your PostgreSQL query statement below
SELECT name as "Customers" FROM customers c
LEFT OUTER JOIN orders o ON c.id = o.customerId
WHERE customerId IS NULL
