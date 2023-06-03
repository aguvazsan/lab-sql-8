# Lab | SQL Queries 8

### Instructions

USE sakila;

-- 1. Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.

SELECT title, length, 
	RANK () OVER (ORDER BY length ASC) AS 'RANK_length_of_film'
FROM film
	WHERE length IS NOT NULL AND length > 0;
    

-- 2. Rank films by length within the `rating` category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.  

SELECT title, length, rating,
	RANK () OVER (ORDER BY length ASC) AS 'RANK_length_of_film'
FROM film
	WHERE length IS NOT NULL AND length > 0;

-- 'SELECT title, length, rating, 
-- RANK() OVER (PARTITION BY rating ORDER BY length ASC) AS 'RANK_length_within_rating'
-- FROM film
-- WHERE length IS NOT NULL AND length > 0;


-- 3. How many films are there for each of the categories in the category table? **Hint**: Use appropriate join between the tables "category" and "film_category".

SELECT c.name AS category_name, COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;


-- 4. Which actor has appeared in the most films? **Hint**: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.

SELECT ac.first_name, ac.last_name, COUNT(fa.film_id) AS film_count
FROM film_actor fa
JOIN actor ac ON fa.actor_id = ac.actor_id
GROUP BY ac.actor_id, ac.first_name, ac.last_name
ORDER BY film_count;


-- 5. Which is the most active customer (the customer that has rented the most number of films)? **Hint**: Use appropriate join between the tables "customer" and "rental" and count the `rental_id` for each customer.

SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.customer_id) AS rental_count
FROM rental r
JOIN customer c ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_count;


