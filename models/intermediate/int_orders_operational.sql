SELECT 
    orders_id, 
    date_date,
    ROUND(margin + shipping_fee - logcost - CAST(ship_cost AS FLOAT64),1) AS operational_margin,
    margin, 
    purchase_cost
FROM {{ ref('int_orders_margin') }}
LEFT JOIN {{ref('stg_gz_raw_data__raw_gz_ship')}}
USING (orders_id)