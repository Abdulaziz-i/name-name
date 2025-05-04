
SELECT 
CONCAT(employee_id, '-', first_name, ' ', last_name) AS FullInfo
FROM Employees
Where employee_id = 100

UPDATE Employees
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124','999')
Where PHONE_NUMBER like '%124%';

SELECT
FIRST_NAME AS FirstName,
LEN(FIRST_NAME) AS NameLength
FROM Employees
WHERE 
 FIRST_NAME LIKE 'A%' OR
 FIRST_NAME LIKE 'J%' OR
 FIRST_NAME LIKE 'M%'
 ORDER BY FIRSt_NAME;

SELECT
MANAGER_ID, 
SUM(SALARY) AS TotalSalary
FROM Employees
GROUP BY MANAGER_ID

SELECT YEAR1,
CASE 
WHEN Max1 >= Max2 AND Max1 >= Max3 THEN Max1
WHEN Max2 >= Max1 AND Max2 >= Max3 THEN Max2
ELSE Max3
END AS MaxValue
FROM TestMax

SELECT
movie,
description,
rating
FROM cinema
WHERE id% 2 = 1
AND description NOT LIKE '%boring%';

SELECT
ID,
VALS 
FROM Singleorder
ORDER BY 
CASE WHEN ID = 0 THEN 1 ELSE 0 END,
ID DESC;

SELECT*FROM Orders
WHERE DeliveryState='tx' AND CustomerID IN(SELECT CustomerID FROM Orders WHERE DeliveryState='CA')

SELECT STRING_AGG(CONCAT(SequenceNumber, String), ', ') AS GroupedResult
FROM DMLTable;

SELECT 
    First_name, 
    Last_name
FROM 
    Employees
WHERE 
    LEN(CONCAT(First_name, Last_name)) 
    - LEN(REPLACE(CONCAT(First_name, Last_name), 'a', '')) >= 3;

SELECT 
  Department_ID,
  COUNT(*) AS TotalEmployees,
  100.0 * COUNT(CASE WHEN DATEDIFF(YEAR, Hire_Date, GETDATE()) > 3 THEN 1 END) / COUNT(*) AS PercentOver3Years
FROM 
  Employees
GROUP BY 
  Department_ID;

SELECT
JobDescription,
MAX(MissionCount) AS MostMission,
MIN(MissionCount) AS LeastMission
FROM Personal
GROUP BY JobDescription

SELECT 
    COALESCE(id, ssn, passportid, itin) AS FirstNonNullValue
FROM person;

