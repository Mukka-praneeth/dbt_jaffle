with customers as (
    select * from {{ ref('stg_jaffle_shop_customers')}}
),
orders as (
    select * from {{ ref('stg_jaffle_shop_orders')}}
),
customer_orders as(
    select 
    customer_id,
    min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date,
    count(order_id) as number_of_orders

    from orders

    group by customer_id
),
final as(
    select 
        customers.customer_id,
        customers.full_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders,0) as number_of_orders,
        case 
            when first_order_date is NULL then 'Newcustomer'
            Else 'regularcustomer'
        end as customer_engagement 

        from customers
        left join customer_orders on customers.customer_id = customer_orders.customer_id

)

select * from final