use world;
SHOW TABLES;
SELECT * FROM country;
DESC country;
SELECT * FROM city;
DESC city;
SELECT * FROM countrylanguage;
DESC countrylanguage;
# Using COUNT, get the number of cities in the USA.
SELECt COUNT(name) from city WHERE CountryCode = 'USA';
# Find out the population and life expectancy for people in Argentina.
SELECT Population, LifeExpectancy FROM country WHERE Code = 'ARG';
# Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT Name from country WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy DESC LIMIT 1;
# Using JOIN ... ON, find the capital city of Spain.
SELECT ci.name from city ci
INNER JOIN country c
ON ci.id = c.capital
WHERE c.name = 'Spain';
# Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT cl.language from countrylanguage cl
INNER JOIN country c
ON cl.countrycode = c.code
WHERE c.region = 'Southeast Asia';
# Using a single query, list 25 cities around the world that start with the letter F.
SELECT name FROM city WHERE name REGEXP '^[F].*$' ORDER BY name ASC LIMIT 25;
# Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(ci.name) 
from city ci
INNER JOIN country c
ON ci.countrycode = c.code
WHERE c.code = 'CHN';

# Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT c.name, c.population from country c WHERE population > 0 ORDER BY population ASC LIMIT 1;
# Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(c.name) FROM country c;
# What are the top ten largest countries by area?
SELECT c.name, surfacearea from country c ORDER BY surfacearea DESC LIMIT 10;
# List the five largest cities by population in Japan.
SELECT ci.name, ci.population FROM city ci WHERE countrycode = 'JPN' ORDER BY population DESC LIMIT 5;
# List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
# List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
# List every unique world language.
# List the names and GNP of the world's top 10 richest countries.
# List the names of, and number of languages spoken by, the top ten most multilingual countries.
# List every country where over 50% of its population can speak German.
# Which country has the worst life expectancy? Discard zero or null values.
# List the top three most common government forms.
# How many countries have gained independence since records began?