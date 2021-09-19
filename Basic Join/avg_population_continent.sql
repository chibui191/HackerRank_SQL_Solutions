SELECT continent, FLOOR(AVG(population))
FROM (
    SELECT city.name, continent, city.population AS population
    FROM city
    LEFT JOIN country
    ON (city.countrycode = country.code)
) t
WHERE continent IS NOT NULL
GROUP BY continent ORDER BY continent;