CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY, -- Auto-incrementing primary key
    Name NVARCHAR(100) NOT NULL,             -- Customer name
    Email NVARCHAR(150) UNIQUE NOT NULL,     -- Unique email for each customer
    Phone NVARCHAR(15),                      -- Customer phone number
    Address NVARCHAR(255),                   -- Customer address
    City NVARCHAR(100),                      -- Customer city
    Country NVARCHAR(100),                   -- Customer country
    CreatedDate DATETIME DEFAULT GETDATE()   -- Default current timestamp
);


CREATE TABLE [Order] ( -- 'Order' is a reserved keyword; hence, it's enclosed in brackets
    OrderID INT IDENTITY(1,1) PRIMARY KEY,   -- Auto-incrementing primary key
    CustomerID INT NOT NULL,                 -- Foreign key linking to Customer table
    OrderDate DATETIME DEFAULT GETDATE(),    -- Order date with a default value
    TotalAmount DECIMAL(10, 2) NOT NULL,     -- Total order amount
    OrderStatus NVARCHAR(50) DEFAULT 'Pending', -- Default status as 'Pending'
    ShippingAddress NVARCHAR(255),           -- Shipping address
    PaymentMethod NVARCHAR(50),              -- Payment method used
    CONSTRAINT FK_Order_Customer FOREIGN KEY (CustomerID) 
        REFERENCES Customer(CustomerID)      -- Establish foreign key relationship
        ON DELETE CASCADE                    -- Delete orders if customer is deleted
        ON UPDATE CASCADE                    -- Update related orders if customer ID changes
);


INSERT INTO Customer (Name, Email, Phone, Address, City, Country)
VALUES 
('John Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'Springfield', 'USA'),
('Jane Smith', 'jane.smith@example.com', '9876543210', '456 Maple Ave', 'Greenfield', 'Canada');


INSERT INTO [Order] (CustomerID, TotalAmount, OrderStatus, ShippingAddress, PaymentMethod)
VALUES 
(1, 250.75, 'Shipped', '123 Elm St', 'Credit Card'),
(2, 120.50, 'Pending', '456 Maple Ave', 'PayPal');

/*
1. Fetch Customers Without Any Orders
*/

SELECT c.CustomerID, c.Name, c.Email 
FROM Customer c
LEFT JOIN [Order] o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

/*-----------------------------------------------------------------------------------------------------------------------------------------------*/
/*
2. Fetch Total Orders Placed by Each Customer
*/

SELECT c.CustomerID, c.Name, COUNT(o.OrderID) AS TotalOrders
FROM Customer c
LEFT JOIN [Order] o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;

/*--------------------------------------------------------------------------------------------------------------------------------------------------*/
/*
3. Fetch the Highest Order Amount for Each Customer
*/


SELECT c.CustomerID, c.Name, MAX(o.TotalAmount) AS MaxOrderAmount
FROM Customer c
INNER JOIN [Order] o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;

/*
4. Fetch Orders Placed in the Last 30 Days
*/

SELECT OrderID, CustomerID, OrderDate, TotalAmount
FROM [Order]
WHERE OrderDate >= DATEADD(DAY, -30, GETDATE());

/*
Fetch Customers and Their Total Order Amount
*/
SELECT c.CustomerID, c.Name, SUM(o.TotalAmount) AS TotalSpent
FROM Customer c
LEFT JOIN [Order] o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;

/*
7. Find Duplicate Customers Based on Email
*/
SELECT Email, COUNT(*) AS DuplicateCount
FROM Customer
GROUP BY Email
HAVING COUNT(*) > 1;

/*
10. Delete Orders Older Than a Year
*/

DELETE FROM [Order]
WHERE OrderDate < DATEADD(YEAR, -1, GETDATE());
