create database camp_window;
use camp_window;
CREATE TABLE marks (
 student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    branch VARCHAR(255),
    marks INTEGER
);

INSERT INTO marks (name,branch,marks)VALUES 
('Nitish','EEE',82),
('Rishabh','EEE',91),
('Anukant','EEE',69),
('Rupesh','EEE',55),
('Shubham','CSE',78),
('Ved','CSE',43),
('Deepak','CSE',98),
('Arpan','CSE',95),
('Vinay','ECE',95),
('Ankit','ECE',88),
('Anand','ECE',81),
('Rohit','ECE',95),
('Prashant','MECH',75),
('Amit','MECH',69),
('Sunny','MECH',39),
('Gautam','MECH',51)

select *,avg(marks) over() from marks;

select *,avg(marks) over(partition by branch) from marks;

select *,
avg(marks) over() as 'overall_avg',
min(marks) over(),
max(marks) over(),
min(marks) over(partition by branch),
max(marks) over(partition by branch)
from marks
order by student_id

-- Find all the students who have marks higher than the avg marks of their respective branch 

select * from (select *,
avg(marks) over(partition by branch) as 'branch_avg'
from marks) t
where t.marks < t.branch_avg

-- Ranks Function
select *,
rank() over(partition by branch order by marks desc)
from marks

-- Dense Rank Function
select *,
rank() over(partition by branch order by marks desc),
dense_rank() over(partition by branch order by marks desc)
from marks

-- Row Number
select *,
concat(branch,'-',row_number() over(partition by branch))
from marks

# Fist_Value/LaST Value/NTH_Value
select *,
first_value(marks) over(order by marks desc)
from marks

-- last value
select *,
last_value(marks) over(order by marks desc)
from marks

-- Default frames
SELECT *,
       last_VALUE(name) OVER (partition by branch
           ORDER BY marks DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       )
FROM marks;

# NTH Values
SELECT *,
       nth_value(name,5) OVER (partition by branch
           ORDER BY marks DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       )
FROM marks;

-- Find the branch Topper

select name,branch,marks from (select *,
first_value(name) over(partition by branch order by marks desc) as 'topper_name',
first_value(marks) over(partition by branch order by marks desc) as 'topper_marks'
from marks) t
where t.name = t.topper_name and t.marks = t.topper_marks

-- select name,branch,marks from (select *,
-- last_value(name) over(partition by branch order by marks desc
-- 					   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as 'topper_name',
-- last_value(marks) over(partition by branch order by marks desc
--                         ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as 'topper_marks'
-- from marks) t
-- where t.name = t.topper_name and t.marks = t.topper_marks
-- window w as (partition by)

select *,
lag(marks) over(partition by branch order by student_id),
lead(marks) over(partition by branch order by student_id) 
from marks;

