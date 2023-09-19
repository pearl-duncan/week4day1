-- cnt + e+e to run specific sections

SELECT * -- * = all (what do we want to look through)
FROM actor; -- which table do we want to look through
-- have to end each section of code with ; 
SELECT first_name, last_name
FROM actor;

-- add specificity to our quary
-- WHERE clause
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

--LIKE clause
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'Wahlberg';

-- wildcard %
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'W%'

--single letter wild card (underscore) _ will show names with as many letters as underscores you put, starting with c
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'C___'

-- the underscore and % is looking for names with as many letters as underscore or more
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'C___%'

-- comparing operators
-- > greater than
-- < less than
-- >= greater or equal
-- <= less or equal
-- != not equal
-- <> not equal

SELECT * 
FROM payment;

-- find all payments greater than $5
SELECT customer_id, amount -- add what you want to see here
FROM payment -- from where you want to pull the data from 
WHERE amount > 5; -- conditions were filtering by

--ordering based on amount

SELECT customer_id, amount
FROM payment
WHERE amount > 5
ORDER BY amount DESC; -- DECENDING ORDER = DESC ASSENDING ORDER = ASC

-- conjunctions AND and OR operations (looking for a range of things)
SELECT customer_id, amount
FROM payment
WHERE amount > 5 AND amount < 100
ORDER BY amount DESC;

SELECT customer_id, amount
FROM payment
WHERE amount > 5 OR customer_id = 3
ORDER BY amount DESC;

--aggregator (condensing it down)
--SUM, AVG, COUNT (how many items), MIN, MAX

SELECT SUM(amount) -- can only have one thing- you only want one result back so you can only ask for one thing
FROM payment
WHERE amount > 0;

SELECT AVG(amount) -- can only have one thing- you only want one result back so you can only ask for one thing
FROM payment
WHERE amount > 0;

SELECT COUNT(amount) -- can only have one thing- you only want one result back so you can only ask for one thing
FROM payment
WHERE amount > 0;

SELECT MIN(amount) AS smallest_amount -- AS lets you give it a nickname
FROM payment
WHERE amount > 0;

SELECT MAX(amount) -- can only have one thing- you only want one result back so you can only ask for one thing
FROM payment
WHERE amount > 0;

--DISTINCT
SELECT DISTINCT customer_id
FROM payment
WHERE amount > 5;

SELECT COUNT(DISTINCT customer_id)
FROM payment
WHERE amount > 5;

--GROUP BY
SELECT customer_id, SUM(amount)
FROM payment
WHERE amount > 0
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

--HAVING CLAUSE
--(adding a filter to our aggregate) , the same as a where clause but you can have sum,avg, min, ect in it
SELECT customer_id, SUM(amount)
FROM payment
WHERE amount > 0
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount) DESC;


--extra stuff
--LIMIT, OFFSET (skip the fist one)
SELECT customer_id, SUM(amount)
FROM payment
WHERE amount > 0
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount) DESC
LIMIT 3
OFFSET 1