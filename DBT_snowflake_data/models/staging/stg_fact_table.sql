SELECT * 
FROM {{ source('raw_data', 'FACT_TABLE') }}
