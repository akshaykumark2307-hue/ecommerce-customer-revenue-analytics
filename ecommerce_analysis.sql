CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;
CREATE TABLE ecommerce (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(30),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(100),
    transactionaltype VARCHAR(30),
    SalesQty INT,
    CancellationQty INT,
    Date DATE,
    Year INT,
    MonthNumber INT,
    MonthName VARCHAR(20),
    Quarter VARCHAR(5),
    Day INT,
    DayName VARCHAR(20),
    Hour INT,
    MonthYear VARCHAR(10)
);
SELECT COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM ecommerce;
 SELECT SUM(SalesQty) AS TotalQuantity
FROM ecommerce;
SELECT transactionaltype,
    COUNT(*) AS Transactions,
    SUM(Quantity) AS Quantity
FROM ecommerce
GROUP BY transactionaltype;
SELECT Country,
    COUNT(DISTINCT InvoiceNo) AS Orders,
    SUM(SalesQty) AS Quantity
FROM ecommerce
GROUP BY Country
ORDER BY Orders DESC
LIMIT 10;
SELECT StockCode,
    Description,
    SUM(SalesQty) AS Quantity
FROM ecommerce
GROUP BY StockCode, Description
ORDER BY Quantity DESC
LIMIT 10;

SELECT Year,
    MonthNumber,
    MonthName,
    SUM(SalesQty) AS Quantity,
    COUNT(DISTINCT InvoiceNo) AS Orders
FROM ecommerce
GROUP BY 
    Year,
    MonthNumber,
    MonthName
ORDER BY
    Year,
    MonthNumber;
    
    SELECT CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Orders,
    SUM(SalesQty) AS Quantity
FROM ecommerce
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Orders DESC
LIMIT 10;
