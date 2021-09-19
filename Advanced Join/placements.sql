SELECT name
FROM (
    SELECT idd, friend_offer
    FROM (
        SELECT 
            f.id AS idd, p1.salary AS offer, 
            friend_id, p2.salary AS friend_offer
        FROM friends f
        JOIN packages p1
        ON (f.id = p1.id)
        JOIN packages p2
        ON (f.friend_id = p2.id)
    ) t1
    WHERE friend_offer > offer
) t2
JOIN students s
ON (t2.idd = s.id)
ORDER BY friend_offer;