SELECT * 
FROM {{ source('raw_data', 'CAMPAIGN_PHASE_DIM') }}
