--Part 1. Part 1: Queries to select data (SELECT)
--task 1 get all films with their category
SELECT 
    f.title AS "Назва фільму", 
    f.length AS "Тривалість", 
    c.name AS "Категорія"
FROM 
    film f
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id;

--task 2 get all films rented by a client
SELECT 
    f.title AS "Назва фільму",
    r.rental_period AS "Дата оренди"
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
WHERE 
    c.customer_id = 7;

--task 3 get all films rented in a certain period
SELECT 
    f.title AS "Назва фільму", COUNT(r.rental_id) AS "Кількість оренд"
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.title
ORDER BY 
    "Кількість оренд" DESC
LIMIT 
    5;

--Part 2: Manipulating data (INSERT, UPDATE, DELETE)
--task 1 New client
INSERT INTO 
    city (city, country_id) 
VALUES 
    ('San Francisco', 103);
INSERT INTO 
    address (address, city_id, district, postal_code, phone)
VALUES 
    ('123 Main St', (SELECT city_id FROM city WHERE city = 'San Francisco'), 'Outer Mission', '94016', '380442990619');
--task 2 Update client's address
UPDATE 
    address
SET 
    address = '456 Elm St'
WHERE 
    address_id = (
        SELECT address_id
        FROM customer
        WHERE first_name = 'Alice' AND last_name = 'Cooper'
);
--task 3 Delete client from the database
DELETE FROM 
    customer
WHERE 
    first_name = 'Alice' AND last_name = 'Cooper';
