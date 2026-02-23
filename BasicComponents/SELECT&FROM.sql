USE MyDatabase;
/*

Select: Used to retrive data,(*) means all columns
From: Specifies table name

Best Practice: (Insted of select *) it's better to specify columns for faster query performance

*/


-- SQL TASK: Retrive All Customer Data

SELECT *
From customers;

-- Retrive All Order Data

SELECT *
From orders;

/* Select Few Columns - Pick only the columns you need insted of all

SELECT
Col 1,
Col 2,
FROM Table
*/

-- SQL TASK: Retrive each customer's name,country and score

SELECT
	first_name,
	country,
	score 
FROM customers;

