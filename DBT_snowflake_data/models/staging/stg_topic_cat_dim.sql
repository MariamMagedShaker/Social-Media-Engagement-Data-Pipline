SELECT * 
FROM {{ source('raw_data', 'TOPIC_CATEGORY_DIM') }}
