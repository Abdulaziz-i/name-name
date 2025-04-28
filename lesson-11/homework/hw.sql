SELECT
    O.OrderID,
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    O.OrderDate
FROM 
    Customers C
INNER JOIN 
    Orders O ON C.CustomerID = O.CustomerID
WHERE 
    YEAR(O.OrderDate) > 2022;

SELECT
E.Name AS EmployeeName, 
D.DepartmentName
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName IN ('Sales', 'Marketing');

SELECT
D.DepartmentName,
E.Name AS TopEmployeeName, 
E.Salary AS MaxSalary
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
INNER JOIN (SELECT DepartmentID, MAX(SALARY) AS MaxSalary
FROM Employees
GROUP BY DepartmentID) AS MaxSalaries
ON E.DepartmentID = MaxSalaries.DepartmentID AND E.Salary = MaxSalaries.MaxSalary;

SELECT
C.FirstName, C.LastName, O.OrderID, O.OrderDate
FROM Customers C 
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE C.Country = 'USA' AND YEAR(O.OrderDate) = 2023;

SELECT
CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
COUNT(O.OrderID) AS TotalOrders
FROM Customers C 
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;

SELECT
P.ProductName, S.SupplierName
FROM Products P 
INNER JOIN Suppliers S ON P.SupplierID = S.SupplierID
WHERE S.SupplierName IN('Gadget Supplies', 'Clothing Mart');

SELECT
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    MAX(O.OrderDate) AS MostRecentOrderDate,
    MAX(O.OrderID) AS MostRecentOrderID
FROM 
    Customers C
LEFT JOIN 
    Orders O ON C.CustomerID = O.CustomerID
GROUP BY 
    C.CustomerID, CONCAT(C.FirstName, ' ', C.LastName);

SELECT
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    O.OrderID,
    O.TotalAmount AS OrderTotal
FROM 
    Customers C 
INNER JOIN 
    Orders O ON C.CustomerID = O.CustomerID
WHERE 
    O.TotalAmount > 500;

SELECT
P.ProductName, S.SaleDate, S.SaleAmount
FROM Products P 
INNER JOIN Sales S ON P.ProductID = S.ProductID
WHERE YEAR(S.SaleDate) = 2022 OR S.SaleAmount > 400.00;

SELECT
P.ProductName,
SUM(S.SaleAmount) AS TotalSalesAmount
FROM Products P 
LEFT JOIN Sales S ON P.ProductID = S.ProductID
GROUP BY P.ProductName;

SELECT
    E.Name, E.Salary, D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'HR' AND E.Salary > 50000.00;

SELECT
    P.ProductName, S.SaleDate, P.StockQuantity
FROM Products P
INNER JOIN Sales S ON P.ProductID = S.ProductID
WHERE YEAR(S.SaleDate) = 2023 AND P.StockQuantity > 50;

SELECT
E.Name, E.HireDate, D.DepartmentName
FROM Employees E 
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE YEAR(E.HireDate) > 2020 OR D.DepartmentName = 'Sales';

SELECT
    CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
    O.OrderID, O.OrderDate, C.Address
FROM Customers C 
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE C.Country = 'USA' AND C.Address LIKE '____%';

SELECT
    P.ProductName, P.Category, S.SaleAmount
FROM Products P
INNER JOIN Sales S ON P.ProductID = S.ProductID
WHERE P.Category = 'Electronics' OR S.SaleAmount > 350.00;
