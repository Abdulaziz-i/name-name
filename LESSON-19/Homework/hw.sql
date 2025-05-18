CREATE OR ALTER PROCEDURE sp_CalculateEmployeeBonus
AS
BEGIN
    CREATE TABLE #EmployeeBonus (
        EmployeeID INT,
        FullName NVARCHAR(100),
        Department NVARCHAR(50),
        Salary DECIMAL(10,2),
        BonusAmount DECIMAL(10,2)
    );

    INSERT INTO #EmployeeBonus (EmployeeID, FullName, Department, Salary, BonusAmount)
    SELECT 
        E.EmployeeID,
        E.FirstName + ' ' + E.LastName AS FullName,
        E.Department,
        E.Salary,
        E.Salary * DB.BonusPercentage / 100 AS BonusAmount
    FROM 
        Employees E
    INNER JOIN 
        DepartmentBonus DB ON E.Department = DB.Department;

    SELECT * FROM #EmployeeBonus;
END;

EXEC sp_CalculateEmployeeBonus


CREATE OR ALTER PROCEDURE sp_UpdateDepartmentSalary
    @DeptName NVARCHAR(50),
    @IncreasePercent DECIMAL(5,2)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * @IncreasePercent / 100.0)
    WHERE Department = @DeptName;

    SELECT 
        EmployeeID,
        FirstName + ' ' + LastName AS FullName,
        Department,
        Salary
    FROM Employees
    WHERE Department = @DeptName;
END;



MERGE INTO Products_Current AS TARGET
USING Products_New AS SOURCE
ON TARGET.ProductID = SOURCE.ProductID

WHEN MATCHED THEN 
    UPDATE SET 
        TARGET.ProductName = SOURCE.ProductName,
        TARGET.Price = SOURCE.Price

WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, ProductName, Price)
    VALUES (SOURCE.ProductID, SOURCE.ProductName, SOURCE.Price)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

SELECT * FROM Products_Current;



SELECT 
    t.id,
    CASE 
        WHEN t.p_id IS NULL THEN 'Root'
        WHEN NOT EXISTS (
            SELECT 1 FROM Tree AS children WHERE children.p_id = t.id
        ) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree t;


SELECT 
    s.user_id,
    COUNT(C.user_id) AS total_attempts,
    SUM(CASE WHEN C.action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_count,
    ROUND(
        COALESCE(
            1.0 * SUM(CASE WHEN C.action = 'confirmed' THEN 1 ELSE 0 END) / NULLIF(COUNT(C.user_id), 0),
            0
        ), 
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations C ON s.user_id = C.user_id
GROUP BY s.user_id;


SELECT *
FROM Employees
WHERE salary = (
    SELECT MIN(salary)
    FROM Employees
);


CREATE PROCEDURE GetProductSalesSummary
    @ProductID INT
AS
BEGIN
    SELECT 
        p.ProductName,
        SUM(s.Quantity) AS TotalQuantitySold,
        SUM(s.Quantity * p.Price) AS TotalSalesAmount,
        MIN(s.SaleDate) AS FirstSaleDate,
        MAX(s.SaleDate) AS LastSaleDate
    FROM Products p
    LEFT JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.ProductID = @ProductID
    GROUP BY p.ProductName, p.Price;
END;

EXEC GetProductSalesSummary @ProductID = 10;
