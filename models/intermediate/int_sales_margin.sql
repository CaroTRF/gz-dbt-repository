SELECT 
    date_date,
    orders_id,
    products_id,
    revenue,
    quantity,  
    CAST (purchse_price AS FLOAT64) AS purchase_price,      
    ROUND(quantity*CAST (purchse_price AS FLOAT64),1) AS purchase_cost, 
    ROUND(revenue-(quantity*CAST(purchse_price AS FLOAT64)),1) AS margin
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }} s
LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} p
USING (products_id)
