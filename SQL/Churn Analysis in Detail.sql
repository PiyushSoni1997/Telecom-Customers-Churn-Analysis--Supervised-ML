--CHURN Analysis KPIs

--Churn by Contract
SELECT Contract, (CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100 AS Churn_Rate
FROM dbo.Churn
GROUP BY Contract 
ORDER BY Churn_Rate

--Churn by Internet Service
SELECT InternetService, (CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100 AS Churn_Rate
FROM dbo.Churn
GROUP BY InternetService 
ORDER BY Churn_Rate

--Churn by Payment Method
SELECT PaymentMethod, (CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100 AS Churn_Rate
FROM dbo.Churn
GROUP BY PaymentMethod
ORDER BY Churn_Rate

--Churn by TenureGroup
SELECT tenureperiod, (CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100 AS Churn_Rate
FROM dbo.Churn
GROUP BY tenureperiod
ORDER BY Churn_Rate

--Revenue from Churned Customers
SELECT SUM(TotalCharges) AS Total_Revenue_Churned
FROM dbo.Churn
WHERE Churn = 0

--Monthly Revenue at Risk
SELECT
    SUM(MonthlyCharges) AS Monthly_Revenue_At_Risk
FROM dbo.Churn
WHERE Churn = 1;

--Customers who pay more but churn
SELECT * FROM dbo.Churn
WHERE Churn = 1 AND MonthlyCharges > (
    SELECT(1.5 * AVG(MonthlyCharges))
    FROM dbo.Churn)

--Service Engagement and Churning
SELECT TechSupport, COUNT(customerID) as Customers, SUM(Churn) as Churned, ROUND((CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100,2) AS Churn_Rate
FROM dbo.Churn
GROUP BY TechSupport

SELECT OnlineSecurity, COUNT(customerID) as Customers, SUM(Churn) as Churned, ROUND((CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100,2) AS Churn_Rate
FROM dbo.Churn
GROUP BY OnlineSecurity

SELECT OnlineBackup, COUNT(customerID) as Customers, SUM(Churn) as Churned, ROUND((CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100,2) AS Churn_Rate
FROM dbo.Churn
GROUP BY OnlineBackup

SELECT DeviceProtection, COUNT(customerID) as Customers, SUM(Churn) as Churned, ROUND((CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100,2) AS Churn_Rate
FROM dbo.Churn
GROUP BY DeviceProtection

--Churn by Senior Citizen and Gender

SELECT SeniorCitizen, Round((CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100,2) AS Churn_Rate
FROM dbo.Churn
GROUP BY SeniorCitizen
ORDER BY Churn_Rate

SELECT gender, Round((CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100,2) AS Churn_Rate
FROM dbo.Churn
GROUP BY gender
ORDER BY Churn_Rate

--Cross Analysis

--Internet Service and Contract
SELECT Contract, InternetService, COUNT(customerID) as Customers, SUM(Churn) as Churned, ROUND((CAST(SUM(Churn) AS FLOAT) / COUNT(*)) * 100,2) AS Churn_Rate
FROM dbo.Churn
GROUP BY Contract, InternetService
ORDer BY Churn_Rate DESC