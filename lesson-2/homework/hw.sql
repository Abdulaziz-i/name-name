CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100)
);
INSERT INTO Employees (EmpID, Name)
VALUES (101, 'Asu');
ALTER TABLE Employees
ADD Salary DECIMAL(10, 2);
UPDATE Employees
SET Salary = 50000.00
WHERE EmpID = 101;
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (102, 'Michael', 60000.00);
ALTER TABLE Employees
ALTER COLUMN Departments VARCHAR(100);
UPDATE Employees
SET Departments = 'Marketing'
WHERE EmpID = 101;
SELECT*FROM Employees
UPDATE Employees
SET Departments = 'Data analytic'
WHERE EmpID = 102;
SELECT*FROM Employees
