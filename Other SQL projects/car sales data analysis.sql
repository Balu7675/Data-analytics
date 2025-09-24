SELECT * FROM car_sales_data;

SELECT "Manufacturer", "indian_price"
FROM car_sales_data
WHERE indian_price > 10000000
ORDER BY indian_price DESC
LIMIT 5;

ALTER TABLE car_sales_data
RENAME COLUMN "Engine size" TO Engine_size;

SELECT COUNT(*) 
FROM car_sales_data
WHERE "Fuel type" = 'Petrol';

SELECT "Model",COUNT(*) FROM car_sales_data
GROUP BY "Model";

--top 5 most expensive car by year
SELECT "Model","indian_price","Year of manufacture"
FROM car_sales_data
ORDER BY indian_price DESC LIMIT 5;

--avg mileage of each model
SELECT "Model" ,ROUND(AVG("Mileage"),2) AS Average_Mileage
FROM car_sales_data
GROUP BY "Model";

SELECT COUNT(*) 
FROM car_sales_data
WHERE "Fuel type" = 'Hybrid';








