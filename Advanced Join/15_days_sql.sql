SET @startdate = '2016-03-01';

SELECT submission_date, 
    (
        SELECT COUNT(DISTINCT tmp.hacker_id) 
        FROM (
            SELECT s2.submission_date, 
                DATEDIFF(s2.submission_date, @startdate)+1 AS rank_date,
                COUNT(DISTINCT submission_id) AS daily_subs, 
                hacker_id, 
                (
                    SELECT COUNT(DISTINCT s1.submission_date) 
                    FROM submissions s1
                    WHERE s1.submission_date <= s2.submission_date
                        AND s1.hacker_id = s2.hacker_id   
                ) AS mtd_subs
            FROM submissions s2
            GROUP BY s2.submission_date, s2.hacker_id
            HAVING rank_date = mtd_subs
        ) tmp
        WHERE tmp.submission_date = d.submission_date
    ),
    (
        SELECT hacker_id
        FROM submissions s3
        WHERE s3.submission_date = d.submission_date
        GROUP BY hacker_id
        ORDER BY COUNT(DISTINCT submission_id) DESC, hacker_id ASC LIMIT 1
    ) AS max_sub_hacker_id,
    (
        SELECT name FROM hackers h
        WHERE h.hacker_id = max_sub_hacker_id
    )
FROM (
    SELECT DISTINCT submission_date
    FROM submissions
) d;