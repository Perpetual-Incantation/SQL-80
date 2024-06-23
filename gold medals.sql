-- Q) Find those player who have won only gold medals not silver not bronze

-- Method 1
select GOLD as player_name ,
count(1) as no_of_medals
from events
where GOLD not in (select SILVER from events
union select BRONZE from events)
group by GOLD;

-- Method 2
with cte as(
select GOLD as player_name, 'gold' as medal_type from events
union all
select SILVER, 'silver' as medal_type from events
union all
select BRONZE, 'bronze' as medal_type from events
)
select player_name,count(1) as no_of_medals 
from cte 
group by player_name
having count(distinct medal_type)=1 
and
max(medal_type)='gold'





