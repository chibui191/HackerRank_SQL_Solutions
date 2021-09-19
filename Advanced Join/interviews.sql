SELECT con.contest_id, hacker_id, name,
    SUM(ss.s3), SUM(ss.s4),
    SUM(vs.s1), SUM(vs.s2)
FROM contests con
JOIN colleges col ON (con.contest_id = col.contest_id)
JOIN challenges cha ON (col.college_id = cha.college_id)
LEFT JOIN (
    SELECT challenge_id,
        SUM(total_views) AS s1, 
        SUM(total_unique_views) AS s2
    FROM view_stats
    GROUP BY challenge_id
) AS vs
ON (cha.challenge_id = vs.challenge_id)
LEFT JOIN (
    SELECT challenge_id,
        SUM(total_submissions) AS s3,
        SUM(total_accepted_submissions) AS s4
    FROM submission_stats
    GROUP BY challenge_id
) AS ss
ON (cha.challenge_id = ss.challenge_id)
GROUP BY con.contest_id, hacker_id, name
HAVING (SUM(vs.s1) + SUM(vs.s2) + 
        SUM(ss.s3) + SUM(ss.s4)) > 0
ORDER BY con.contest_id;