SELECT * 
FROM {{ source('raw_data', 'LANGUAGE_DIM') }}
