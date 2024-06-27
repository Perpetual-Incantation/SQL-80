-- create table players_location
-- (
-- name varchar(20),
-- city varchar(20)
-- );
-- insert into players_location
-- values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');
select 
max(case when city='Bangalore' then name end) as Bangalore
,max(case when city='Delhi' then name end) as Delhi
,min(case when city='Mumbai' then name end) as Bangalore
from
(select * ,
row_number() 
over(partition by city order by name asc) as rn
from players_location) a
group by rn
order by rn;