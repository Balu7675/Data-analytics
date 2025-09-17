SELECT * FROM Ecommerce_Delivery_Analytics_New;

/*Average delivery time per platform*/
SELECT "Platform", 
       AVG("Delivery Time (Minutes)") AS avg_delivery_time
FROM Ecommerce_Delivery_Analytics_New
GROUP BY "Platform"
ORDER BY avg_delivery_time;

/*Top product categories by revenue*/
SELECT "Product Category", 
       SUM("Order Value (INR)") AS total_revenue
FROM Ecommerce_Delivery_Analytics_New
GROUP BY "Product Category"
ORDER BY total_revenue DESC;

/*Refund rate by platform*/
SELECT "Platform",
       SUM(CASE WHEN "Refund Requested" = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS refund_rate
FROM Ecommerce_Delivery_Analytics_New
GROUP BY "Platform"
ORDER BY refund_rate DESC;

/*Customer satisfaction by delay status*/
SELECT "Delivery Delay",
       AVG("Service Rating") AS avg_rating,
       COUNT(*) AS total_orders
FROM Ecommerce_Delivery_Analytics_New
GROUP BY "Delivery Delay";

/*Top 5 Highest Revenue Product Categories*/
SELECT "Product Category",
       SUM("Order Value (INR)") AS total_revenue
FROM Ecommerce_Delivery_Analytics_New
GROUP BY "Product Category"
ORDER BY total_revenue DESC
LIMIT 5;

/*Average Service Rating by Platform*/
SELECT "Platform",
       ROUND(AVG("Service Rating"),2) AS avg_rating
FROM Ecommerce_Delivery_Analytics_New
GROUP BY "Platform"
ORDER BY avg_rating DESC;

/*Highest Spending Customers*/
SELECT "Customer ID",
       SUM("Order Value (INR)") AS total_spent,
       COUNT(*) AS total_orders
FROM Ecommerce_Delivery_Analytics_New
GROUP BY "Customer ID"
ORDER BY total_spent DESC
LIMIT 10;








