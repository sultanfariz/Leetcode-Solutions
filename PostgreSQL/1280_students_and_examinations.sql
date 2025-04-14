SELECT s.student_id, student_name, ss.subject_name, COALESCE(COUNT(e.student_id), 0) AS attended_exams
FROM students s
CROSS JOIN subjects ss
LEFT JOIN examinations e ON s.student_id = e.student_id 
  AND ss.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, ss.subject_name
ORDER BY s.student_id;
