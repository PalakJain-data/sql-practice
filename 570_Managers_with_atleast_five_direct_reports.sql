select mgr.name
from Employee mgr
JOIN Employee emp ON mgr.id=emp.managerId 
GROUP BY mgr.Id
HAVING count(emp.id)>=5
