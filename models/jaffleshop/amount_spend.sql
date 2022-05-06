with orders as (
    select * from {{ ref('stg_jaffle_shop_orders') }}
),
payment as(
    select * from {{ ref('stg_stripe_payment') }}
),
common as(
    select customer_id,
    sum(AMOUNT) as total_amount
    from orders 
    left join payment on orders.order_id = payment.order_id

    group by customer_id
)

select * from common
order by desc total_amount