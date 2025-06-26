SELECT
  pl.platform,
  t.year,
  t.month,
  COUNT(p.post_id) AS post_count,
  AVG(m.interaction_rate) AS avg_interaction_rate,
  AVG(m.virality_ratio) AS avg_virality,
  AVG(p.engagement_rate) AS avg_engagement,
  SUM(p.likes_count) AS total_likes,
  SUM(p.shares_count) AS total_shares,
  AVG(p.toxicity_score) AS avg_toxicity
FROM {{ ref('int_engagement_metrics') }} m
JOIN {{ ref('stg_fact_table') }} p ON m.post_id = p.post_id
JOIN {{ ref('stg_platform_dim') }} pl ON p.platform_id = pl.platform_id
JOIN {{ ref('stg_time_dim') }} t ON p.time_id = t.time_id
GROUP BY pl.platform, t.year, t.month
ORDER BY t.year DESC, t.month DESC