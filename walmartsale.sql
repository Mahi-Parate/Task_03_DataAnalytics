create database Walmart_sales;
use Walmart_sales;
CREATE TABLE retail_sales (
    Store INT,
    Date DATE,
    Weekly_Sales DECIMAL(10,2),
    Holiday_Flag INT,
    Temperature DECIMAL(5,2),
    Fuel_Price DECIMAL(5,2),
    CPI DECIMAL(7,2),
    Unemployment DECIMAL(4,2)
);
LOAD DATA Local INFILE 'C:/Users/ashpa/Downloads/Walmart_Sales.csv' INTO TABLE  retail_sales
FIELDS TERMINATED BY ','
ignore 1 lines;
select * from retail_sales ;

query1 :Find the total weekly sales for each year
SELECT YEAR(Date) AS sales_year, SUM(Weekly_Sales) AS total_sales
FROM retail_sales
GROUP BY sales_year
ORDER BY sales_year;
query2:get sales trend of a particular store
SELECT Date, Weekly_Sales
FROM retail_sales
WHERE Store = 5
ORDER BY Date;
query3:Find the highest and lowest sales for each store.
SELECT Store, 
       MAX(Weekly_Sales) AS highest_sales, 
       MIN(Weekly_Sales) AS lowest_sales
FROM retail_sales
GROUP BY Store;
query4:Get monthly sales totals for all stores combined.
SELECT MONTH(Date) AS month, SUM(Weekly_Sales) AS monthly_sales
FROM retail_sales
GROUP BY MONTH(Date)
ORDER BY month;
query5:Find the top 5 highest sales weeks overall.
SELECT Date, Store, Weekly_Sales
FROM retail_sales
ORDER BY Weekly_Sales DESC
LIMIT 5;
query6:Show the average weekly sales during holiday weeks vs non-holiday weeks.
SELECT Holiday_Flag, AVG(Weekly_Sales) AS avg_sales
FROM retail_sales
GROUP BY Holiday_Flag;
query7:Find total sales of each store (sorted in descending order).
SELECT Store, SUM(Weekly_Sales) AS total_sales
FROM retail_sales
GROUP BY Store
ORDER BY total_sales DESC;





















