--1. How many actors are there with the last name ‘Wahlberg’?
-- 2
SELECT last_name
FROM actor
WHERE last_name LIKE 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
-- 2
SELECT amount
FROM payment
WHERE  amount > 3.99 AND amount < 5.99
ORDER BY amount DESC;

-- ?????3. What film does the store have the most of? (search in inventory)
-- the store has multiple film with the same quantity - 8, these are film_id's 1, 31, 69,73,86,91,103,109,127,174,193,199,200,206,220,231,239,266,295,301,331,341,350,356,358,361,369,378,382,403,412,418,434,444,460,468,489,500,525,531,559,572,586,595,609,621,638,683,697,702,730,738,745,748,753,764,767,773,789,835,846,849,856,870,873,880,893,897,911,945,973,&1000

SELECT DISTINCT film_id,COUNT(*) as count 
FROM inventory
GROUP BY film_id
ORDER BY count DESC;

--4. How many customers have the last name ‘William’?
-- none
SELECT last_name
FROM customer
WHERE last_name LIKE 'William';

--5. What store employee (get the id) sold the most rentals?
-- staff member 1
SELECT COUNT(staff_id)
FROM rental
WHERE staff_id = 1;

SELECT COUNT(staff_id)
FROM rental
WHERE staff_id = 2;
--6. How many different district names are there? (address)
--378
SELECT COUNT(DISTINCT district)
FROM address;

--!!!!7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT DISTINCT actor_id
FROM film_actor
ORDER BY DESC;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 6
SELECT *
FROM customer
WHERE store_id = '1' AND last_name LIKE '___es%';

--!!!9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)

--!!!!10. Within the film table, how many rating categories are there? And what rating has the most movies total
-- 5 rating categories
SELECT COUNT(DISTINCT rating)
FROM film;

SELECT *
FROM film

SELECT DISTINCT rating, title
FROM film
ORDER BY rating
WHERE rating = 'G'