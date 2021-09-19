SET @count := (SELECT COUNT(*) FROM station);

SELECT ROUND(AVG(t.LAT_N), 4)
FROM (
    SELECT 
        ROW_NUMBER() OVER(
            ORDER BY LAT_N
        ) AS Num,
        LAT_N
    FROM station
    ORDER BY LAT_N
    ) t
WHERE t.Num IN (
    CASE 
        WHEN (@count % 2 = 1) THEN (@count+1)/2
        ELSE CONCAT_WS(', ', @count/2, (@count/2)+1)
    END
);