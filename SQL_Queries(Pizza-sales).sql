SELECT * FROM pizza_sales;

--Total Revenue
SELECT SUM(total_price) as total_revenue
FROM pizza_sales;

--Average Order Value
SELECT SUM(total_price)/ COUNT(DISTINCT order_id) as Avg_order_value
FROM pizza_sales;

--Total Pizza Sold
SELECT SUM(quantity) as total_quantity
FROM pizza_sales;

--Total Orders
SELECT COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales;

--Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))AS DECIMAL(10,2)) AS Avg_pizzas_per_order
FROM pizza_sales;

--Daily Trends
SELECT DATENAME(DW, order_date) AS order_day, 
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

--Hourly Trend
SELECT DATEPART(HOUR, order_time) AS order_hours, 
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);

--% of sales by Pizza Category
SELECT pizza_category, 
SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales) AS Per_sales
FROM pizza_sales 
GROUP BY pizza_category;

--% of sales by Pizza Size
SELECT pizza_size, 
SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales) AS Per_sales
FROM pizza_sales 
GROUP BY pizza_size;

--Pizza sold by category
SELECT pizza_category, SUM(quantity) AS total_pizza_sold
FROM pizza_sales
GROUP BY pizza_category;

--Top 5 BestSellers
SELECT TOP 5 pizza_name, SUM(quantity) AS total_sales
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY SUM(quantity) DESC;

--Bottom 5 WorstSellers
SELECT TOP 5 pizza_name, SUM(quantity) AS total_sales
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY SUM(quantity) ASC;

