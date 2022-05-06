{{ config(materialized='view') }}

with customer as (
    select *
    from dbo.jaffle_shop_customers

)

select *
from customer