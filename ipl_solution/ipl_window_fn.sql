use ipl;

select * from (select BattingTeam,batter,sum(batsman_run) as 'total_runs',
dense_rank() over(partition by BattingTeam order by sum(batsman_run) desc) 'rank_within_team'
from ipl_data
group by BattingTeam, batter) t
where t.rank_within_team < 6
order by t.BattingTeam, t.rank_within_team;

select 
CONCAT("Match-",cast(row_number() over(order by ID) as char)) as 'match_no',
sum(batsman_run) as 'run_scored', 
sum(sum(batsman_run)) over(ROW BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
from ipl_data
where batter = 'V Kholi'
group by ID


