SELECT ProductName as NAME
From Products;
SELECT*FROM Customers AS Client;
SELECT ProductName
From Products
UNION
SELECT ProductName
From Products_Discounted;
SELECT ProductName
FROM Products
INTERSECT
SELECT ProductName
FROM Products_Discounted;
SELECT DISTINCT FirstName, Country
FROM Customers;
SELECT ProductName, Price,
CASE WHEN Price > 1000 THEN 'High' ELSE 'Low' END AS PriceCategory From Products;
SELECT ProductName, StockQuantity, IIF(StockQuantity > 100, 'Yes', 'No') AS StockStatus FROM Products_Discounted;


SELECT ProductName
FROM Products
UNION
SELECT ProductName
FROM OutOfStock;
SELECT ProductName
FROM Products
EXCEPT
SELECT ProductName
FROM Products_Discounted;
SELECT ProductName, Price,
CASE WHEN Price > 1000 THEN 'Expensive' ELSE 'Affordable' END AS Cost FROM Products;
SELECT * FROM Employees
WHERE Age < 25 OR Salary > 60000;
UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR' OR EmployeeID = 5;
