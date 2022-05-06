{{ config(materialized='view') }}

with orders as (
    select *
    from dbo.jaffle_shop_orders

)

select *
from orders