Use MyDatabase;

/*
Order By:Used to sort the result in ascending or descnding order

select column_name
from table_name
order by column_name

*/

/*
Retrive all customers and sort the results by highest score first
*/

SELECT * 
FROM customers 
ORDER BY score DESC;

/*
Retrive all customers and sort the results by the country and then by the highest score
*/

SELECT *
FROM customers
ORDER BY country ASC, score DESC;



