select id as order_id,
       user_id as customer_id,
       order_date,
       status
from dbo.jaffle_shop_orders