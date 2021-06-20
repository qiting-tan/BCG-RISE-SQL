--BDA03 GROUP5 TANQITING

-- Challenge 1: Retrieve Data for Transportation Reports
SELECT * FROM SalesLT.Address;

-- Q1. Retrieve a list of cities
SELECT DISTINCT City, StateProvince 
FROM SalesLT.Address;

-- Q2. Retrieve the heaviest products
SELECT TOP 10 PERCENT Name 
FROM SalesLT.Product
ORDER BY Weight DESC;

-- Q3. Retrieve the heaviest 100 products not including the heaviest ten
SELECT Name 
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 10 ROWS 
FETCH NEXT 100 ROWS ONLY;


-- Challenge 2: Retrieve Product Data
-- Q1. Retrieve product details for product model1
SELECT Name, Color, Size 
FROM SalesLT.Product
WHERE ProductModelID = 1;

-- Q2. Filter products by color and size
SELECT ProductNumber, Name 
FROM SalesLT.Product
WHERE (Color = 'Black' or Color = 'Red' or Color = 'White')
AND (Size = 'S' or Size = 'M');
--OR--
SELECT ProductNumber, Name FROM SalesLT.Product
WHERE Color IN('Black', 'White','Red') and Size IN('S','M');

-- Q3. Filter products by product number
SELECT ProductNumber, Name, ListPrice 
FROM SalesLT.Product
WHERE ProductNumber lIKE 'BK-%';