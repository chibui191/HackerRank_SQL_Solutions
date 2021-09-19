SELECT id, age, coins, power
FROM (
    SELECT 
        w.id AS id, 
        p.age AS age, 
        w.coins_needed AS coins, 
        w.power AS power
    FROM wands w
    JOIN wands_property p
    ON (w.code = p.code)
    WHERE p.is_evil = 0 
) AS t
WHERE coins = (
    SELECT MIN(coins)
    FROM (
        SELECT 
            p.age AS age, 
            w.coins_needed AS coins, 
            w.power AS power
        FROM wands w
        JOIN wands_property p
        ON (w.code = p.code)
        WHERE p.is_evil = 0 
    ) AS tmp
    WHERE 
        tmp.power = t.power 
        AND tmp.age = t.age
)
ORDER BY t.power DESC, t.age DESC;