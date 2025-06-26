SELECT
  campaign_id,
  campaign_name,
  campaign_phase,
  
  CASE LOWER(campaign_phase)
    WHEN 'pre-launch' THEN 1
    WHEN 'launch' THEN 2
    WHEN 'post-launch' THEN 3
    ELSE NULL
  END AS campaign_phase_order

FROM {{ ref('stg_campaign') }}