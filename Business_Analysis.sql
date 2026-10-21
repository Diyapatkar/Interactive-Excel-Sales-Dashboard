-- Total sales, profit and quantity
SELECT
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    SUM(Quantity) AS TotalQuantity
FROM RetailSales;

-- Monthly Sales & Profit
SELECT
    YEAR([Order_Date]) AS SalesYear,
    MONTH([Order_Date]) AS SalesMonth,
    SUM(Sales) AS MonthlySales,
    SUM(Profit) AS MonthlyProfit
FROM RetailSales
GROUP BY YEAR([Order_Date]), MONTH([Order_Date])
ORDER BY SalesYear, SalesMonth;

-- Category Performance
SELECT
    Category,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM RetailSales
GROUP BY Category
ORDER BY TotalProfit DESC;

-- Regional Performance
SELECT
    Region,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM RetailSales
GROUP BY Region
ORDER BY TotalProfit DESC;

-- Top 10 Products by Sales
SELECT TOP 10
    [Product_Name],
    SUM(Sales) AS TotalSales
FROM RetailSales
GROUP BY [Product_Name]
ORDER BY TotalSales DESC;

-- Loss-Making Products
SELECT
    [Product_Name],
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM RetailSales
GROUP BY [Product_Name]
HAVING SUM(Profit) < 0
ORDER BY TotalProfit ASC;

