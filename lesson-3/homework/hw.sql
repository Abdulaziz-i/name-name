CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price FLOAT,
    Stock INT
);

BULK INSERT Products
FROM '/var/opt/mssql/data/Products.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

SELECT*FROM Products;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

INSERT INTO Categories (CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Groceries');

ALTER TABLE Products
ADD CategoryID INT;

UPDATE Products
SET CategoryID = CASE
    WHEN Category = 'Electronics' THEN 1
    WHEN Category = 'Clothing' THEN 2
    WHEN Category = 'Groceries' THEN 3
    ELSE NULL
END;

ALTER TABLE Products
DROP COLUMN Category;

ALTER TABLE Products
DROP COLUMN Category;

ALTER TABLE Products
ADD CONSTRAINT FK_Category
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK (Price > 0);

SELECT*FROM Products

SELECT*FROM Categories
