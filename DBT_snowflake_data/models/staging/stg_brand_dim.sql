SELECT * 
FROM {{ source('raw_data', 'BRAND_DIM') }}
