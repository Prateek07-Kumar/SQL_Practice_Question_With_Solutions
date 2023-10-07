use zomato;
-- Find top 2 most paying customers of each month 
select * from orders;

select * from (select monthname(date) as 'month',user_id,sum(amount) as 'total',
		rank() over(partition by monthname(date) order by sum(amount) desc) as 'month_rank'
		from orders
		group by monthname(date),user_id
		order by month(date)) t
        where t.month_rank < 3
        order by month desc, month_rank asc

-- Find the MOM revenue growth zomato

select monthname(date), sum(amount),
(sum(amount) - lag(sum(amount)) over(order by month(date)))/lag(sum(amount)) over(order by month(date))*100
from orders
group by monthname(date)
order by month(date) asc


