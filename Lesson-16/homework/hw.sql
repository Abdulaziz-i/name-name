WITH CTE AS (
    SELECT 1 AS NUM
    UNION ALL
    SELECT NUM + 1
    FROM CTE
    WHERE NUM < 1000
)
SELECT * FROM CTE
OPTION (MAXRECURSION 1000);


SELECT E.EmployeeID, E.FirstName, E.Salary, S.TotalSales
FROM Employees E 
    INNER JOIN (
        SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
    FROM Sales 
    GROUP BY EmployeeID
    ) AS S
    ON E.EmployeeID = S.EmployeeID;


WITH AvgSalary AS (
    SELECT AVG(Salary) AvgSal
    FROM Employees
)
SELECT E.*,
A.AvgSal
FROM Employees E
CROSS JOIN AvgSalary A;


SELECT 
P.ProductID,
P.ProductName,
P.CategoryID,
HS.MaxSales
FROM Products P 
JOIN (
    SELECT ProductID,
    MAX(SalesAmount) AS MaxSales
    FROM Sales
    GROUP BY ProductID
) AS HS ON P.ProductID = HS.ProductID;


WITH CTE AS (
    SELECT 1 AS Num 
    UNION ALL 
    SELECT Num * 2 FROM CTE 
    WHERE Num * 2 < 1000000)
    SELECT * FROM CTE OPTION (MAXRECURSION 1000);


WITH MoreThan5Sales AS (
    SELECT EmployeeID
    FROM Sales 
    GROUP BY EmployeeID
    HAVING COUNT(SalesID) > 5
)
SELECT E.*
FROM Employees E 
INNER JOIN MoreThan5Sales M ON E.EmployeeID = M.EmployeeID


WITH GreaterThan500 AS (
    SELECT ProductID 
    FROM Sales
    GROUP BY ProductID
    HAVING SUM(SalesAmount) > 500.00
)
SELECT P.*
FROM Products P 
INNER JOIN GreaterThan500 GT5 ON P.ProductID = GT5.ProductID;


WITH AvgSalary AS (
    SELECT AVG(Salary) AS AvgSal FROM Employees
)
SELECT E.*
FROM Employees E
CROSS JOIN AvgSalary A
WHERE E.Salary > A.AvgSal;


WITH Top5EmpByOrder AS (
    SELECT TOP 5 
    EmployeeID, 
    COUNT(SalesID) AS OrderCount
    FROM Sales
    GROUP BY EmployeeID
    ORDER BY COUNT(SalesID) DESC
)
SELECT E.*,
T.OrderCount
FROM Employees E 
INNER JOIN Top5EmpByOrder T ON E.EmployeeID = T.EmployeeID


WITH SalesPerProduct AS (
    SELECT 
        ProductID,
        COUNT(SalesID) AS SalesPerP
    FROM Sales 
    GROUP BY ProductID
)
SELECT 
    P.ProductID,
    P.ProductName,
    P.CategoryID,
    S.SalesPerP
FROM Products P 
INNER JOIN SalesPerProduct S ON P.ProductID = S.ProductID;
 

WITH CTE AS (
    SELECT 1 AS Num, 1 AS Factorial
    UNION ALL 
    SELECT Num + 1, (Num + 1) * Factorial
    FROM CTE 
    WHERE Num + 1 <= 9
)
SELECT * FROM CTE
OPTION (MAXRECURSION 10);


WITH CharCTE AS (
    SELECT 
        id,
        1 AS position,
        SUBSTRING(string, 1, 1) AS character,
        String
    FROM Example

    UNION ALL

    SELECT 
        id,
        position + 1,
        SUBSTRING(string, position + 1, 1),
        string
    FROM CharCTE
    WHERE position + 1 <= LEN(string)
)

SELECT id, position, character
FROM CharCTE
ORDER BY id, position
OPTION (MAXRECURSION 1000);


WITH MonthlySales AS (
    SELECT 
        YEAR(SaleDate) AS SaleYear,
        MONTH(SaleDate) AS SaleMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
),
SalesDiff AS (
    SELECT 
        curr.SaleYear,
        curr.SaleMonth,
        curr.TotalSales AS CurrentMonthSales,
        prev.TotalSales AS PreviousMonthSales,
        curr.TotalSales - ISNULL(prev.TotalSales, 0) AS SalesDifference
    FROM MonthlySales curr
    LEFT JOIN MonthlySales prev 
        ON (curr.SaleYear = prev.SaleYear AND curr.SaleMonth = prev.SaleMonth + 1)
        OR (curr.SaleYear = prev.SaleYear + 1 AND curr.SaleMonth = 1 AND prev.SaleMonth = 12)
)
SELECT * FROM SalesDiff
ORDER BY SaleYear, SaleMonth;


SELECT 
    E.EmployeeID,
    E.FirstName,
    Q.Quarter,
    Q.TotalSales
FROM Employees E
JOIN (
    SELECT 
        EmployeeID,
        DATEPART(QUARTER, SaleDate) AS Quarter,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
    HAVING SUM(SalesAmount) > 45000
) Q
ON E.EmployeeID = Q.EmployeeID
ORDER BY E.EmployeeID, Q.Quarter;
