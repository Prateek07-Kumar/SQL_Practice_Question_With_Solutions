use zomato;

select f_name,
(total_value/sum(total_value) over())*100 as 'percent_of_total'
from (select f_id,sum(amount) as 'total_value' from orders t1
join order_details t2
on t1.order_id = t2.order_id
where r_id = 5
group by f_id) t
join food t3
on t.f_id = t3.f_id
order by (total_value/sum(total_value) over())*100 desc
