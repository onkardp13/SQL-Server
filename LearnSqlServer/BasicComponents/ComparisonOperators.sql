Use MyDatabase;

-- Retrive all customers from Germany

SELECT * FROM
customers
WHERE country='Germany';

--Retrive all customers which are not afrom Germany

SELECT * FROM
customers
Where country != 'Germany';

SELECT * FROM
customers
Where country <> 'Germany';

--Retrive all customers with score greater than 500

SELECT * FROM
customers
WHERE score > 500;

--Retrive all customers with score greater than equal 500
SELECT * FROM
customers
WHERE score >= 500;

--Retrive all customers with score less than 500
SELECT * FROM
customers
WHERE score < 500;

--Retrive all customers with score 500 or less
SELECT * FROM
customers
WHERE score <= 500;