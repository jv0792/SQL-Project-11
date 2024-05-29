use pizzadb;

--KPIs

--Total revenue
SELECT ROUND(SUM(total_price), 2) AS 'Total Revenue'
FROM pizza_orders;

--Total Orders
SELECT COUNT(DISTINCT(order_id)) AS 'Total Orders'
FROM pizza_orders;

--Average Order Value
SELECT ROUND((SUM(total_price) / COUNT(DISTINCT(order_id))), 2) AS 'AVERAGE ORDER VALUE'
FROM pizza_orders;

--Total number of Pizza Solds

SELECT SUM(quantity) as 'Total number of Pizza sold'
FROM pizza_orders;

--Average Pizzas per order
SELECT 
(SUM(quantity) / COUNT(DISTINCT(order_id))) AS 'Average Pizzas per order'
FROM pizza_orders;

--Total Pizza's sold on Daily basis

SELECT FORMAT(order_date, 'dddd') AS 'Order Day',
ROUND(SUM(total_price), 2) AS 'Total Price',
SUM(quantity) AS 'Number of Pizzas Sold'
FROM pizza_orders
GROUP BY FORMAT(order_date, 'dddd') ORDER BY 'Total Price' DESC;

--Identiying the hourly trends of orders
SELECT DATEPART(HOUR, order_time) AS Hours,
count(DISTINCT(order_id)) AS 'Number of Orders'
FROM pizza_orders
GROUP BY DATEPART(HOUR, order_time) ORDER BY 'Hours';


--Percentage of Sales by Pizza Category and along with total quantity
SELECT COUNT(DISTINCT(pizza_category)) FROM Pizza_info;
--Checking for any NULL values in the column.
SELECT pizza_category
FROM Pizza_info
WHERE pizza_category IS NULL;

SELECT
pizza_category,
SUM(quantity) AS 'Total Quantity of Pizzas',
ROUND(SUM(total_price), 2) AS 'Revenue', 
ROUND(((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_orders) ) * 100), 2) AS 'Percentage of Sales'
FROM Pizza_info as pi
JOIN pizza_orders as po 
on po.pizza_id = pi.pizza_id
GROUP BY pizza_category ORDER BY [Percentage of Sales] DESC;

--Percentage of sales by Pizza Size

SELECT
pizza_size, 
ROUND(SUM(total_price), 2) AS 'Revenue', 
ROUND(((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_orders) ) * 100), 2) AS 'Percentage of Sales'
FROM Pizza_info as pi
JOIN pizza_orders as po 
on po.pizza_id = pi.pizza_id
GROUP BY pizza_size ORDER BY [Percentage of Sales] DESC;

--Best selling Pizzas by percentage of sales results limited to 5 top entries.

SELECT TOP 5 
pizza_name, 
SUM(quantity) AS 'Total Number of Sold Pizzas', ROUND(SUM(total_price), 2) AS 'Total Revenue',
ROUND((SUM(total_price) / (SELECT SUM(total_price) FROM pizza_orders) * 100), 2) AS 'Percentage of Sales'
FROM Pizza_info AS pi
join pizza_orders AS po
ON pi.pizza_id = po.pizza_id
GROUP BY pizza_name ORDER BY [Percentage of Sales] DESC;

--Best selling Pizzas by Quantity.
SELECT TOP 5
pizza_name, 
SUM(quantity) AS 'Total Number of Sold Pizzas', SUM(total_price) AS 'Total Revenue'
FROM Pizza_info AS pi
join pizza_orders AS po
ON pi.pizza_id = po.pizza_id
GROUP BY pizza_name ORDER BY [Total Number of Sold Pizzas] DESC;

--Not the best selling Pizzas by Quantity
SELECT TOP 5
pizza_name, 
SUM(quantity) AS 'Total Number of Sold Pizzas', ROUND(SUM(total_price), 2) AS 'Total Revenue'
FROM Pizza_info AS pi
join pizza_orders AS po
ON pi.pizza_id = po.pizza_id
GROUP BY pizza_name ORDER BY [Total Number of Sold Pizzas] ASC;


--Use of Window Functions - 
use pizzadb;
--Using of Window functions
SELECT *,
	ROUND(SUM(total_price) OVER(PARTITION BY order_id order by order_id ASC), 2) AS TotalRollingSum,
	ROUND(SUM(total_price) OVER(), 2) As Total
FROM pizza_orders;

SELECT order_id, 
	order_time,
	ROUND(SUM(total_price) OVER(PARTITION BY order_time order by order_time ASC), 2) AS TotalRollingSum,
	ROUND(SUM(total_price) OVER(), 2) As Total
FROM pizza_orders
ORDER BY TotalRollingSum ASC;



SELECT * FROM pizza_orders;

SELECT pi.pizza_name, 
ROUND(po.total_price, 2) AS SinglePrice,
ROUND(SUM(po.total_price) OVER(), 2) AS Tots,
ROUND(SUM(po.total_price) OVER(PARTITION BY pi.pizza_name), 2) AS RollingTotals,
RANK() OVER(PARTITION BY pi.pizza_name ORDER BY po.total_price DESC) AS rnk,
DENSE_RANK() OVER(PARTITION BY pi.pizza_name ORDER BY po.total_price DESC) AS densernk
FROM pizza_info pi
JOIN pizza_orders po
ON pi.pizza_id = po.pizza_id
ORDER BY RollingTotals ASC;

