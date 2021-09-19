SELECT (salary*months) AS earnings, COUNT(*) as num
FROM employee
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;