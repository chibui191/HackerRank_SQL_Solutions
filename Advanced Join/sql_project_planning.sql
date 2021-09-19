SELECT MIN(start_d), MAX(end_date)
FROM (
    SELECT 
        ADDDATE(end_date, (-1)) AS start_d,
        end_date,
        ADDDATE(end_date, (-rank_date)) AS G
    FROM (
        SELECT 
            end_date, 
            RANK() OVER (ORDER BY end_date) AS rank_date
        FROM projects
    ) sorted
) tmp
GROUP BY G
ORDER BY 
    DATEDIFF(MAX(end_date), MIN(start_d)) ASC,
    MIN(start_d) ASC;