create database sql_cx_live;

use sql_cx_live;

select * from sql_cx_live.users1;
select * from sql_cx_live.membership;

select * from sql_cx_live.users1 t1
cross join sql_cx_live.groups t2

select * from sql_cx_live.membership t1
inner join sql_cx_live.users1 t2
on t1.user_id = t2.user_id;

select * from sql_cx_live.membership t1
left join sql_cx_live.users1 t2 
on t1.user_id = t2.user_id;

select * from sql_cx_live.membership t1
right join sql_cx_live.users1 t2
on t1.user_id = t2.user_id


select * from sql_cx_live.membership t1
full outer join sql_cx_live.users1 t2
on t1.user_id = t2.user_id


select * from sql_cx_live.person1
union
select * from sql_cx_live.person2


select * from sql_cx_live.person1
union all
select * from sql_cx_live.person2


select * from sql_cx_live.person1
intersect
select * from sql_cx_live.person2


select * from sql_cx_live.person2
except
select * from sql_cx_live.person1

select * from sql_cx_live.membership t1
left join sql_cx_live.users1 t2
on t1.user_id = t2.user_id
union all
select * from sql_cx_live.membership t1
right join sql_cx_live.users1 t2
on t1.user_id = t2.user_id

select * from sql_cx_live.users1;
select * from sql_cx_live.users1 t1
inner join sql_cx_live.users1 t2
on t1.emergency_contact = t2.user_idipl_data