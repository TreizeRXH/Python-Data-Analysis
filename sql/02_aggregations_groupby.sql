-- ================================
-- 02: Aggregations & GROUP BY
-- Database: Sakila
-- Topics: COUNT, SUM, AVG, MAX, MIN
--         GROUP BY, HAVING, WHERE
-- ================================

/* Grouping Exercises

Quick rule of thumb

If it's in your SELECT and doesn't
have SUM, COUNT, AVG, MAX,
or MIN around it — it must be
in your GROUP BY.
*/


Select customer_id,
	sum(amount) as total_spent
from payment
group by customer_id
order by total_spent DESC;


#Step 3 - Group by with multiple columns
/*
Total revenue per customer per staff member
*/
Select customer_id,
	staff_id,
    sum(amount) as Total_spent
from payment
group by customer_id, staff_id
order by total_Spent desc

#Step 4 - Having
/*
Find customers who spent more than $100
*/
select customer_id, sum(amount) as total_spent
from payment
group by customer_id
having total_spent > 100
order by total_spent DESC
/*
⚠️ WHERE vs HAVING — key difference
This is a very common interview question!
					WHERE				HAVING
Filters				Individual rows		Grouped results
Runs				Before GROUP BY		After GROUP BY
Can use aggregates	❌ No				✅ Yes


Key Question:  Am I filtering on a raw column or a calculated result?
Raw column:  Where
Calculated value like SUM or count: Having
Can't use SUM/COUNT/AVG in filter:  Where
Need to filter on aggregate:  Having

aggregate functions cannot be used in a where clause
One line summary

Use WHERE to filter the data going in
to the group, use HAVING to filter the
results coming out of the group.
*/


-- Question 5 - hard
/*
Find the top 5 customers by total spending who have made at least 30 payments, 
showing customer_id, payment count, total spent, and average payment amount.
*/

-- select * from payment

select 	
	customer_id, 
	count(*) as payment_count, 
    sum(amount) as total_spent, 
    avg(amount) as avg_payment
from payment
group by customer_id
having payment_count >= 30
order by total_spent DESC
limit 5;
