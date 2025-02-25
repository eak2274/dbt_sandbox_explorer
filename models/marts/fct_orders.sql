with orders as (
    select * from {{ ref('int_orders') }}
),

final as (
    select 
        order_id,
        location_id,
        customer_id,
        order_total,
        tax_paid,
        ordered_at,
        customer_name,
        location_name,
        tax_rate,
        location_opened_at,
        EXTRACT(MONTH FROM ordered_at) AS ordered_month,
        EXTRACT(DAY FROM ordered_at) AS ordered_day,
        EXTRACT(YEAR FROM ordered_at) AS ordered_year
    from orders
)

select * 
from final