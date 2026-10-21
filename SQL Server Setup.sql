-- SQL Server Setup & Data Import
CREATE DATABASE RetailSalesDB;
use RetailSalesDB

USE RetailSalesDB;
GO

SELECT TOP 10 *
FROM RetailSales;

SELECT COUNT(*) AS TotalRows
FROM RetailSales;

-- column check
EXEC sp_help 'RetailSales';

