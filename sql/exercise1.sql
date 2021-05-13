use sakila;
SHOW tables;

# Find the surname of the actor with the forename 'John'.
SELECT * from actor_info WHERE first_name = 'John';
# 2) Find all actors with surname 'Neeson'.
SELECT * FROM actor_info WHERE last_name = 'Neeson';
# 3) Find all actors with ID numbers divisible by 10.
SELECT * FROM actor where actor_id % 10 = 0;
# 4) What is the description of the movie with an ID of 100?
SELECT * FROM film WHERE film_id = 100;
# 5) Find every R-rated movie.
SELECT * FROM film WHERE rating = 'R';
# 6) Find every non-R-rated movie.
SELECT * FROM film where rating != 'R';
# 7) Find the ten shortest movies.
SELECT * from film ORDER BY length ASC LIMIT 10;
# 8) Find all movies that have deleted scenes.
SELECT * FROM film WHERE special_features LIKE '%Deleted Scenes%';
# 9) Find the titles of all the horror movies.
SHOW TABLES;
SELECT title FROM film_list WHERE category = 'Horror';
# List the name of every language in reverse-alphabetical order. (HINT: use 'ORDER BY' and 'SELECT DISTINCT')
SELECT name FROM language ORDER BY name DESC;
SELECT * FROM language;
# 2) List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename (HINT: use %son%)
SELECT first_name, last_name FROM actor WHERE last_name LIKE '%son%' ORDER BY first_name ASC;
# 3) Using HAVING COUNT, reverse-alphabetically list the last names that are not repeated.
SELECT last_name, COUNT(*) c FROM actor GROUP BY last_name HAVING c < 2 ORDER BY last_name DESC;
# 4) Which actor has appeared in the most films? (HINT: use joins, COUNT() and GROUP BY)
SELECT actor_id, COUNT(*) c from film_actor GROUP BY actor_id HAVING c > 2 ORDER BY c DESC LIMIT 1;
SELECT first_name, last_name, actor.actor_id
from actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id;

Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`schooldb`.`enrollment`, CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`fk_class_id`) REFERENCES `students` (`student_id`))
