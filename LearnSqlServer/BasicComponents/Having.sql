Use MyDatabase;

--Having:Filters data after aggregation,can be use only with group by

/*

SELECT column_name, AGG_FUNCTION(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;

*/



/*
Find the average score for each country
considering only customers with score not equal to 0 And 
return only those countires with an average score greater than 430
*/


select country,AVG(score) as AverageScore 
from customers
where score !=0
group by country
Having AVG(score)>430;