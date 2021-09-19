SELECT b.hacker_id, h.name, b.totalscore
FROM (
    SELECT hacker_id, SUM(max_score) AS totalscore
    FROM (
        SELECT hacker_id, challenge_id, MAX(score) AS max_score
        FROM submissions
        GROUP BY hacker_id, challenge_id
    ) a
    GROUP BY hacker_id
    HAVING totalscore > 0
) b
JOIN hackers h
ON (b.hacker_id = h.hacker_id)
ORDER BY b.totalscore DESC, b.hacker_id ASC;