select t.request_at as day,
ROUND(
    SUM(
        CASE 
WHEN t.status IN ('cancelled_by_driver','cancelled_by_client')
    THEN 1
    ELSE 0 
    END) /COUNT(*),2) AS "cancellation rate"
from Trips t
Join Users c
on t.client_id=c.users_id
JOIN Users d
on t.driver_id=d.users_id
where c.banned='no'
and d.banned='no'
and t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP  BY t.request_at
ORDER BY t.request_at;
