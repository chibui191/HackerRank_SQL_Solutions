SELECT * FROM
    ((SELECT CONCAT(t1.name, '(', t1.init, ')') AS name_o
    FROM
        (SELECT 
            name, 
            LEFT(occupation, 1) AS init 
        FROM occupations) t1)      
UNION ALL
    (SELECT CONCAT('There are a total of ', t2.num, ' ', t2.occup, 's.') 
    FROM 
        (SELECT 
            LOWER(occupation) AS occup, 
            COUNT(*) AS num
        FROM occupations
        GROUP BY occupation
        ORDER BY 
            num ASC,
            occupation ASC) t2)) t
            
ORDER BY t.name_o;