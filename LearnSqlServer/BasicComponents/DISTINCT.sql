Use MyDatabase;

--DISCTINCT: Remove duplicates(Repeated values),each values appear only once

/*
Syntax:
SELECT DISTINCT column_name
FROM table_name;

*/
--Return Unique list of all countires

SELECT DISTINCT country
FROM customers
