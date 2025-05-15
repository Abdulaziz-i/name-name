WITH Regions AS (
    SELECT DISTINCT Region FROM #RegionSales 
),
Distributors AS (
    SELECT DISTINCT Distributor FROM #RegionSales 
),
AllCombos AS (
    SELECT R.Region, D.Distributor
    FROM Regions R 
    CROSS JOIN Distributors D 
)
SELECT
    AC.Region,
    AC.Distributor,
    ISNULL(RS.Sales, 0) AS Sales 
FROM AllCombos AC 
LEFT JOIN #RegionSales RS 
  ON AC.Region = RS.Region AND AC.Distributor = RS.Distributor
ORDER BY AC.Distributor, AC.Region;


SELECT
    E.ManagerID AS ManagerID,
    M.Name AS ManagerName,
    COUNT(*) AS DirectReports 
FROM Employee E 
JOIN Employee M ON E.ManagerID = M.ID
GROUP BY E.ManagerID, M.Name
HAVING COUNT(*) >= 5;


SELECT
    P.Product_Name,
    SUM(O.Unit) AS Total_Units
FROM Orders O 
JOIN Products P ON O.Product_id = P.Product_id
WHERE O.Order_date >= '2020-02-01'
AND O.Order_date < '2020-03-01'
GROUP BY P.Product_name
HAVING SUM(O.Unit) >= 100;


CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');


WITH VendorCounts AS (
    SELECT
        CustomerID,
        Vendor,
        COUNT(*) AS OrderCount,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rn 
    FROM Orders
    GROUP BY CustomerID, Vendor
)
SELECT CustomerID, Vendor, OrderCount
FROM VendorCounts
WHERE rn = 1;


DECLARE @Number INT = 91
DECLARE @Inc INT = 2
DECLARE @Checker INT = 0

WHILE @Inc < @Number
    BEGIN
        IF @Number % @Inc != 0
          BEGIN
              SET @Checker = 1
              SET @Inc = @Inc + 1
          END 
        ELSE 
          BEGIN 
            SET @Checker = 0
            BREAK
        END 
    END 
IF @Checker = 0
    BEGIN 
        PRINT 'Not Prime'
    END
ELSE
    BEGIN
        PRINT 'Prime'
    END


WITH LocationStats AS (
    SELECT 
        Device_id, 
        COUNT(*) AS TotalSignals,
        COUNT(DISTINCT Locations) AS Num_locations
    FROM Device
    GROUP BY Device_id
),
MostSignals AS (
    SELECT 
        Device_id, 
        Locations AS Most_Signals_Location,
        COUNT(*) AS LocationCount,
        ROW_NUMBER() OVER (PARTITION BY Device_id ORDER BY COUNT(*) DESC) AS rn
    FROM Device 
    GROUP BY Device_id, Locations
)
SELECT 
    L.Device_id,
    L.Num_Locations,
    M.Most_Signals_Location,
    L.TotalSignals
FROM LocationStats L
JOIN MostSignals M ON L.Device_id = M.Device_id
WHERE rn = 1
ORDER BY L.Device_id;


WITH DeptAvg AS (
   SELECT DeptID, AVG(Salary) AS AvgSalary
   FROM Employee
   GROUP BY DeptID
)
SELECT E.EmpID, E.EmpName, E.Salary
FROM Employee E
JOIN DeptAVG D ON E.DeptID = D.DeptID
WHERE E.Salary > D.AvgSalary;


SELECT 
    SUM(CASE WHEN Num1 = Num2 THEN 100 ELSE 10 END) AS Bonus 
FROM (
SELECT T.TicketID, 
COUNT(T.Number) AS Num1, 
COUNT(N.Number) AS Num2  
FROM Numbers N
RIGHT JOIN Tickets T ON N.Number = T.Number 
GROUP BY T.TicketID
HAVING COUNT(N.Number) > 0) AS A 
 

WITH PlatformUsage AS (
    SELECT User_id, 
    Spend_date,
MAX(CASE WHEN Platform = 'Mobile' THEN 1 ELSE 0 END) AS Used_mobile,
MAX(CASE WHEN Platform = 'Desktop' THEN 1 ELSE 0 END) AS Used_desktop
FROM Spending
GROUP BY User_id, Spend_date
),
UserType AS (
    SELECT User_id,
    Spend_date,
CASE WHEN Used_mobile = 1 AND Used_desktop = 0 THEN 'Mobile Only'
     WHEN Used_mobile = 0 AND Used_desktop = 1 THEN 'Desktop Only'
     WHEN Used_mobile = 1 AND Used_desktop = 1 THEN 'Both'
    END AS Usage_type
FROM PlatformUsage
),
SpendingWithType AS (
SELECT
    S.Spend_date,
    U.Usage_type,
    S.User_id,
    S.Amount
FROM Spending S 
JOIN UserType U
ON S.User_id = U.User_id AND S.Spend_date = U.Spend_date
)
SELECT 
Spend_date,
Usage_type,
COUNT(DISTINCT User_id) AS TotalUsers,
SUM(Amount) AS TotalAmount
FROM SpendingWithType
GROUP BY Spend_date, Usage_type
ORDER BY Spend_date, Usage_type;


WITH CTE AS (
      SELECT Product, 1 AS Quantity
    FROM Grouped
UNION ALL
      SELECT CTE.Product, CTE.Quantity + 1
     FROM CTE
    JOIN Grouped G ON G.Product = CTE.Product
    WHERE CTE.Quantity < G.Quantity)
SELECT Product, 1 AS Quantity
FROM CTE
ORDER BY Product;
