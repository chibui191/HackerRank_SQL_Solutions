SELECT t.hacker_id, h.name
FROM (
    SELECT 
        s.hacker_id AS hacker_id, 
        COUNT(*) AS cnt
    FROM submissions s 
    LEFT JOIN challenges c 
        ON (s.challenge_id = c.challenge_id)
    lEFT JOIN difficulty d
        ON (c.difficulty_level = d.difficulty_level)
    WHERE 
        s.score = d.score
    GROUP BY 
        hacker_id
    HAVING cnt > 1
) t 
LEFT JOIN hackers h
ON (t.hacker_id = h.hacker_id)
ORDER BY t.cnt DESC, t.hacker_id ASC;