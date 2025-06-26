SELECT * 
FROM {{ source('raw_data', 'SENTIMENT_DIM') }}