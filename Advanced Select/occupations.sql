SET @r1=0, @r2=0, @r3=0, @r4=0;
    
SELECT MAX(Doctor), MAX(Professor), MAX(Singer), MAX(Actor)
FROM (
    SELECT CASE occupation
        WHEN 'Doctor' THEN @r1:=@r1+1
        WHEN 'Professor' THEN @r2:=@r2+1
        WHEN 'Singer' THEN @r3:=@r3+1
        WHEN 'Actor' THEN @r4:=@r4+1
    END AS row_num,
    CASE WHEN occupation = 'Doctor' THEN name END AS Doctor,
    CASE WHEN occupation = 'Professor' THEN name END AS Professor,
    CASE WHEN occupation = 'Singer' THEN name END AS Singer,
    CASE WHEN occupation = 'Actor' THEN name END AS Actor
    
    FROM occupations ORDER BY name
) AS t
GROUP BY row_num;