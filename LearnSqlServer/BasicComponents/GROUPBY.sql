Use MyDatabase;

--Group By: Combines row with same value

/*
Find the total score in each country
*/

SELECT country ,SUM(score) AS total_score
FROM customers
GROUP BY country;

/*
Find the total score and total number of customers for each country
*/

select * from customers;

SELECT country, COUNT(id) as total_customers,SUM(score) as total_score
from customers
group by country;