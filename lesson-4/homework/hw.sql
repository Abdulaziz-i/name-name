SELECT TOP 5 percent [EmployeeKey]
, [FirstName]
, [LastName]
, [MiddleName]
, [VacationHours]
, [SalesPersonFlag]
, [DepartmentName]
FROM [AdventureWorksDW2022].[dbo].[DimEmployee]
order by VacationHours DESC

SELECT*FROM [AdventureWorksDW2022].[dbo].[DimProduct]
WHERE ListPrice>100

SELECT*FROM [AdventureWorksDW2022].[dbo].[DimCustomer]
WHERE FirstName LIKE 'A%';

SELECT*FROM [AdventureWorksDW2022].[dbo].[DimProduct]
ORDER BY ListPrice asc

SELECT*FROM [AdventureWorksDW2022].[dbo].[DimEmployee]
WHERE Salary >=60000 and Department='HR'

SELECT 
EmployeeID,
FirstName,
LastName,
ISNULL (Email, 'noemail@example.com') AS Email FROM Employees;

SELECT*FROM [AdventureWorksDW2022].[dbo].[DimProduct]
WHERE ListPrice BETWEEN 50 AND 100

SELECT DISTINCT EnglishProductName FROM [AdventureWorksDW2022].[dbo].[DimProduct]

SELECT*FROM [AdventureWorksDW2022].[dbo].[DimProduct]
ORDER BY EnglishProductName DESC

SELECT DISTINCT ProductSubcategoryKey FROM [AdventureWorksDW2022].[dbo].[DimProduct]

SELECT*FROM [AdventureWorksDW2022].[dbo].[DimProduct]
ORDER BY ProductSubcategoryKey DESC
