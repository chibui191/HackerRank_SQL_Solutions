SELECT t.hacker_id, name, t.num
FROM (
    SELECT hacker_id, COUNT(*) AS num
    FROM challenges
    GROUP BY hacker_id
) t
JOIN hackers h
ON (t.hacker_id = h.hacker_id)
WHERE t.num IN (
    SELECT * FROM (
        (SELECT tmp.num FROM (
            SELECT COUNT(*) AS num FROM challenges
            GROUP BY hacker_id) tmp
        GROUP BY tmp.num
        HAVING COUNT(*) = 1)
        UNION
        (SELECT COUNT(*) FROM challenges
        GROUP BY hacker_id ORDER BY COUNT(*) DESC LIMIT 1)
    ) unioned
) 
ORDER BY t.num DESC, t.hacker_id ASC;