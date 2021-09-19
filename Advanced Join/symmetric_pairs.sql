SELECT *
FROM (
    SELECT f1.X AS X, f1.Y AS Y
    FROM functions f1, functions f2
    WHERE 
        f1.X = f2.Y AND f1.Y = f2.X 
        AND f1.X < f1.Y
    
    UNION
    
    SELECT * FROM functions
    WHERE x = y
    GROUP BY x, y HAVING COUNT(*) > 1
) t
ORDER BY X;