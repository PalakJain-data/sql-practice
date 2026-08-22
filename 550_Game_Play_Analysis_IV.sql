select round(count(distinct a.player_id)/(select count(distinct player_id) from activity),2) as fraction
from activity a
join (select player_id, min(event_date) as first_login
from activity
group by player_id) f
on a.player_id=f.player_id AND a.event_date=DATE_ADD(f.first_login, interval 1 day);
