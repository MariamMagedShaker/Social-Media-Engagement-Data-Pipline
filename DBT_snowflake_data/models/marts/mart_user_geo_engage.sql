SELECT
  u.city,
  u.country,
  t.year,
  t.month,
  COUNT(u.user_id) AS user_count,
  COUNT(p.post_id) AS post_count,
  AVG(p.engagement_rate) AS avg_engagement,
  AVG(p.user_engagement_growth) AS avg_growth
FROM {{ ref('stg_fact_table') }} p
JOIN {{ ref('stg_user_dim') }} u ON p.user_id = u.user_id
JOIN {{ ref('stg_time_dim') }} t ON p.time_id = t.time_id
GROUP BY u.city, u.country, t.year, t.month
ORDER BY t.year DESC, t.month DESC