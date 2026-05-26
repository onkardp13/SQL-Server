Use MyDatabase;

/*
= : Check if two values are equal
*/
-- Retrive all customers from Germany

SELECT * FROM
customers
WHERE country='Germany';

/*
<> != : Check if two values are not equal
*/
--Retrive all customers which are not afrom Germany

SELECT * FROM
customers
Where country != 'Germany';

SELECT * FROM
customers
Where country <> 'Germany';

/*
> : Check if value is greater than another value
*/
--Retrive all customers with score greater than 500

SELECT * FROM
customers
WHERE score > 500;

/*
>= : Check if value is greater than or equal to another value
*/

--Retrive all customers with score greater than equal 500
SELECT * FROM
customers
WHERE score >= 500;

/*
< : Check if value is less than another value
*/
--Retrive all customers with score less than 500
SELECT * FROM
customers
WHERE score < 500;

/*
<= : Check if value is less than or equal to another value
*/
--Retrive all customers with score 500 or less
SELECT * FROM
customers
WHERE score <= 500;