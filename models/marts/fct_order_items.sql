WITH orders AS (
    SELECT * 
    FROM {{ ref('int_orders') }}
),

order_items AS (
    SELECT * 
    FROM {{ ref('stg_order_items') }}
),

joined AS (
    SELECT 
        order_items.*,
        orders.* EXCEPT (order_id)
    FROM orders 
    INNER JOIN order_items 
    ON orders.order_id = order_items.order_id
)

SELECT * 
FROM joined