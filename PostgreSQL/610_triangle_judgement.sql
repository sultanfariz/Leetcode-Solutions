SELECT x, y, z, 
CASE
  WHEN x >= y + z THEN 'No'
  WHEN y >= x + z THEN 'No'
  WHEN z >= x + y THEN 'No'
ELSE
  'Yes'
END
AS triangle
FROM triangle
