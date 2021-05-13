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
-- 274
# Find out the population and life expectancy for people in Argentina.
SELECT Population, LifeExpectancy FROM country WHERE Code = 'ARG';
-- 37032000	75.1
# Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT Name from country WHERE LifeExpectancy IS NOT NULL ORDER BY LifeExpectancy DESC LIMIT 1;
-- Andorra
# Using JOIN ... ON, find the capital city of Spain.
SELECT ci.name from city ci
INNER JOIN country c
ON ci.id = c.capital
WHERE c.name = 'Spain';
-- Madrid 
# Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT cl.language from countrylanguage cl
INNER JOIN country c
ON cl.countrycode = c.code
WHERE c.region = 'Southeast Asia';
-- Chinese
-- English
-- Malay
-- Malay-English
-- Bali
-- Banja
-- Batakki
-- Bugi
-- Javanese
-- Madura
-- Malay
-- Minangkabau
-- Sunda
-- Chinese
-- Khmer
-- T?am
-- Vietnamese
-- Lao
-- Lao-Soung
-- Mon-khmer
-- Thai
-- Burmese
-- Chin
-- Kachin
-- Karen
-- Kayah
-- Mon
-- Rakhine
-- Shan
-- Chinese
-- Dusun
-- English
-- Iban
-- Malay
-- Tamil
-- Bicol
-- Cebuano
-- Hiligaynon
-- Ilocano
-- Maguindanao
-- Maranao
-- Pampango
-- Pangasinan
-- Pilipino
-- Waray-waray
-- Chinese
-- Malay
-- Tamil
-- Chinese
-- Khmer
-- Kuy
-- Lao
-- Malay
-- Thai
-- Portuguese
-- Sunda
-- Chinese
-- Khmer
-- Man
-- Miao
-- Muong
-- Nung
-- Thai
-- Tho
-- Vietnamese
# Using a single query, list 25 cities around the world that start with the letter F.
SELECT name FROM city WHERE name REGEXP '^[F].*$' ORDER BY name ASC LIMIT 25;
-- F?rth
-- F?s
-- Faaa
-- Fagatogo
-- Fairfield
-- Faisalabad
-- Faizabad
-- Fakaofo
-- Fall River
-- Fargona
-- Faridabad
-- Farrukhabad-cum-Fatehgarh
-- Fatehpur
-- Fayetteville
-- Feira de Santana
-- Fengcheng
-- Fengshan
-- Fengyuan
-- Fernando de la Mora
-- Ferrara
-- Ferraz de Vasconcelos
-- Fianarantsoa
-- Firenze
-- Firozabad
-- Flint
# Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(ci.name) 
from city ci
INNER JOIN country c
ON ci.countrycode = c.code
WHERE c.code = 'CHN';
-- 363 
# Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT c.name, c.population from country c WHERE population > 0 ORDER BY population ASC LIMIT 1;
-- Pitcairn	50
# Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(c.name) FROM country c;
-- 239
# What are the top ten largest countries by area?
SELECT c.name, surfacearea from country c ORDER BY surfacearea DESC LIMIT 10;
-- Russian Federation	17075400.00
-- Antarctica	13120000.00
-- Canada	9970610.00
-- China	9572900.00
-- United States	9363520.00
-- Brazil	8547403.00
-- Australia	7741220.00
-- India	3287263.00
-- Argentina	2780400.00
-- Kazakstan	2724900.00
# List the five largest cities by population in Japan.
SELECT ci.name, ci.population FROM city ci WHERE countrycode = 'JPN' ORDER BY population DESC LIMIT 5;
-- Tokyo	7980230
-- Jokohama [Yokohama]	3339594
-- Osaka	2595674
-- Nagoya	2154376
-- Sapporo	1790886
# List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
# List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
# List every unique world language.
# List the names and GNP of the world's top 10 richest countries.
# List the names of, and number of languages spoken by, the top ten most multilingual countries.
# List every country where over 50% of its population can speak German.
# Which country has the worst life expectancy? Discard zero or null values.
# List the top three most common government forms.
# How many countries have gained independence since records began?