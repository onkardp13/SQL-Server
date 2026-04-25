Use MyDatabase;

--TOP:Restrict the number of rows returned

/*
Retrivee the top 3 scores with highest scores
*/

select TOP 3 *
from customers
order by score desc;

/*
Retrive the Lowest 2 customers based on the score
*/

SELECT TOP 2 *
FROM customers
ORDER BY SCORE ASC;

/*
GET THE TWO MOST RECENT ORDERS
*/

select * from orders;

select TOP 2 *
from orders
order by order_date desc;
