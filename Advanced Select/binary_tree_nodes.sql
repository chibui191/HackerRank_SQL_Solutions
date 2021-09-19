SELECT
    N,
    CASE 
        WHEN P IS NULL THEN 'Root'
        ELSE CASE 
            WHEN N IN (SELECT DISTINCT P FROM BST) THEN 'Inner'
            ELSE 'Leaf'
        END
    END 
FROM BST
ORDER BY N ASC;