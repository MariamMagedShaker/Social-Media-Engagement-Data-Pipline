SELECT
  post_id,
  (likes_count + shares_count + comments_count) / NULLIF(impressions, 0) AS interaction_rate,
  shares_count / NULLIF(impressions, 0) AS virality_ratio
FROM {{ source('raw_data', 'FACT_TABLE') }}