-- BDA03 GROUP5 TAN QI TING

-- Challenge 1: Retrieve Product Price Information:--
-- Q1: Retrieve products whose list price is higher than the average unit price
SELECT ProductID, Name, ListPrice FROM SalesLT.Product
WHERE ListPrice > (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail)
ORDER BY ProductID;

-- Q2. Retrieve products with a list price of $100 or more than have been sold for less than $100:
SELECT ProductID, Name, ListPrice FROM SalesLT.Product
WHERE ProductID IN 
(SELECT ProductID FROM SalesLT.SalesOrderDetail WHERE UnitPrice <=100.00) 
AND ListPrice >= 100.00 
ORDER BY ProductID

-- Q3. Retrieve the cost, list price and average selling price for each product
SELECT ProductID, Name, StandardCost, ListPrice, 
(SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail AS sod 
WHERE p.ProductID = sod.ProductID) 
AS AvgSellingPrice
FROM SalesLT.Product as p 
ORDER BY ProductID 

-- Q4. Retrieve products that have an average selling price that is lower than the cost
SELECT ProductID, Name, StandardCost, ListPrice, 
(SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail AS sod 
WHERE p.ProductID = sod.ProductID) 
AS AvgSellingPrice
FROM SalesLT.Product as p 
WHERE StandardCost > 
(SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail AS sod 
WHERE p.ProductID = sod.ProductID)
ORDER BY ProductID 
-- Challenge 2: Retrieve Customer Information:--
-- Q1. Retrieve customer information for all sales orders
SELECT soh.SalesOrderID, soh.CustomerID, ci.FirstName, ci.LastName, soh.TotalDue
FROM SalesLT.SalesOrderHeader AS soh
CROSS APPLY dbo.ufnGetCustomerInformation(soh.CustomerID) AS ci
ORDER BY soh.SalesOrderID;

-- Q2. Retrieve customer address information
SELECT ca.CustomerID, c.FirstName, c.LastName, A.AddressLine1, a.City
FROM SalesLT.Address AS a
JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
CROSS APPLY dbo.ufnGetCustomerInformation(ca.CustomerID) AS ci
ORDER BY ca.CustomerID;