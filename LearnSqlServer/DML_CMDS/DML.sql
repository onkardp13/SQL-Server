Use MyDatabase;

/*
Insert:Used to add new data into table

syntax:
optional(if no columns are specified SQL expects values for all columns)

INSERT INTO table_name(column1,column2,column3...) values(value1,value2,value3...);
*/

SELECT * FROM customers;
INSERT INTO customers (id,first_name,country,score)
            values
                 (6,'Sam','USA',null),
                 (7,'Ram',null,100)

INSERT INTO customers
Values
    (8,'Andreas','Germany',NULL);

------------------------------------------------------------------------------------
--Insert data from 'cusomers' into 'persons'
insert into persons
select 
id,
first_name,
null,
'Unknown'
from customers;

select * from persons;
-------------------------------------------------------------------------
/*
Update:Modify(Manipulate) your existing data

Syntax:
update table_name
set 
column_name1=value1,
column_name2=value12
where <condition> 

Note:Always use where condition to avoid updating all rows unintentially
*/

--Change the score of customer 6 to 0

select * from customers;

update customers
set score=0
where id=6;


--Change the score of customer 10 to 0 and update the country to UK

update customers
set score=0,
    country='UK'
where id=8;

--Update all customers with a null score by setting their score to 0;

select * from customers;

update customers
set score=0
where score is null;
--------------------------------------------------------------------------

/*
Delete:Used to remove rows from table

Syntax: Delete from table_name
        where <condtion>

Note:Always use where condition to avoid deleting all rows unintentially
*/

--Delete all customers with an id greater than 5

select * from customers;

delete from customers
where id>5;

--Delete all data from table persons

delete from persons
--Use truncate it is faster,not logging any protocol 
TRUNCATE TABLE persons;


