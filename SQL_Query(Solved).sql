
-- Q1. Retrieving all customer names and their email addresses:
select first_name, last_name, email
from sakila.customer

use sakila;

select title, release_year= 2006  from film

-- Additionally, I fetched the number of films which released in 2006 year by using count feature. 
select count(*) from film where release_year = '2006'

-- Q3. Find the top 5 customers who have spent the most on rentals:
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Q4. Retrieve a list of all film categories and the number of films in each category:
SELECT c.name AS category, COUNT(f.film_id) AS film_count
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
LEFT JOIN film f ON fc.film_id = f.film_id
GROUP BY c.category_id
ORDER BY film_count DESC

-- Q5. Find the actors who have appeared in more than 15 films:
SELECT a.first_name, a.last_name, COUNT(fa.actor_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING film_count > 15

-- Q6. Retrieve a list of customers who live in the same city as the film with the title 'ALIEN CENTER PREQUEL':
SELECT c.first_name, c.last_name, c.address_id, ci.city
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN inventory i ON c.customer_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'ALIEN CENTER PREQUEL'


-- Q7. Calculate the average rental duration for each film:
SELECT f.title, AVG(TIMESTAMPDIFF(HOUR, r.rental_date, r.return_date)) AS avg_rental_duration
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title;


