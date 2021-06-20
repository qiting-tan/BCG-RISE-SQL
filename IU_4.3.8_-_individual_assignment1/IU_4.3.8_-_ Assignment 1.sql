-- BDA03 GROUP5 TAN QI TING

-- Challenge 1: Retrieve Customer Addresses:--
-- Q1. Retrieve Customer Detail:
SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM SalesLT.Customer AS c 
JOIN SalesLT.CustomerAddress AS ca 
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Main Office';

--Q2. Retrieve Shipping Addresses
SELECT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
FROM SalesLT.Customer AS c 
JOIN SalesLT.CustomerAddress AS ca 
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Shipping';

--Q3 Combine billing and shipping addresses
--Step 1: Create 'Billing first
SELECT c.CompanyName, a.AddressLine1, a.City, 'Billing' AS AddressType
FROM SalesLT.Customer AS c 
JOIN SalesLT.CustomerAddress AS ca 
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Main Office'

UNION --Union both 'Billing' ad 'Shipping

--Step 2: Create 'Shipping' Next
SELECT c.CompanyName, a.AddressLine1, a.City, 'Shipping' AS AddressType
FROM SalesLT.Customer AS c 
JOIN SalesLT.CustomerAddress AS ca 
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Shipping'

ORDER BY c.CompanyName, AddressType; --Order by Company Name and Address Type



-- Challenge 2: Filter Customer Addresses:--
--Q1. Retrieve Customers with only a main office address
SELECT c.CompanyName 
FROM SalesLT.Customer AS c 
JOIN SalesLT.CustomerAddress as ca 
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address as a 
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Main Office'

EXCEPT 

SELECT c.CompanyName 
FROM SalesLT.Customer AS c 
JOIN SalesLT.CustomerAddress as ca 
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address as a 
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Shipping'

ORDER BY c.CompanyName

--Q2. Retrieve Only customers with both main office address and a shipping address
SELECT c.CompanyName 
FROM SalesLT.Customer AS c 
JOIN SalesLT.CustomerAddress as ca 
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address as a 
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Main Office'

INTERSECT

SELECT c.CompanyName 
FROM SalesLT.Customer AS c 
JOIN SalesLT.CustomerAddress as ca 
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address as a 
ON ca.AddressID = a.AddressID
WHERE ca.AddressType = 'Shipping'

ORDER BY c.CompanyName
