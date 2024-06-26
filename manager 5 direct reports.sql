# Write your MySQL query statement below
Method 1:
select e.name
from Employee as e
join Employee as m
on e.id=m.managerId
group by m.managerId
having count(m.managerId)>=5

Method 2:

SELECT name 
FROM Employee 
WHERE id IN (
    SELECT managerId 
    FROM Employee 
    GROUP BY managerId 
    HAVING COUNT(*) >= 5)