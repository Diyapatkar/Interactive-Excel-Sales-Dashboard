-- Month-over-Month Sales Growth
WITH M AS (
    SELECT YEAR([Order_Date]) AS Y,
           MONTH([Order_Date]) AS M,
           SUM(Sales) AS Sales
    FROM RetailSales
    GROUP BY YEAR([Order_Date]), MONTH([Order_Date])
)
SELECT Y, M, Sales,
       LAG(Sales) OVER (ORDER BY Y, M) AS PreviousSales,
       ROUND((Sales - LAG(Sales) OVER (ORDER BY Y, M)) * 100.0
       / NULLIF(LAG(Sales) OVER (ORDER BY Y, M), 0), 2) AS GrowthPercent
FROM M
ORDER BY Y, M;

-- Discount vs Profit
SELECT
    Discount,
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit
FROM RetailSales
GROUP BY Discount
ORDER BY Discount;

-- Low-Profit Categories
SELECT TOP 1 Category,
       SUM(Sales) AS TotalSales,
       SUM(Profit) AS TotalProfit
FROM RetailSales
GROUP BY Category
ORDER BY TotalProfit ASC;

-- Best and Worst Regions
SELECT
    Region,
    SUM(Profit) AS TotalProfit
FROM RetailSales
GROUP BY Region
ORDER BY TotalProfit DESC;