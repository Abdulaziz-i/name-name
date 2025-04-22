SELECT 
    p.ProductName, 
    s.SupplierName
FROM 
    Products p
CROSS JOIN 
    Suppliers s;

SELECT
Departments.DepartmentName,
Employees.Name
FROM Departments
CROSS JOIN Employees;

select*from Suppliers

SELECT
 S.SupplierName,
 P.ProductName
FROM Products P
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID;

SELECT
Orders.OrderID,
Customer.FirstName
FROM Customer
CROSS JOIN Orders;

SELECT
Courses.CourseName,
Students.Name
FROM Courses
CROSS JOIN Students;

SELECT
P.ProductName,
O.OrderID
FROM Products P
INNER JOIN Orders O ON P.ProductID = O.ProductID;

SELECT
D.DepartmentID,
E.Name
FROM Departments D
INNER JOIN Employees E ON D.DepartmentID = E.DepartmentID;

SELECT 
S.Name,
E.CourseID
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID;

SELECT
P.PaymentID,
O.OrderID
FROM Payments P
INNER JOIN Orders O ON P.OrderID = O.OrderID;

SELECT
O.OrderID,
P.ProductName
FROM Orders O
INNER JOIN Products P ON O.ProductID = P.ProductID
WHERE P.Price > 100.00;

SELECT
E.Name AS EmployeeName,
D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID != D.DepartmentID;

SELECT
O.Quantity,
P.StockQuantity
FROM Orders O
INNER JOIN Products P ON O.ProductID = P.ProductID
WHERE O.Quantity > P.StockQuantity;

SELECT
C.FirstName,
S.ProductID
FROM Customer C
INNER JOIN Sales S ON C.CustomerID = S.CustomerID
WHERE S.SaleAmount >= 500.00;

select*from Sales

SELECT
S.Name AS StudentName,
C.CourseName
FROM Students S
INNER JOIN Enrollments E ON S.StudentID = E.StudentID 
INNER JOIN Courses C ON E.CourseID = C.CourseID;

SELECT
P.ProductName,
S.SupplierName
FROM Suppliers S
INNER JOIN Products P ON  S.SupplierID = P.SupplierID
WHERE S.SupplierName LIKE '%tech%';

SELECT
O.TotalAmount,
P.Amount
FROM Payments P
INNER JOIN Orders O ON O.OrderID = P.OrderID
WHERE P.Amount < O.TotalAmount;

SELECT 
    E.Name AS Employee,
    E.Salary AS EmployeeSalary,
    M.Name AS Manager,
    M.Salary AS ManagerSalary
FROM Employees E
INNER JOIN Employees M ON E.ManagerID = M.EmployeeID
WHERE E.Salary > M.Salary;

SELECT 
P.ProductName,
C.CategoryName
FROM Categories C
INNER JOIN Products P ON P.Category = C.CategoryName
WHERE C.CategoryName IN ('Electronics', 'Furniture');

SELECT
S.CustomerID,
C.Country
FROM Customer C
INNER JOIN Sales S ON S.CustomerID = C.CustomerID
WHERE C.Country = 'USA';

SELECT
O.OrderID,
O.TotalAmount,
C.Country
FROM Orders O
INNER JOIN Customer C ON O.CustomerID = C.CustomerID
WHERE C.Country = 'Germany' AND O.TotalAmount > 100.00;
