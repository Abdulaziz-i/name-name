SELECT
E.Name, E.Salary, D.DepartmentName 
FROM Employees E
INNER JOIN
Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.Salary >= 5000.00;

SELECT
C.FirstName, C.LastName, O.OrderDate
FROM Customer C
INNER JOIN
Orders O ON C.CustomerID = O.CustomerID
WHERE YEAR(O.OrderDate) >= 2023;

SELECT
E.Name AS EmployeeName, 
D.DepartmentName
FROM Employees E
LEFT OUTER JOIN
Departments D ON E.DepartmentID = D.DepartmentID;

SELECT
    S.SupplierName, 
    P.ProductName
FROM Suppliers S
LEFT OUTER JOIN Products P 
    ON S.SupplierID = P.SupplierID;

SELECT
O.OrderID, O.TotalAmount, P.PaymentID, P.Amount
FROM Orders O 
FULL OUTER JOIN Payments P 
ON O.OrderID = P.OrderID;

SELECT
E.Name AS EmployeeName,
M.Name AS ManagerName
FROM Employees E
INNER JOIN Employees M
ON E.ManagerID = M.EmployeeID;

SELECT
S.Name AS StudentName
FROM Students S 
INNER JOIN  Enrollments E ON S.StudentID = E.StudentID
INNER JOIN  Courses C ON E.CourseID = C.CourseID
WHERE C.CourseName = 'Math 101';

SELECT
C.FirstName, C.LastName, O.Quantity
FROM Customer C 
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.Quantity > 3;

SELECT
E.Name, D.DepartmentName
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Human resources';
 
 SELECT
 D.DepartmentName
 FROM Employees E 
 INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
 GROUP BY D.DepartmentName
 HAVING COUNT(E.EmployeeID) > 10; 

 SELECT
 P.ProductID, P.ProductName
 FROM Products P 
 LEFT JOIN Sales S ON P.ProductID = S.ProductID
WHERE S.ProductID IS NULL;

SELECT
C.FirstName, C.LastName
FROM Customer C 
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NOT NULL;

SELECT
E.Name, D.DepartmentName
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

SELECT
E1.Name AS Employee1,
E2.Name AS Employee2,
E1.ManagerID
FROM Employees E1
INNER JOIN Employees E2 ON E1.ManagerID = E2.ManagerID
WHERE E1.EmployeeID < E2.EmployeeID;

SELECT
    C.FirstName, 
    C.LastName, 
    O.OrderID, 
    O.OrderDate
FROM 
    Customers C
INNER JOIN 
    Orders O ON C.CustomerID = O.CustomerID
WHERE 
    YEAR(O.OrderDate) >= 2022;

SELECT
E.Name, E.Salary, D.DepartmentName
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.Salary >= 60000.00;

SELECT
O.OrderID, O.OrderDate, P.PaymentDate, P.Amount
FROM Orders O 
INNER JOIN Payments P ON O.OrderID = P.OrderID;

SELECT
P.ProductID, P.ProductName
FROM Products P 
LEFT JOIN Orders O ON P.ProductID = O.ProductID
WHERE O.ProductID IS NULL;

