{# {% snapshot order_snapshot %}

{{
    config(
        target_database='ratecode',
        target_schema='dbo',
        unique_key='oder_id',

        strategy='timestamp',
        updated_at='order_date'
    )
}}

select * from {{ source('dbo','jaffle_shop_orders')}}

{% endsnapshot %} #}