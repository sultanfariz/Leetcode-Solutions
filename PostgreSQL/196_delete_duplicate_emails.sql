DELETE FROM person 
WHERE id NOT IN (
  SELECT MIN(id) AS id
  FROM person
  GROUP BY email
);
