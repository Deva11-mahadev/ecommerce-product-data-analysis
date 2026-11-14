use ecommerce;
show tables;
SELECT * FROM ecommerce.orders;

# Q1.Total Orders
select count(*) as total_orders from orders;

# Q2. Total Sales
select sum(net_amount) as total_sales from orders;

# Q3. Top Product
select product, sum(net_amount)
as sales from orders 
group by product order by sales desc;

# Q4. Top Cities 
select city, sum(net_amount) as sales
from orders 
group by city
order by sales desc; 

# Q5. Monthly Sales
select month, sum(net_amount) as sales
from orders group by month;

# Q6. Highest Profit Products 
select product, sum(profit) as profit
from orders 
group by product order by profit desc;

# Q7. Payment Mode Distribution
select payment_mode, count(*) as total_orders
from orders 
group by payment_mode;

# Q8. Cancelled Orders
select * from orders 
where order_status = "Cancelled";

# Q9. Order Status-Wise Revenue & Profit Leakage
SELECT order_status, 
       COUNT(*) AS total_orders, 
       ROUND(SUM(net_amount), 2) AS total_net_sales, 
       ROUND(SUM(profit), 2) AS total_profit
FROM orders 
GROUP BY order_status 
ORDER BY total_net_sales DESC;