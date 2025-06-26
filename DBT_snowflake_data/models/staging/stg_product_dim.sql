SELECT * 
FROM {{ source('raw_data', 'PRODUCT_DIM') }}
