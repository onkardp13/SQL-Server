
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50)
);


INSERT INTO Employee (EmployeeID, FirstName, LastName)
VALUES 
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Michael', 'Johnson'),
(4, 'Emily', 'Davis'),
(5, 'David', 'Wilson');


CREATE TABLE Award (
    AwardID INT PRIMARY KEY,
    EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
    AwardDate DATE
);



INSERT INTO Award (AwardID, EmployeeID, AwardDate)
VALUES 
(1, 1, '2023-01-15'),  -- John Doe
(2, 1, '2023-03-20'),  -- John Doe
(3, 2, '2023-02-10'),  -- Jane Smith
(4, 3, '2023-04-12'),  -- Michael Johnson
(5, 1, '2023-06-30'),  -- John Doe
(6, 2, '2023-07-14'),  -- Jane Smith
(7, 4, '2023-08-20'),  -- Emily Davis
(8, 5, '2023-09-10');  -- David Wilson


/* 1. Get All Employees Without Awards  */

SELECT E.EmployeeID, E.FirstName, E.LastName
FROM Employee E
LEFT JOIN Award A ON E.EmployeeID = A.EmployeeID
WHERE A.AwardID IS NULL;


/* 2. Find the Total Number of Awards Each Employee Has Received  */

SELECT E.EmployeeID, E.FirstName, E.LastName, COUNT(A.AwardID) AS TotalAwards
FROM Employee E
LEFT JOIN Award A ON E.EmployeeID = A.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY TotalAwards DESC;



/* 3. Find Employees Who Have Received More Than One Award in 2023  */

SELECT E.EmployeeID, E.FirstName, E.LastName, COUNT(A.AwardID) AS AwardCount
FROM Employee E
JOIN Award A ON E.EmployeeID = A.EmployeeID
WHERE YEAR(A.AwardDate) = 2023
GROUP BY E.EmployeeID, E.FirstName, E.LastName
HAVING COUNT(A.AwardID) > 1;


/* 4. Find Employees Who Received Awards in Both 2022 and 2023 */

SELECT E.EmployeeID, E.FirstName, E.LastName
FROM Employee E
JOIN Award A ON E.EmployeeID = A.EmployeeID
WHERE YEAR(A.AwardDate) IN (2022, 2023)
GROUP BY E.EmployeeID, E.FirstName, E.LastName
HAVING COUNT(DISTINCT YEAR(A.AwardDate)) = 2;

/* 5. Get the Month with the Highest Number of Awards in 2023 */

SELECT MONTH(A.AwardDate) AS AwardMonth, COUNT(A.AwardID) AS AwardCount
FROM Award A
WHERE YEAR(A.AwardDate) = 2023
GROUP BY MONTH(A.AwardDate)
ORDER BY AwardCount DESC


/* 6. Find Employees Who Received Their First Award in 2023  */

SELECT E.EmployeeID, E.FirstName, E.LastName, MIN(A.AwardDate) AS FirstAwardDate
FROM Employee E
JOIN Award A ON E.EmployeeID = A.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
HAVING MIN(A.AwardDate) >= '2023-01-01' AND MIN(A.AwardDate) <= '2023-12-31';

/* 7. Get the Employee with the Most Recent Award */

SELECT TOP 1 E.EmployeeID, E.FirstName, E.LastName, A.AwardDate
FROM Employee E
JOIN Award A ON E.EmployeeID = A.EmployeeID
ORDER BY A.AwardDate DESC;


/* 8. Find Employees Who Have Received More Awards Than the Average  */

SELECT E.EmployeeID, E.FirstName, E.LastName, COUNT(A.AwardID) AS AwardCount
FROM Employee E
JOIN Award A ON E.EmployeeID = A.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
HAVING COUNT(A.AwardID) > (SELECT AVG(COUNT(AwardID)) FROM Award GROUP BY EmployeeID);

/*
9. Get Employees Who Have Received Awards in Consecutive Years
*/

SELECT E.EmployeeID, E.FirstName, E.LastName, YEAR(A.AwardDate) AS AwardYear
FROM Employee E
JOIN Award A ON E.EmployeeID = A.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName, YEAR(A.AwardDate)
HAVING COUNT(DISTINCT YEAR(A.AwardDate)) > 1;

/*
10. Find Employees Who Received Exactly One Award in a Given Year
*/

SELECT E.EmployeeID, E.FirstName, E.LastName, COUNT(A.AwardID) AS AwardCount
FROM Employee E
JOIN Award A ON E.EmployeeID = A.EmployeeID
WHERE YEAR(A.AwardDate) = 2023
GROUP BY E.EmployeeID, E.FirstName, E.LastName
HAVING COUNT(A.AwardID) = 1;

/*
11. Find All Awards Received by a Specific Employee (e.g., John Doe)
*/


SELECT A.AwardID, A.AwardDate
FROM Employee E
JOIN Award A ON E.EmployeeID = A.EmployeeID
WHERE E.FirstName = 'John' AND E.LastName = 'Doe';

/*
12. Get Employees with the Longest Time Between Two Consecutive Awards
*/

SELECT E.EmployeeID, E.FirstName, E.LastName, 
       DATEDIFF(DAY, MIN(A.AwardDate), MAX(A.AwardDate)) AS DaysBetweenAwards
FROM Employee E
JOIN Award A ON E.EmployeeID = A.EmployeeID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
HAVING COUNT(A.AwardID) > 1
ORDER BY DaysBetweenAwards DESC;

