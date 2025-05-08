
SELECT 
LEFT(Name, CHARINDEX(',', Name)-1) AS Name,
LTRIM(RIGHT(Name, LEN(Name) - CHARINDEX(',', Name))) AS Surname
FROM TestMultipleColumns;

SELECT *
FROM TestPercent
WHERE Strs LIKE '%!%%' ESCAPE '!';

SELECT
SUBSTRING(Vals, 1, CHARINDEX('.', Vals)-1) AS BeforeDot,
SUBSTRING(Vals, CHARINDEX('.', Vals)+1, LEN(Vals)) AS AfterDot
FROM Splitter;

SELECT
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
  '1234ABC123456XYZ1234567890ADS',
  '0', 'X'),
  '1', 'X'),
  '2', 'X'),
  '3', 'X'),
  '4', 'X'),
  '5', 'X'),
  '6', 'X'),
  '7', 'X'),
  '8', 'X'),
  '9', 'X') AS ReplacedString;

SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;

SELECT 
  texts,
  LEN(texts) - LEN(REPLACE(texts, ' ', '')) AS SpaceCount
FROM CountSpaces;

SELECT 
    e.name AS EmployeeName
FROM 
    Employee e
JOIN 
    Employee m ON e.managerId = m.id
WHERE 
    e.salary > m.salary;


    employee_id,
    first_name,
    last_name,
    hire_date,
    DATEDIFF(YEAR, hire_date, GETDATE()) AS YearsOfService
FROM 
    Employees
WHERE 
    DATEDIFF(YEAR, hire_date, GETDATE()) > 10 
    AND DATEDIFF(YEAR, hire_date, GETDATE()) < 15;


DECLARE @input VARCHAR(100) = 'rtcfvty34redt';

WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < LEN(@input)
),
Separated AS (
    SELECT 
        n,
        SUBSTRING(@input, n, 1) AS ch
    FROM Numbers
),
Classified AS (
    SELECT 
        ch,
        CASE 
            WHEN ch LIKE '[0-9]' THEN ch
            ELSE ''
        END AS Digit,
        CASE 
            WHEN ch LIKE '[a-zA-Z]' THEN ch
            ELSE ''
        END AS Letter
    FROM Separated
)
SELECT 
    STRING_AGG(Digit, '') AS OnlyDigits,
    STRING_AGG(Letter, '') AS OnlyLetters
FROM Classified
OPTION (MAXRECURSION 1000);

SELECT 
    w1.Id
FROM 
    Weather w1
JOIN 
    Weather w2 
    ON DATEDIFF(DAY, w2.RecordDate, w1.RecordDate) = 1
WHERE 
    w1.Temperature > w2.Temperature;

SELECT
    player_id,
    MIN(login_date) AS first_login_date
FROM
    Activity
GROUP BY
    player_id;

SELECT
    TRIM(
        PARSENAME(
            REPLACE(fruit_list, ',', '.'), 
            3                              
        )
    ) AS Third_Fruit
FROM fruits;

WITH RECURSIVE CharSplit AS (
    SELECT
        SUBSTRING('sdgfhsdgfhs@121313131', 1, 1) AS Char,
        1 AS Position
    UNION ALL
    SELECT
        SUBSTRING('sdgfhsdgfhs@121313131', Position + 1, 1) AS Char,
        Position + 1
    FROM CharSplit
    WHERE Position < LEN('sdgfhsdgfhs@121313131')
)
SELECT Char
FROM CharSplit
OPTION (MAXRECURSION 0);

SELECT
    p1.id,
    CASE 
        WHEN p1.code = 0 THEN p2.code
        ELSE p1.code
    END AS code
FROM p1
JOIN p2 ON p1.id = p2.id;

SELECT
    Employee_ID,
    First_Name,
    Last_Name,
    HIRE_DATE,
    CASE
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) < 1 THEN 'New Hire'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 1 AND 5 THEN 'Junior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 5 AND 10 THEN 'Mid-Level'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) BETWEEN 10 AND 20 THEN 'Senior'
        WHEN DATEDIFF(YEAR, HIRE_DATE, GETDATE()) > 20 THEN 'Veteran'
    END AS Employment_Stage
FROM Employees;

 SELECT
    Vals,
    CASE
        WHEN PATINDEX('%[0-9]%', Vals) = 1
        THEN LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'a') - 1)
        ELSE NULL
    END AS ExtractedInteger
FROM GetIntegers;


