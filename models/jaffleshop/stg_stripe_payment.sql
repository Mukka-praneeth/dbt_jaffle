{{ config(materialized='view') }}

with payments as (
    select *
    from dbo.stripe_payments
)
select *
from payments