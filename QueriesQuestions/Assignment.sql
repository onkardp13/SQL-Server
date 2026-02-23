/*
    Create a USER table with the following details.
    • Id • Name • Email • First name • Lastname 
*/

CREATE TABLE [USER] (
    ID INT PRIMARY KEY,
    Name NVARCHAR(25),
    Email NVARCHAR(50), -- Adjusted length for email
    FirstName NVARCHAR(25),
    LastName NVARCHAR(25)
);

/*
  4. Create a table where the above user can save their address. 
  Id • City • District • State • Pin code. • A foreign key reference.

*/

CREATE TABLE ADDRESS (
    ID INT, -- Reference to USER table's ID
    City NVARCHAR(25),
    District NVARCHAR(25),
    State NVARCHAR(25),
    PinCode INT, -- Changed to INT for numeric PIN codes
    CONSTRAINT FK_User_Address FOREIGN KEY (ID) REFERENCES [USER](ID)
);

/*
 5. Insert data in any one of the tables. 


*/
INSERT INTO [USER] (ID, Name, Email, FirstName, LastName) VALUES
(1, 'Rohan Patil', 'rohan@gmail.com', 'Rohan', 'Patil'),
(2, 'Rakesh Mali', 'rakesh@gmail.com', 'Rakesh', 'Mali'),
(3, 'Deepak Patil', 'deepak@gmail.com', 'Deepak', 'Patil');


/*
6. Create a stored procedure and show  the values with below data mentioned (Combine the two tables created to fetch the data as expected)
*/
CREATE PROCEDURE getData
AS
BEGIN
    SELECT 
        u.Name AS UserName,
        u.Email AS EmailAddress,
        a.City AS City,
        a.District AS District,
        a.State AS State,
        a.PinCode AS PinCode
    FROM [USER] u
    INNER JOIN ADDRESS a ON u.ID = a.ID;
END;

/*
.a) Show Username as combination of Lastname and First name.
*/
SELECT CONCAT(u.LastName, ' ', u.FirstName) AS Username 
FROM [USER] u;

