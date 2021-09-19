SELECT 
    CASE 
        WHEN (grade >= 8) THEN name
        ELSE NULL
    END, 
    grade, marks
FROM students
JOIN grades 
ON (marks >= min_mark AND marks <= max_mark)
ORDER BY 
    grade DESC, 
    name ASC,
    marks ASC;