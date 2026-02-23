1)

SELECT * 
FROM Student 
WHERE Name = 'Onkar';


Best Index to Use: Non-Clustered Index
Reason: Column Used in Filtering:

The Name column is used in the WHERE clause, so a non-clustered index on Name can speed up lookups.
A non-clustered index stores pointers to the actual rows, allowing quick retrieval of matching rows without requiring the entire table to be scanned.
Clustered Index is Not Suitable:

A clustered index is better for range queries, sorting, or when the column uniquely identifies rows (like a primary key). Name is unlikely to uniquely identify rows (e.g., multiple students can have the name "Onkar").
Using a clustered index on Name would reorganize the table's physical order based on the Name column, which is unnecessary in this scenario.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2)Query: Searching by ID

SELECT * 
FROM Student 
WHERE StudentID = 101;

Best Index: Clustered Index
Reason: StudentID is a unique identifier, often a primary key. A clustered index is ideal because it directly maps to the physical storage of rows.

-- Creating a table with a clustered index on StudentID (as primary key)
CREATE TABLE Student (
    StudentID INT PRIMARY KEY, -- Clustered index created automatically
    Name NVARCHAR(50),
    Age INT
);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3) Query: Searching by a Non-Unique Column

SELECT * 
FROM Student 
WHERE Age = 20;

Best Index: Non-Clustered Index
Reason: The Age column is not unique, and it's used in the WHERE clause. A non-clustered index speeds up searches on this column without affecting the physical storage order.
Code:
sql
Copy code
-- Creating a non-clustered index on Age
CREATE NONCLUSTERED INDEX IX_Student_Age ON Student(Age);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

4). Query: Sorting Results

SELECT * 
FROM Student 
ORDER BY Name;

Best Index: Clustered Index
Reason: Sorting benefits from a clustered index because rows are stored in sorted order based on the indexed column.

-- Creating a clustered index on Name (if StudentID is not the primary clustered index)
CREATE CLUSTERED INDEX IX_Student_Name ON Student(Name);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

5). Query: Searching by Multiple Columns

SELECT * 
FROM Student 
WHERE Name = 'Onkar' AND Age = 20;

Best Index: Composite Non-Clustered Index
Reason: When filtering by multiple columns, a composite non-clustered index on both Name and Age is efficient.

-- Creating a composite non-clustered index on Name and Age
CREATE NONCLUSTERED INDEX IX_Student_Name_Age ON Student(Name, Age);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

6. Query: Retrieving a Range of Data

SELECT * 
FROM Orders 
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-01-31';
Best Index: Clustered Index
Reason: Range queries benefit from clustered indexes because the data is stored in sorted order, making range retrievals fast.

-- Creating a table with a clustered index on OrderDate
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY, -- Automatically creates a clustered index
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

7. Query: Searching by Email

SELECT * 
FROM Customers 
WHERE Email = 'test@example.com';
Best Index: Non-Clustered Index
Reason: Email is not the primary identifier but is commonly used in search operations. A non-clustered index on Email improves query performance.

-- Creating a non-clustered index on Email
CREATE NONCLUSTERED INDEX IX_Customers_Email ON Customers(Email);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

8. Query: Aggregate Operations

SELECT AVG(Salary) 
FROM Employees 
WHERE DepartmentID = 10;
Best Index: Non-Clustered Index
Reason: Non-clustered indexes on DepartmentID can speed up filtering and aggregate calculations.


-- Creating a non-clustered index on DepartmentID
CREATE NONCLUSTERED INDEX IX_Employees_DepartmentID ON Employees(DepartmentID);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

9)Query: Joining Tables

SELECT o.OrderID, c.CustomerName 
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;
Best Index: Clustered Index on CustomerID in Both Tables
Reason: Joins benefit from indexes on the columns used in the ON clause. A clustered index on CustomerID ensures efficient lookups in both tables.

-- Creating clustered index on CustomerID in Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY, -- Clustered index on CustomerID
    CustomerName NVARCHAR(100)
);

-- Creating clustered index on CustomerID in Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT, -- Foreign key, ideal for clustered index
    OrderDate DATE
);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

10)9. Query: Searching by Partial Match
sql
Copy code
SELECT * 
FROM Products 
WHERE ProductName LIKE 'Lap%';
Best Index: Non-Clustered Index
Reason: A non-clustered index on ProductName is useful for LIKE queries with prefix matching. Full wildcard matching (e.g., %Lap%) won't benefit from the index.
Code:
sql
Copy code
-- Creating a non-clustered index on ProductName
CREATE NONCLUSTERED INDEX IX_Products_ProductName ON Products(ProductName);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

10. Query: Paginated Results
sql
Copy code
SELECT * 
FROM Orders 
ORDER BY OrderDate 
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
Best Index: Clustered Index
Reason: Pagination requires sorting. A clustered index on OrderDate is ideal for efficient sorting and row retrieval.
Code:
sql
Copy code
-- Clustered index on OrderDate
CREATE CLUSTERED INDEX IX_Orders_OrderDate ON Orders(OrderDate);
General Recommendations
Query Type	Recommended Index	Why
Unique row identification	Clustered Index	Clustered indexes uniquely identify rows and store them physically.
Filtering or searching by column	Non-Clustered Index	Non-clustered indexes improve lookup performance for non-primary keys.
Sorting or range-based queries	Clustered Index	Clustered indexes store rows in sorted order, enabling efficient scans.
Joining tables	Clustered Index or Foreign Keys	Joins benefit from indexes on common keys.
Aggregate functions	Non-Clustered Index	Helps filter rows efficiently before aggregation.
By applying these strategies, you can design tables and indexes tailored to specific query patterns for optimal performance.






