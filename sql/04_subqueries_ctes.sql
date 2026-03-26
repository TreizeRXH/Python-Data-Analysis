-- ================================
-- 04: Subqueries & CTEs
-- Database: Sakila
-- Topics: Scalar subqueries,
--         Subqueries in FROM,
--         Subqueries with IN,
--         CTEs, Multiple CTEs
-- ================================

#nested select logical analysis
/*
Question 1:
"Find all actors who have appeared
in more than 20 films"

What do I want to see?
Where does data live?
Filter raw data?
Group anything?
Filter grouped results?


What do I want to see?
	- Actors from films
Where does data live?
	-actor, film_actor
Filter raw data?
	-no
Group anything?
	-actor ID and the count of film id's with their actor_id associated to it
Filter grouped results?
	-where the film count is greater than 20
    */
#QUESTION 1 SQL CODE

#select * from actor;
select a.first_name, a.last_name, count(*) as filmography_count
from film_actor f
	join actor a 
		on a.actor_id = f.actor_id
group by a.first_name, a.last_name, a.actor_id
having filmography_count > 20
order by 3 DESC;
    
    #How many actors total?
    select count(*) from actor;
    
    #percentages per total actor count
    #step1:  get actor counts per film
    Select actor_id, count(*) as film_count
    from film_actor
    group by actor_id
    
    #step2:  get average counts per films
    select avg(film_count) as avg_films
    from (
		    Select actor_id, count(*) as film_count
			from film_actor
			group by actor_id
            )
		as Actor_counts
		
####CTE TEMPLATE
/* WITH cte_name AS (
    -- your original query here
    -- without the HAVING clause
)
SELECT *
FROM cte_name
WHERE condition
ORDER BY column DESC; */
##########################

#####FIND WITH CTE (reusable with longer code if necessary)
WITH actor_filmography as (
	select a.first_name, a.last_name, count(*) as filmography_count
from film_actor f
	join actor a 
		on a.actor_id = f.actor_id
group by a.first_name, a.last_name, a.actor_id
)
Select * from actor_filmography
where filmography_count > 20
order by filmography_count DESC


/*******************************************
Question 2:
"Find all films that have been
rented more than 30 times"

What do I want to see?
	- all films rented more than 30 times
Where does data live?
	-payment, rental, inventory, film
Filter raw data?
	yes, by those that are rented more than 30 times
Group anything?
	- movie title, view counts
Filter grouped results?
	yes by the 30 or more view counts
********************************************/

/***************corrected analysis (above accounts for too many items*****************
What to see?     → film title + rental count
Where data lives → film, inventory, rental
Filter raw data? → no WHERE needed
Group anything?  → GROUP BY film title
Filter groups?   → HAVING rental count > 30


select * from rental; #joins to inventory;
select * from inventory; #joins to film;
select * from film
**************************************************************************************/
select f.title, f.film_id, count(*) as rental_count
from rental r
	join inventory i
		on i.inventory_id = r.inventory_id
	join film f
		on f.film_id = i.film_id
	group by f.title, f.film_id
    having rental_count >30
    order by rental_count DESC
    

SELECT AVG(rental_count) AS avg_rentals
FROM (
    SELECT COUNT(*) AS rental_count
    FROM rental r
    JOIN inventory i
        ON i.inventory_id = r.inventory_id
    GROUP BY i.film_id
) AS film_counts;

###Rewrite as CTE
with Film_Rental_Count as (select f.title, f.film_id, count(*) as rental_count
from rental r
	join inventory i
		on i.inventory_id = r.inventory_id
	join film f
		on f.film_id = i.film_id
	group by f.title, f.film_id)
    
    select * from Film_Rental_Count
    where rental_count >30
    order by rental_count DESC
    
    
/*****************************************
Question 3:  
"Find customers who have spent more than $100 on Action films only" Work through the 5 questions in plain English first:

What do I want to see? ---> customers that have spent > $100 on action films
Where does data live? ----> payment, inventory, film_category (also need rental to connect payment to inventory, 
							and category to get the category name: ergo payment, rental, inventory, film, film_category, category)
Filter raw data? ----> yes because results need to be filtered only on the "Action" category (must happen before grouping)
Group anything? ----->  customers, amount spent
Filter grouped results? -----> yes, those that customers have spent > $100 per the action category

tables:
select * from payment limit 5;
select * from rental limit 5;
select * from inventory limit 5;
select * from film limit 5;
select * from film_category where category_ID = 1 limit 5;
select * from category where name = 'Action'
********************************************/

