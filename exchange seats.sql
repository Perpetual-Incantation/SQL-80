# Write your MySQL query statement below
select
case
when id=(select max(id) from seat) and id%2=1 -- ODD LAST STU
then id
when id%2=1
then id+1
else
id-1
end as id,student
from seat
order by id asc

-- CASE WHEN THEN WHEN THEN END;