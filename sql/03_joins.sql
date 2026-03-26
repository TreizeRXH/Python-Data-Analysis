-- ================================
-- 03: JOINs
-- Database: Sakila
-- Topics: INNER JOIN, LEFT JOIN,
--         Multi-table JOINs,
--         JOINs with aggregations
-- ================================

/* JOIN Exercises */
/*
Table A        Table B
┌──────┐       ┌──────┐
│  1   │       │  1   │
│  2   │       │  3   │
│  3   │       │  4   │
└──────┘       └──────┘
4 joins:
1.) INNER JOIN - > Only matching rows (1, 3)
2.) LEFT JOIN - > all of A + matches from B (1, 2, 3)
3.) RIGHT JOIN - > all of B + matches from A (1, 3, 4)
4.) FULL JOIN - > everything from both tables
*/

-- get customer naems with their payment amounts
select 	c.First_name, 
		c.Last_name, 
        p.amount as Payment_Amount, 
        p.payment_date as Payment_Date
from customer c
INNER JOIN payment p
	on c.customer_id = p.customer_id
order by p.amount DESC
limit 10;

-- Find customers who have never made a payment 
-- select * from payment where amount is null
Select 	c.first_name, 
		c.last_name,
        p.amount
from customer c
LEFT JOIN payment p
	on c.customer_id = p.customer_id
where p.amount is null;
/* this is a classic interview question: finding records that DON'T have a match!*/

# JOINING 3 TABLES

/*
	## How to know which table to join on

Always ask yourself:
> *"Which table contains the foreign key
> that links to this table?"*
*/

-- Get customer names, film titles they rented (4 tables: Customer, rental, inventory, film)
-- NOTE in real world: you'd need to find the common identifier between the tables
SELECT c.first_name,
		c.last_name,
        f.title
FROM customer c
INNER join rental r
	on c.customer_id = r.customer_id
join inventory i
	on r.inventory_id = i.inventory_id
join film f
	on f.film_id = i.film_id
limit 10;

/* find common info on tables
	select * from customer limit 1;
    select * from rental limit 1;
    select * from inventory limit 1;
    select * from film limit 1;
    */

# STEP 4 - JOIN with aggregation
-- combine joins with GROUP BY (common analyst work)

/* Total Amount spent per customer showing their actual name */
/* review tables for commonality
	select * from customer;
    select * from payment;
*/
select 	c.first_name,
		c.last_name, 
        COUNT(*) as payment_count,
        sum(p.amount) as Total_spent
from customer c
INNER join payment p
	on c.customer_id = p.customer_id
GROUP BY	c.customer_id,
			c.first_name,
            c.last_name
ORDER BY total_spent DESC
LIMIT 10;

/* ****NOTES ON ABOVE QUERY*****:
Count was not necessary to make the query itself work....
HOWEVER, In a real analyst job, You'd include COUNT when:

-You want to know how many transactions made up the total
- You're looking for behavioral patterns
- You want to spot outliers like one
- huge payment vs many small ones
*/

/***********EXERCISES***************
Question 3 - Find the top 10 customers by total spending showing their full name,
email, total spent and payment count.
tables:
select * from customer
select * from payment
*************************************/

select c.first_name, c.last_name, c.email, sum(p.amount) as total, count(*) as payment_count
from customer c
join payment p
	on c.customer_id = p.customer_id
group by c.first_name, c.last_name, c.email
order by total DESC
limit 10;

/***********EXERCISES***************
Question 4 - Find all films that have never been rented. Show film title and rental rate.
tables:

hint:  When you need to find records that don't exist in another table, that's a LEFT JOIN with a WHERE IS NULL check:
*************************************/
# verify needed tables
select * from rental; -- contains inventory_id and related rental rates and title
select * from inventory; -- has film ID tied to inventory id(needed to find rental information)
select * from film; -- contains title and rental rate

select f.title, f.rental_rate
from film f
	LEFT join inventory i
		on f.film_id = i.film_id
	LEFT join rental r
		on r.inventory_id = i.inventory_id
Where r.rental_id is null

## The golden rule for this pattern
/*
> Whenever you're looking for records
> that **don't exist** in another table,
> you must use `LEFT JOIN` all the
> way through — switching any JOIN
> to `INNER JOIN` will drop the
> unmatched rows you're trying to find!

---

## Visual summary
```
LEFT JOIN + IS NULL = "find the gaps"
INNER JOIN          = "find the matches"
*/



/*************************************
# Question 5 - Find the top 5 film categories by total revenue, showing category
name, total revenue, number of rentals and average payment amount.
**************************************/

-- items needed
/*
film categories
category name
total revenue
# of rentals
avg pymnt amount
*/
# FIND ALL TABLES RELATED TO ID DATA

/*select * from film limit 1;
select * from film_category limit 1;
select * from category limit 1;
select * from payment limit 1;
select * from rental limit 1;
select * from inventory limit 1;
*/

/* repasting for easy of reference
# Question 5 - Find the top 5 film categories by total revenue, showing category
name, total revenue, number of rentals and average payment amount.
*/

Select	c.name as category_name,
		sum(p.amount) as total_revenue,
        count(*) as total_rentals,
        avg(p.amount) as average_ammount
from payment p
	join rental r
		on r.rental_id = p.rental_id
	join inventory i
		on i.inventory_id = r.inventory_id
	join film f
		on f.film_id = i.film_id 
	join film_category fc 
		on fc.film_id = f.film_id
	join category c
		on c.category_id = fc.category_id
GROUP BY c.name
ORDER BY total_revenue desc
LIMIT 5;
	


