-- analysis/top_viral_posts.sql
SELECT
  p.post_id,
  pl.platform,
  m.virality_ratio,
  m.interaction_rate,
  p.impressions,
  p.shares_count
FROM {{ ref('int_engagement_metrics') }} m
JOIN {{ ref('stg_fact_table') }} p ON m.post_id = p.post_id
JOIN {{ ref('stg_platform_dim') }} pl ON p.platform_id = pl.platform_id
WHERE p.impressions > 1000
ORDER BY m.virality_ratio DESC
LIMIT 10