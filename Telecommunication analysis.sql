SELECT * FROM telco_data;
/*Churn Rate*/
SELECT "Churn",
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM telco_data) AS churn_percentage
FROM telco_data
GROUP BY "Churn";

/*Churn by Gender*/
SELECT "gender",
       SUM(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) AS churn_count,
       COUNT(*) AS total_customers,
       ROUND(SUM(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_data
GROUP BY "gender";

/*Senior Citizens vs Non-Seniors Churn*/
SELECT "SeniorCitizen",
       ROUND(AVG(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS churn_rate
FROM telco_data
GROUP BY "SeniorCitizen";

/*Average Tenure of Churned vs Retained Customers*/
SELECT "Churn",
       ROUND(AVG("tenure"),2) AS avg_tenure
FROM telco_data
GROUP BY "Churn";

/*Churn by Contract Type*/
SELECT "Contract",
       COUNT(*) AS total_customers,
       SUM(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(SUM(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate
FROM telco_data
GROUP BY "Contract"
ORDER BY churn_rate DESC;

/*Payment Method and Churn*/
SELECT "PaymentMethod",
       COUNT(*) AS total_customers,
       SUM(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
       ROUND(SUM(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate
FROM telco_data
GROUP BY "PaymentMethod"
ORDER BY churn_rate DESC;

/*Phone Service vs Churn*/
SELECT "PhoneService",
       ROUND(AVG(CASE WHEN "Churn" = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS churn_rate
FROM  telco_data
GROUP BY "PhoneService";

/*Streaming Services Usage*/
SELECT "StreamingTV",
       "StreamingMovies",
       COUNT(*) AS customer_count,
       AVG("MonthlyCharges") AS avg_monthly
FROM telco_data
GROUP BY "StreamingTV", "StreamingMovies"
ORDER BY customer_count DESC;

/*Top 10 Highest Paying Customers*/
SELECT "customerID",
       "MonthlyCharges",
       "TotalCharges" AS total_spent,
       "Churn"
FROM telco_data
ORDER BY total_spent DESC
LIMIT 10;









