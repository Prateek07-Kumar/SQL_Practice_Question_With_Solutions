use ipl;
select * from ipl_data;

-- find the top 5 batsman in ipl 
select batter,sum(batsman_run) as 'runs'
from ipl_data 
group by batter
order by runs desc
limit 5 

-- find the 2nd highest 6 hitter in ipl
select batter, count(*) as 'num_sixes'
from ipl_data
where batsman_run = 6
group by batter
order by num_sixes desc limit 1,1

-- find virat kholi's performance against all IPL teams
-- this question  answer is not available

-- find top 10 batsman with centuries in IPL

select batter,ID, sum(batsman_run) as 'score' from ipl_data
group by batter,ID
having score >=100
order by batter desc;

-- find the top 5 batsman with highest strike rate who have played a min of 100 balls
select batter, sum(batsman_run),count(batsman_run),
round((sum(batsman_run)/count(batsman_run)) * 100,2) as 'sr'
from ipl_data
group by batter
having count(batsman_run) > 1000
order by sr desc limit 5;