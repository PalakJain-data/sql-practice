select d.name as Department,
e.name as Employee,
e.salary as Salary
from Employee e
join Department d
on e.departmentId=d.id
where (e.departmentId, e.salary)
IN(select departmentId,
MAX(salary)
FROM Employee
Group by departmentId);
