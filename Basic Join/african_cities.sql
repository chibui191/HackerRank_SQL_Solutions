SELECT city.name
FROM city
LEFT JOIN country
ON (city.countrycode = country.code)
WHERE continent = 'Africa';