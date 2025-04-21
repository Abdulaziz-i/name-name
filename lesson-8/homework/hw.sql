SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;

SELECT ProductName, AVG(Price) AS AveragePrice
FROM Products
WHERE Category = 'Electronics'
GROUP BY ProductName;

select*from Customers
where City LIKE 'L%';

select*from Products
where ProductName LIKE '%er';

select*from Customers
where Country LIKE '%A';

select max(price) from Products

SELECT ProductName, StockQuantity, IIF(StockQuantity > 30, 'Sufficient', 'Low Stock') AS StockStatus FROM Products;

select Country,
COUNT(*) as TotalCustomers
from customers
Group by Country;

select
min(Quantity) as MinOrder,
max(Quantity) as MaxOrder
from Orders;

SELECT DISTINCT CustomerID
FROM Orders
WHERE YEAR(OrderDate) = 2023
EXCEPT
SELECT DISTINCT CustomerID
FROM Invoices;

Select ProductName from Products
UNION ALL
Select ProductName from Products_Discounted;

Select distinct ProductName from Products
UNION
Select distinct ProductName from Products_Discounted;

SELECT YEAR(OrderDate) AS OrderYear,
       AVG(TotalAmount) AS AverageOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate);

SELECT ProductName, Price,
       CASE 
           WHEN Price < 100 THEN 'LOW'
           WHEN Price >= 100 AND Price <= 500 THEN 'MID'
           ELSE 'HIGH'
       END AS PriceGroup
FROM Products;

SELECT DISTINCT City
FROM Customers
ORDER BY City ASC;

SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

SELECT*FROM Products
WHERE ProductName LIKE '%oo%';

SELECT ProductID
FROM Products
INTERSECT
SELECT ProductID
FROM Products_Discounted;


SELECT TOP 3 CustomerID,
SUM(TotalAmount) as TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC

SELECT ProductID, ProductName from Products
EXCEPT
Select productID, ProductName from Products_Discounted;


Select P.ProductName,
COUNT(S.SaleID) as TimesSold
From Products P
JOIN Sales S ON P.ProductID = S.ProductID
GROUP BY P.ProductName;

SELECT ProductID,
SUM(StockQuantity) AS TotalOrdered
FROM Products
GROUP BY ProductID
ORDER BY TotalOrdered DESC
LIMIT 5;
