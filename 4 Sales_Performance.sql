USE CRM_Management_System;
GO

----------------------------------------------------------
-- 1. Total Revenue
----------------------------------------------------------

SELECT
    SUM(OrderAmount) AS TotalRevenue
FROM Orders;

SELECT COUNT(*) AS TotalOrders
FROM Orders;
----------------------------------------------------------
-- 2. Total Orders
----------------------------------------------------------

SELECT
    COUNT(*) AS TotalOrders
FROM Orders;

----------------------------------------------------------
-- 3. Average Order Value
----------------------------------------------------------

SELECT
    AVG(OrderAmount) AS AverageOrderValue
FROM Orders;

----------------------------------------------------------
-- 4. Revenue by Sales Representative
----------------------------------------------------------

SELECT
    u.FullName,
    SUM(o.OrderAmount) AS Revenue
FROM Orders o
JOIN Accounts a
    ON o.AccountID = a.AccountID
JOIN Users u
    ON a.AssignedSalesRepID = u.UserID
GROUP BY u.FullName
ORDER BY Revenue DESC;

----------------------------------------------------------
-- 5. Top 10 Sales Representatives
----------------------------------------------------------

SELECT TOP 10
    u.FullName,
    SUM(o.OrderAmount) AS Revenue
FROM Orders o
JOIN Accounts a
    ON o.AccountID = a.AccountID
JOIN Users u
    ON a.AssignedSalesRepID = u.UserID
GROUP BY u.FullName
ORDER BY Revenue DESC;

----------------------------------------------------------
-- 6. Revenue by Country
----------------------------------------------------------

SELECT
    a.Country,
    SUM(o.OrderAmount) AS Revenue
FROM Orders o
JOIN Accounts a
    ON o.AccountID = a.AccountID
GROUP BY a.Country
ORDER BY Revenue DESC;

----------------------------------------------------------
-- 7. Revenue by Industry
----------------------------------------------------------

SELECT
    a.Industry,
    SUM(o.OrderAmount) AS Revenue
FROM Orders o
JOIN Accounts a
    ON o.AccountID = a.AccountID
GROUP BY a.Industry
ORDER BY Revenue DESC;

----------------------------------------------------------
-- 8. Orders by Status
----------------------------------------------------------

SELECT
    OrderStatus,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY OrderStatus;

----------------------------------------------------------
-- 9. Monthly Revenue
----------------------------------------------------------

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(OrderAmount) AS Revenue
FROM Orders
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY
    Year,
    Month;

----------------------------------------------------------
-- 10. Highest Order
----------------------------------------------------------

SELECT TOP 1 *
FROM Orders
ORDER BY OrderAmount DESC;

----------------------------------------------------------
-- 11. Lowest Order
----------------------------------------------------------

SELECT TOP 1 *
FROM Orders
ORDER BY OrderAmount ASC;

----------------------------------------------------------
-- 12. Revenue by Shipping Method
----------------------------------------------------------

SELECT
    ShippingMethod,
    SUM(OrderAmount) AS Revenue
FROM Orders
GROUP BY ShippingMethod;

----------------------------------------------------------
-- 13. Yearly Revenue
----------------------------------------------------------

SELECT
    YEAR(OrderDate) AS Year,
    SUM(OrderAmount) AS Revenue
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY Year;

----------------------------------------------------------
-- 14. Sales Representative Performance
----------------------------------------------------------

SELECT
    u.FullName,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.OrderAmount) AS Revenue,
    AVG(o.OrderAmount) AS AverageOrderValue
FROM Orders o
JOIN Accounts a
    ON o.AccountID = a.AccountID
JOIN Users u
    ON a.AssignedSalesRepID = u.UserID
GROUP BY u.FullName
ORDER BY Revenue DESC;

----------------------------------------------------------
-- 15. Top 5 Customers by Revenue
----------------------------------------------------------

SELECT TOP 5
    a.AccountName,
    SUM(o.OrderAmount) AS Revenue
FROM Orders o
JOIN Accounts a
    ON o.AccountID = a.AccountID
GROUP BY a.AccountName
ORDER BY Revenue DESC;