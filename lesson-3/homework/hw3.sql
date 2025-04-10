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
