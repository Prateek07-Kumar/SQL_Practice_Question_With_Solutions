create database zomato;
use zomato;
## Independent Subquery - Row Subquery(One Col Multi Rows)
-- Find all users who never ordered

select * from users
where user_id not in (select distinct(user_id) 
from orders) 

-- 2. Find the favorite food of each customer
select * from food;

with fav_food as (
select t2.user_id, name, f_name, count(*) as 'frequency' from users t1
join orders t2 on t1.user_id = t2.user_id
join order_details t3 on t2.order_id = t3.order_id
join food t4 on t3.f_id = t4.f_id
group by t2.user_id,t3.f_id
)
select * from fav_food f1
where frequency = (select max(frequency) 
                from fav_food f2 
				where f2.user_id = f1.user_id)

-- Find the avg rating in resturant                                
# From                
SELECT t2.r_name, t1.avg_rating
FROM (SELECT r_id, AVG(restaurant_rating) AS avg_rating
      FROM orders
      GROUP BY r_id) t1
JOIN restaurants t2
ON t1.r_id = t2.r_id;

CREATE TABLE loyal_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    money INT NOT NULL
);

select * from loyal_users;
use zomato;

insert into loyal_users
(user_id,name,money)
select t1.user_id,name, 0
from orders t1
join users t2 on t1.user_id = t2.user_id
group by user_id
having count(*) > 3

select * from loyal_users;

# Subquery in Update
update loyal_users
set money = (select sum(amount)*0.1
							from orders
							where orders.user_id = loyal_users.user_id)

# Subquery in Delete
delete from users
where user_id in (select user_id from users
where user_id not in (select distinct(user_id) from orders))

select * from users;

