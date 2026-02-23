CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50)
);


CREATE TABLE Marks (
    MarksID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES Student(StudentID),
    Subject NVARCHAR(50),
    MarksObtained INT
);

INSERT INTO Student (StudentID, FirstName, LastName)
VALUES 
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Alice', 'Johnson'),
(4, 'Bob', 'Brown'),
(5, 'Charlie', 'Davis');


INSERT INTO Marks (MarksID, StudentID, Subject, MarksObtained)
VALUES 
(1, 1, 'Math', 85),
(2, 1, 'Science', 78),
(3, 1, 'English', 92),
(4, 2, 'Math', 90),
(5, 2, 'Science', 88),
(6, 2, 'English', 75),
(7, 3, 'Math', 65),
(8, 3, 'Science', 70),
(9, 3, 'English', 80),
(10, 4, 'Math', 55),
(11, 4, 'Science', 60),
(12, 4, 'English', 68),
(13, 5, 'Math', 95),
(14, 5, 'Science', 89),
(15, 5, 'English', 85);


/* 1. Find the Total Marks Obtained by Each Student */

select  s.FirstName,s.LastName, SUM(m.MarksObtained) as TotalMarks from Student s join Marks m on s.StudentID=m.StudentID group by s.FirstName,s.LastName; 


/*   Find the Student with the Highest Total Marks */

select TOP 1 s.StudentID,s.FirstName,s.LastName, SUM(m.MarksObtained) as TotalMarks from Student s join Marks m on s.StudentID=m.StudentID group by s.StudentID, s.FirstName,s.LastName order by TotalMarks DESC;

/* 3. Find Students Who Scored More Than 75 in Every Subject */

select TOP 1 s.StudentID,s.FirstName,s.LastName from Student s join Marks m on s.StudentID=m.StudentID group by s.StudentID, s.FirstName,s.LastName  having MIN(m.MarksObtained)>75;

/*4. Find the Average Marks Scored by Students in Each Subject  */

select m.Subject, AVG(m.MarksObtained) as AverageMarks from Student s join Marks m on s.StudentID=m.StudentID group by m.Subject;

/* Find the Subject in Which the Maximum Marks Were Scored by Any Student  */

select TOP 1 m.Subject ,MAX(M.MarksObtained) AS MaxMarks from Marks m group by m.Subject order by MaxMarks desc;

/*  Find Students Who Scored Below Average in Any Subject  */

select s.StudentID,s.FirstName,s.LastName from Student s join Marks m on s.StudentID=m.StudentID where m.MarksObtained<(select AVG(MarksObtained) from Marks where Subject=m.Subject)


 /*  9. Find the Top 3 Students Based on Their Total Marks */

 SELECT TOP 3 S.StudentID, S.FirstName, S.LastName, SUM(M.MarksObtained) AS TotalMarks
FROM Student S
JOIN Marks M ON S.StudentID = M.StudentID
GROUP BY S.StudentID, S.FirstName, S.LastName
ORDER BY TotalMarks DESC;






