-- Get all records from a query
SELECT *
FROM film;


-- Limit results
SELECT *
FROM film
LIMIT 10;


-- Omit some results and limit
SELECT *
FROM film
LIMIT 10 OFFSET 5;


-- Select specific props
SELECT first_name, last_name
FROM actor;


-- Find all item with prop value
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';


-- Test: Find all actors with last name Wahlberg
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';


-- Select film by id
SELECT * FROM film
WHERE film_id = 85;


-- Like keyword (Basically '=' in this example)
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';


-- LIKE keyword (a bit like ReGex)
-- _ any 1 character
-- % any number of characters
-- Where name starts with J
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';


-- Names containing a Y
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE '%y%' OR first_name LIKE 'Y%';


-- K names that are three letters long
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';


-- First names that start with K
-- end with TH
-- and have at least 2 chracters between
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%th';


-- Comparison operators
-- > >= < <= <>
SELECT customer_id, amount
FROM payment
where amount >= 2.00;


-- Order by: Ascending
SELECT customer_id, amount
FROM payment
where amount >= 2.00
-- ORDER BY amount DESC; (Descending)
-- ORDER BY amount ASC; (Explicit ascending)
ORDER BY amount; 


-- Boundaries
SELECT customer_id, amount
FROM payment
where amount >= 2.00 BETWEEN 2.00 AND 7.99;


-- SQL aggregation: SUM, AVG, COUNT, MIN, MAX
-- The sum of all amounts paid
SELECT SUM(amount)
FROM payment
-- WHERE amount >= 5.99
;


-- Count: how many occurs
SELECT COUNT(amount)
FROM payment;


-- Unique occurs
SELECT COUNT(DISTINCT amount)
FROM payment
-- WHERE amount > 5
;


-- Average
SELECT AVG(amount)
FROM payment;


-- Alias
SELECT MIN(amount) AS Min_Payment
FROM payment
WHERE amount <> 0;

SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount;


-- Query to display each customer IDs with
-- summed amount of cash spent for each
SELECT customer_id, SUM(amount) as sum_of_amount
FROM payment
GROUP BY customer_id
-- ORDER BY sum_of_amount DESC;
ORDER BY sum_of_amount;


-- HAVING
SELECT customer_id, SUM(amount) as soa
FROM payment
WHERE customer_id > 187
GROUP BY customer_id
HAVING SUM(amount) > 71
ORDER BY soa DESC
LIMIT 20 OFFSET 5;


-- Query to display customer emails that show up more than 5 times
-- grouping by the customer's email
-- and the email contains the name 'bishop'
SELECT COUNT(email)
FROM customer
WHERE email LIKE '%bishop%'
GROUP BY email
HAVING COUNT(email) > 5
ORDER BY email LIMIT 1;
-- WRONG
-- SELECT email, COUNT(email)
-- FROM customer
-- WHERE COUNT(email) > 5
-- GROUP BY email
-- HAVING email LIKE "%bishop%";