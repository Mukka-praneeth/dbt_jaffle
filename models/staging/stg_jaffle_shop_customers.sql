select 
    ID as customer_id,
    first_name +' '+last_name as full_name
from dbo.jaffle_shop_customers