create database flipkart;
use flipkart;
select * from flipkart.users;

select * from flipkart.order_details t1
join flipkart.orders t2
on t1.order_id = t2.order_id
join flipkart.users t3
on t2.user_id = t3.user_id

select t1.order_id,t1.amount,t1.profit,t3.name from flipkart.order_details t1
join flipkart.orders t2
on t1.order_id = t2.order_id
join flipkart.users t3
on t2.user_id = t3.user_id

-- Find order_id,name and city by joining users and orders
select order_id,name,t2.name,t2.city
from flipkart.orders t1
join flipkart.users t2
on t1.user_id = t2.user_id

-- Find order_id,product category by joining order_details and category
select * from category;
select * from order_details;

select t1.order_id, t2.vertical
from flipkart.order_details t1
join flipkart.category t2
on t1.category_id = t2.category_id

-- Find the orders placed in pune
select * from orders;
select * from users;

select * from flipkart.orders  t1
join flipkart.users t2
on t1.user_id = t2.user_id
where t2.city = 'Pune' and t2.name ='Sarita'

-- Find all orders under chairs category
select * from order_details;
select * from category;

-- Find all Profitable orders
select * from orders;
select * from order_details;

select t1.order_id, sum(t2.profit) from flipkart.orders t1
join flipkart.order_details t2
on t1.order_id = t2.order_id
group by t1.order_id
having sum(t2.profit) > 0

-- Find the customer who has placed max number of orders
select * from orders;
select * from users;

select name, count(*) as 'num_orders' from flipkart.orders t1
join flipkart.users t2
on t1.user_id = t2.user_id
group by t2.name
order by num_orders desc limit 1

-- Which is the most profitable category
select * from order_details;
select * from category;

select t2.vertical, sum(profit) from flipkart.order_details t1
join flipkart.category t2
on t1.category_id = t2.category_id
group by t2.vertical
order by sum(profit) asc limit 1

-- Which of the most profitable state
select * from orders;
select * from users;

select state, sum(profit) from flipkart.orders t1
join flipkart.order_details t2
on t1.order_id = t2.order_id
join flipkart.users t3
on t1.user_id = t3.user_id
group by state
order by sum(profit) desc limit 1

-- find all categories with profit higher than 5000
select * from category;
select * from order_details;

select t2.vertical, sum(profit) from flipkart.order_details t1
join flipkart.category t2
on t1.category_id = t2.category_id
group by t2.vertical
having sum(profit) > 1000
