CREATE TABLE #MonthlySales (
    ProductID INT,
    TotalQuantity INT,
    TotalRevenue DECIMAL(12,2)
);

INSERT INTO #MonthlySales (ProductID, TotalQuantity, TotalRevenue)
SELECT 
    s.ProductID,
    SUM(s.Quantity) AS TotalQuantity,
    SUM(s.Quantity * p.Price) AS TotalRevenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
WHERE 
    YEAR(s.SaleDate) = YEAR(GETDATE()) AND
    MONTH(s.SaleDate) = MONTH(GETDATE())
GROUP BY s.ProductID;

SELECT * FROM #MonthlySales;


CREATE VIEW vw_ProductSalesSummary AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    ISNULL(SUM(s.Quantity), 0) AS TotalQuantitySold
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY 
    p.ProductID,
    p.ProductName,
    p.Category;

SELECT * FROM vw_ProductSalesSummary;


CREATE FUNCTION FN_GetTotalRevenueForProduct (@ProductID INT)
RETURNS DECIMAL(12,2)
AS 
BEGIN 
    DECLARE @TotalRevenue DECIMAL(12,2);

SELECT @TotalRevenue = 
    SUM(S.Quantity * P.Price)
FROM Sales S 
JOIN Products P ON S.ProductID = P.ProductID
WHERE S.ProductID = @ProductID;
RETURN ISNULL(@TotalRevenue, 0);
END;


CREATE FUNCTION fn_GetSalesByCategory (@Category VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        P.ProductName,
        SUM(S.Quantity) AS TotalQuantity,
        SUM(S.Quantity * P.Price) AS TotalRevenue
    FROM Sales S
    JOIN Products P ON S.ProductID = P.ProductID
    WHERE P.Category = @Category
    GROUP BY P.ProductName
);
SELECT * FROM fn_GetSalesByCategory('Electronics');


CREATE FUNCTION fn_IsPrime (@Number INT)
RETURNS VARCHAR(3)
AS
BEGIN
    DECLARE @i INT = 2;
    DECLARE @IsPrime BIT = 1;

    IF @Number < 2
        RETURN 'No';

    WHILE @i * @i <= @Number
    BEGIN
        IF @Number % @i = 0
        BEGIN
            SET @IsPrime = 0;
            BREAK;
        END
        SET @i = @i + 1;
    END

    RETURN CASE WHEN @IsPrime = 1 THEN 'Yes' ELSE 'No' END;
END;


CREATE FUNCTION fn_GetNumbersBetween (@Start INT, @End INT)
RETURNS @Result TABLE (Number INT)
AS
BEGIN
    ;WITH Numbers AS (
        SELECT @Start AS Number
        UNION ALL
        SELECT Number + 1
        FROM Numbers
        WHERE Number + 1 <= @End
    )
    INSERT INTO @Result
    SELECT Number FROM Numbers;

    RETURN;
END;


DECLARE @N INT = 2;

SELECT 
    (
        SELECT DISTINCT Salary
        FROM Employee
        ORDER BY Salary DESC
        OFFSET (@N - 1) ROWS FETCH NEXT 1 ROW ONLY
    ) AS getNthHighestSalary;


SELECT user_id AS id, COUNT(*) AS num
FROM (
    SELECT requester_id AS user_id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS user_id FROM RequestAccepted
) AS AllFriends
GROUP BY user_id
ORDER BY num DESC
LIMIT 1;


CREATE VIEW vw_CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name;


SELECT 
    g.RowNumber,
    COALESCE(g.TestCase, x.TestCase) AS Workflow
FROM Gaps g
OUTER APPLY (
    SELECT TOP 1 TestCase 
    FROM Gaps g2 
    WHERE g2.RowNumber <= g.RowNumber AND g2.TestCase IS NOT NULL 
    ORDER BY g2.RowNumber DESC
) x;
