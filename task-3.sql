--task 1
SELECT category.name AS category_name, COUNT(film.film_id) AS film_count
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

--task 2
SELECT category.name AS category_name, AVG(film.length) AS average_length
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

--task 3
SELECT MIN(length) AS min_length, MAX(length) AS max_length
FROM film;

--task 4
SELECT COUNT(customer_id) AS total_customers
FROM customer;

--task 5
SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS total_payments
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id;

--task 6
SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS total_payments
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY total_payments DESC
LIMIT 5;

--task 7
SELECT customer.first_name, customer.last_name, COUNT(rental.rental_id) AS total_rentals
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id;

--task 8
SELECT AVG(EXTRACT(YEAR FROM NOW()) - f.release_year) AS average_age
FROM film f;

--task 9
SELECT COUNT(rental_id) AS total_rentals
FROM rental
WHERE rental_period && tsrange('2005-05-20 00:00:00', '2005-07-15 23:59:59');

--task 10
SELECT TO_CHAR(payment.payment_date, 'YYYY-MM') AS payment_month, 
       SUM(payment.amount) AS total_payments
FROM payment
GROUP BY payment_month;

--task 11
SELECT customer.first_name, customer.last_name, MAX(payment.amount) AS max_payment
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id;

--task 12
SELECT customer.first_name, customer.last_name, AVG(payment.amount) AS average_payment
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id;

--task 13
SELECT film.rating, COUNT(film.film_id) AS film_count
FROM film
GROUP BY film.rating;

--task 14
SELECT store.store_id, AVG(payment.amount) AS average_payment
FROM store
JOIN customer ON store.store_id = customer.store_id
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY store.store_id;

