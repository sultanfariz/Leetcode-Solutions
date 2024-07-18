-- Write your PostgreSQL query statement below
SELECT firstName as "firstName", lastName AS "lastName", city, state 
FROM person p
LEFT JOIN address a ON p.personId = a.personId
