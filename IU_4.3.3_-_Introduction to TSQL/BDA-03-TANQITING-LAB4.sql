-- BDA03 GROUP5 TAN QI TING

-- Challenge 1: Retrieve Customer Data:--
-- Q1. Retrieve Customer Detail:
SELECT * FROM SalesLT.Customer;

-- Q2. Retrieve Customer name data:
SELECT Title, FirstName, MiddleName, LastName, Suffix 
FROM SalesLT.Customer;

-- Q3. Retrieve customer names and phone numbers:
SELECT SalesPerson, Title + ' ' + LastName AS CustomerName, Phone 
FROM SalesLT.Customer;


-- Challenge 2:Retrieve Customer and Sales Data:--
-- Q1. Retrieve a list of customer companies:
SELECT CAST(CustomerID as varchar) + ': ' + CompanyName AS CustomerCompany 
FROM SalesLT.Customer;

-- Q2. Retrieve a list of sales order revisions:
SELECT SalesOrderNumber + ' ('+ STR(RevisionNumber,1) +')' AS OrderRevision, 
CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate 
FROM SalesLT.SalesOrderHeader


-- Challenge 3: Retrieve Customer Contact Details:--
-- Q1. Retrieve customer contact names with middle names if known:
SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', ' ') + LastName AS CustomerName 
FROM SalesLT.Customer

-- Q2. Retrieve primary contact details:
SELECT CustomerID, ISNULL(EmailAddress, Phone) AS PrimaryContact 
FROM SalesLT.Customer

-- Q3. Retrieve shipping status:
SELECT SalesOrderID, OrderDate, 
CASE
    WHEN ShipDate IS NOT NULL THEN 'Shipped' 
    ELSE 'Awaiting Shipment' 
END
AS ShippingStatus 
FROM SalesLT.SalesOrderHeader

-- Complete --