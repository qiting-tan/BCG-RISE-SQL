-- BDA03 GROUP5 TAN QI TING

-- Challenge 1: Generate Invoice Reports:--
-- Q1. Retrieve Customer Detail:

SELECT oh.SalesOrderID, oh.TotalDue, c.CompanyName
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS oh
ON oh.CustomerID = c.CustomerID;

-- Q2. Retrieve Customer Order with adresses:
-- JOIN CustomerAddress, Address, SalesOrderHeader and Customer 
SELECT c.CompanyName, a.AddressLine1, ISNULL(a.AddressLine2,'') AS AddressLine2,
a.City, a.StateProvince, a.PostalCode, a.CountryRegion, oh.SalesOrderID, oh.TotalDue
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS oh
ON oh.CustomerID = c.CustomerID
JOIN SalesLT.CustomerAddress AS ca
ON ca.CustomerID = c.CustomerID AND ca.AddressType ='Main Office'
JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID;


-- Challenge 2: Retrieve Sales Data:--
-- Q1. Retrieve a list of all customers and their orders:
--LEFT OUTER JOIN results in the set of records that are in the LEFT table, if there is no match with the right table, the results are null. So, in this case, the LEFT table is Order Header as if the customer doesn't place the order and does not appear in Order Header, it will be considered as NULL.
SELECT c.CompanyName, c.FirstName, c.LastName, oh.SalesOrderID, oh.TotalDue 
FROM SalesLT.Customer as c 
LEFT OUTER JOIN SalesLT.SalesOrderHeader as oh
ON c.CustomerID = oh.CustomerID
ORDER BY oh.SalesOrderID DESC;

-- Q2. Retrieve a list of all customers with no address:
SELECT c.CustomerID, c.CompanyName, c.FirstName, c.LastName, c.Phone 
FROM SalesLT.Customer AS c 
LEFT JOIN SalesLT.CustomerAddress AS ca
ON ca.CustomerID = c.CustomerID
WHERE ca.AddressID IS NULL

-- Q3. Retrieve a list of customers and products without orders
SELECT  c.CustomerID, p.ProductID
FROM SalesLT.Customer AS c 
FULL JOIN SalesLT.SalesOrderHeader as oh
ON c.CustomerID = oh.CustomerID
FULL JOIN SalesLT.SalesOrderDetail as od
ON od.SalesOrderID = oh.SalesOrderID
FULL JOIN SalesLT.Product AS p 
ON p.ProductID = od.ProductID
WHERE oh.SalesOrderID IS NULL
ORDER BY ProductID, CustomerID;

--Complete--