select p.customer_id, sum(p.amount) as customer_total_spend, fc.category_id
#select * 
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
#where fc.category_id = 1
where c.name = 'Action'
group by p.customer_id, fc.category_id
having customer_total_spend > 100.00 #commenting out this line will still not yield results of greater than $32 for movies that are categorized as action
order by customer_total_spend DESC

#check work based on just the payment table
select customer_id, sum(amount) as customer_total_spend
from payment
group by customer_id
having customer_total_spend >100.00
order by 2 desc  #----there are totals for customer's above 100.00

####REwrite as CTE:
with Total_spend as (select p.customer_id, sum(p.amount) as customer_total_spend, fc.category_id
#select * 
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
#where fc.category_id = 1
where c.name = 'Action'
group by p.customer_id, fc.category_id)

Select * from total_spend
where customer_total_spend > 100.00 #commenting out this line will still not yield results of greater than $32 for movies that are categorized as action
order by customer_total_spend DESC
/*****************************************
Question 4:
Find the average rental rate per category, but only for categories with more than 60 films

What do I want to see? ---> avg rentate rate per category (only for categories counts > 60 
Where does the data live? ---> film, film_category, category
Do I need to filter raw data? ---> no
Do I need to group anything? ---> category
Do I need to filter grouped results? ----> having rental counts > 60

select * from film; #--contains film_id
select * from film_category; #--contains the actual category id for each film
select * from category #--contains actual category name needed
*****************************************/
select c.name, count(*) as category_count, avg(f.rental_rate) as avg_rental_rate
from film f
	join film_category fc
		on fc.film_id = f.film_id
	join category c
		on c.category_id = fc.category_id
group by c.name, fc.category_id
having category_count > 60
order by category_count DESC

#########################
#quickly check actual category counts against film_category
select category_id, count(*) as category_count
from film_category
group by category_id
having category_count > 60
order by category_count DESC
########################

notes:
/*
# name			category_count	avg_rental_rate
Sports			74				3.125135
Sci-Fi			61				3.219508
New				63				3.116984
Games			61				3.252295
Foreign			73				3.099589
Family			69				2.758116
Drama			62				3.022258
Documentary		68				2.666471
Animation		66				2.808182
Action			64				2.646250

*/
#sports has highest rental count, but not rental rate
#Games has highest rental rate, matches lowest rental count 
#sci-fi has second highest rental rate with equal rental count to games


/********************************
Question 5: "Find all customers who made their first rental in July 2005

What do I want to see? --> customer ID, customer first name, customer last name, rental dates 
Where does the data live? ---> customers, rental
Do I need to filter raw data? ---> no WHERE needed
Do I need to group anything? ---> customer names
Do I need to filter grouped results? ---> by those who first rented in July 2005 (min(rental_date) = july 2005

********************************/

##first, find general fields for use
select c.customer_id, c.first_name, c.last_name, r.rental_date
from customer c
	join rental r
		on r.customer_id = c.customer_id
        
###now begin aggregate grouping
select c.customer_id, c.first_name, c.last_name, min(r.rental_date)
from customer c
	join rental r
		on r.customer_id = c.customer_id
group by c.customer_id, c.first_name, c.last_name
order by min(r.rental_date) DESC #yields only one rental in the month of July for year 2005

##Apply filters
select c.customer_id, c.first_name, c.last_name, min(r.rental_date) as first_rental_date
from customer c
	join rental r
		on r.customer_id = c.customer_id
group by c.customer_id, c.first_name, c.last_name
HAVING MONTH(MIN(rental_date)) = 7
	AND YEAR(MIN(rental_date)) = 2005 #results match above findings prior to applying direct filters

####perform as CTE
With July_rental_05 as (
	select c.customer_id, c.first_name, c.last_name, min(r.rental_date) as first_rental_date
from customer c
	join rental r
		on r.customer_id = c.customer_id
group by c.customer_id, c.first_name, c.last_name)

select * from July_rental_05
where MONTH(first_rental_date) = 7 AND YEAR(first_rental_date) = 2005 