USE RetailSalesDB;
GO

SELECT
    SUM(Sales) AS TotalSales,
    SUM(Profit) AS TotalProfit,
    COUNT(DISTINCT [Order_ID]) AS TotalOrders,
    SUM(Quantity) AS UnitsSold,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales), 2
    ) AS ProfitMarginPercent
FROM RetailSales;