Create database SchoolDB;
Use SchoolDB;
Create Table Students (
    StudentID INT PRIMARY KEY,
Name VARCHAR(50), 
AGE INT
);

Select * From Students;

INSERT INTO Students (StudentID, Age)
VALUES (1, 22);
INSERT INTO Students (StudentID, Age)
VALUES (2, 21), (3, 23), (4, 20);

Select * From Students;
