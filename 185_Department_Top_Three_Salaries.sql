select d.name AS Department,
t.name AS Employee,
t.salary AS Salary
from
(
SELECT name,
salary,
departmentId,
DENSE_RANK() OVER ( PARTITION BY departmentId 
order by salary DESC) AS rnk
FROM Employee) t
JOIN Department d
ON t.departmentId=d.id
WHERE t.rnk<=3;

Why t is used? 
t is the alias of the subquery. 
After calculating dense_rank(), the outer query treats the subquery as a temporary table named t.name, t.salary, etc.
