/*
DDL:Data Definition Language
    1.Modify structure of our database using cmds of data definition language
    2.Define structure of your data:Create new object inside the database like e.g Table
*/


Use MyDatabase;

/*
1.Create:Used to create database objects (table.databases,view etc)

Create a new table called persons with columns:id,person_name,birth_date,and phone
*/

CREATE TABLE persons (
     id INT NOT NULL,
     person_name VARCHAR(50) NOT NULL,
     birth_date DATE,
     phone VARCHAR(15) NOT NULL,
     CONSTRAINT pk_persons PRIMARY KEY (id)
)

SELECT * FROM persons;

------------------------------------------------------------------------

/*
Alter:Used to modify an existing object
      New columns are appended at the end of the table by default
*/

ALTER TABLE persons 
ADD email VARCHAR(50) NOT NULL;

SELECT * FROM persons;

--Remove the column phone from the persons table

ALTER TABLE persons
DROP COLUMN phone 

SELECT * FROM persons;


-------------------------------------------------------------------------

/*
Drop:Deletes an object permanantly (Removes the table completely (data + structure))
*/

--Delete the table person from database
DROP TABLE persons;
