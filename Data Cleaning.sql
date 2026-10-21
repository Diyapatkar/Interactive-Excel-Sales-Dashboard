USE RetailSalesDB

-- Missing values check
SELECT * FROM RetailSales
WHERE Order_ID IS NULL
	OR Order_Date IS NULL
	OR Sales IS NULL	
	OR Profit IS NULL;

-- Duplicate rows checking
SELECT
	Order_ID,
	Order_Date,
	Product_Name,
	Sales,
	Profit,
	COUNT(*) AS DuplicateCount
FROM RetailSales
GROUP BY Order_ID, Order_Date, Product_Name, Sales, Profit
HAVING COUNT(*) > 1;

SELECT *
FROM RetailSales
WHERE [Order_ID] = 'US-2014-150119'
  AND [Order_Date] = '2014-04-23'
  AND [Product_Name] LIKE 'Global Leather Highback Executive Chair%';

DELETE FROM RetailSales
WHERE Row_ID = 3407;

SELECT *
FROM RetailSales
WHERE [Order_ID] = 'US-2014-150119'
  AND [Product_ID] = 'FUR-CH-10002965';

-- Invalid values check 
SELECT * FROM RetailSales
WHERE Sales < 0
	OR Quantity <= 0;

-- Date and profit summary check
SELECT 
	MIN(Order_Date) AS FirstOrderDate,
	MAX(Order_Date) AS LastOrderDate,
	SUM(Sales) AS TotalSales,
	SUM(Profit) AS TotalProfit
FROM RetailSales;

