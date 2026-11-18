select name
from SalesPerson 
where sales_id NOT IN(
    SELECT sales_id
from Orders
WHERE com_id=(select com_id
from company
where name='RED')
);
