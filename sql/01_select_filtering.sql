-- ================================
-- 01: SELECT & Filtering
-- Database: Sakila
-- Topics: SELECT, WHERE, LIKE,
--         AND, ORDER BY, COUNT
-- ================================

-- Query 1: Active customers from store 1
-- with .org email address
-- Returns: 318 rows
SELECT *
FROM customer
WHERE store_id = 1
AND email LIKE '%.org'
AND active = 1
ORDER BY last_name ASC;

-- Query 2: Count of above results
-- Returns: 318
SELECT COUNT(*) AS total_results
FROM customer
WHERE store_id = 1
AND email LIKE '%.org'
AND active = 1;