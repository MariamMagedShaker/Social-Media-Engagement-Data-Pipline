SELECT * 
FROM {{ source('raw_data', 'PLATFORM_DIM') }}
