-- KEY KPIs--

--Total Customers
SELECT COUNT(DISTINCT customerID) AS Total_Customers
FROM dbo.Churn

--Churned Customers
SELECT COUNT(DISTINCT customerID) AS Total_Customers
FROM dbo.Churn
WHERE Churn = 1

--Churn Rate
ALTER TABLE dbo.Churn
ALTER COLUMN Churn INT;
SELECT ROUND(
    (CAST(SUM(Churn) AS FLOAT) / COUNT(Churn)) * 100,
    2
) AS Churn_Rate
FROM dbo.Churn

--RETENTION RATE
SELECT
    100.0 * SUM(CASE WHEN Churn = 0 THEN 1 ELSE 0 END)
    / COUNT(*) AS Retention_Rate
FROM dbo.churn;

--TotalRevenue
SELECT SUM(TotalCharges) AS Total_Revenue
FROM dbo.Churn

--Avg Monthly Charges
SELECT AVG(MonthlyCharges) AS Avg_Monthly_Charges
FROM dbo.Churn

--Avg Tenure
SELECT AVG(tenure) AS Avg_Tenure
FROM dbo.churn;

