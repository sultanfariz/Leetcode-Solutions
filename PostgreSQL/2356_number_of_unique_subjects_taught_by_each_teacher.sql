-- Write your PostgreSQL query statement below

WITH filtered AS (
  SELECT DISTINCT teacher_id, subject_id
  FROM teacher
)

SELECT DISTINCT teacher_id, COUNT(subject_id) AS cnt
FROM filtered
GROUP BY teacher_id
