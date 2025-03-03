SELECT DISTINCT viewer_id AS id 
FROM views
WHERE viewer_id = author_id
ORDER BY viewer_id;
