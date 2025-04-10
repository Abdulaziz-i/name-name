CREATE TABLE Employees (
EmpID INT Primary Key,
Name Varchar(50),
Salary Decimal(10, 2));

INSERT INTO Employees (EmpID, Name, Salary)
Values (1, 'Sara', 65000,00);
INSERT INTO Employees (EmpID, Name, Salary)
Values (2, 'Ali', 70000.00);
INSERT INTO Employees (EmpID, Name, Salary)
VALUES
(3, 'Jack', 58000.00),
(4, 'Diana', 77000.00);
UPDATE Employees 
Set Salary = 75000.00
Where EmpID = 1;
UPDATE Employees 
Set Salary = NULL
Where EmpID = 1;
ALTER TABLE Employees
ALTER COLUMN Name Varchar(100);
ALTER TABLE Employees
ADD Department Varchar(50);
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;
CREATE TABLE Deparments(
    DepartmentID INT Primary Key,
    DepartmentName Varchar(50)
);
TRUNCATE TABLE Employees;


INSERT INTO Deparments (DepartmentID, DepartmentName)
VALUES
(1, 'Marketing'),
(2, 'Accounting'),
(3, 'Product'),
(4, 'IT'),
(5, 'Management');
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;
DELETE FROM Employees;
ALTER TABLE Employees
DROP COLUMN Department;
EXEC sp_rename 'Employees', 'StaffMembers';
DROP TABLE Deparments;
