SELECT SUM(city.population)
FROM city
LEFT JOIN country
ON (city.countrycode = country.code)
WHERE continent = 'Asia';