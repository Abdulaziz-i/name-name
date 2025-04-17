select min(Price) from Products

select max(Salary) from Employees

select count(*) from Customers

select count(distinct ProductName) from Products

select sum(StockQuantity) from Products
where ProductID = 7

select avg(Age) from Employees

select DepartmentName, count(FirstName) from Employees
group by DepartmentName

SELECT Category, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;

select CustomerID, sum(SaleAmount) as TotalSales
from Sales
group by CustomerID;

SELECT DepartmentName, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY DepartmentName
HAVING COUNT(*) > 5;



SELECT p.Category, 
       SUM(s.SaleAmount) AS TotalSales,
       AVG(s.SaleAmount) AS AvgSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;

SELECT COUNT(FirstName) 
from Employees 
Where DepartmentName = 'HR'

SELECT 
MIN(Salary),
MAX(Salary) 
from Employees

SELECT DepartmentName,
AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentName; 

SELECT DepartmentName AS Department,
AVG(Salary) AS AverageSalary,
COUNT(*) AS Employees
FROM Employees
Group By DepartmentName;

SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400.00;

SELECT YEAR(SaleDate) AS SaleYear,
SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);

SELECT COUNT(*) AS CustomersWith3OrMoreOrders
FROM (
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    HAVING COUNT(OrderID) >= 3
) AS Sub;

SELECT DepartmentName, 
SUM(Salary) AS MoreThan500Salary
FROM Employees
GROUP BY DepartmentName
HAVING SUM(Salary) > 500000;
