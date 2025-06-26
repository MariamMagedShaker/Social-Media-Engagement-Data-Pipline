SELECT
  t.day_name,
  t.DAY_OF_WEEK_NUMBER,
  t.hour,
  COUNT(p.post_id) AS post_count,
  AVG(p.engagement_rate) AS avg_engagement,
  AVG(p.user_engagement_growth) AS avg_growth
FROM {{ ref('stg_fact_table') }} p
JOIN {{ ref('stg_time_dim') }} t ON p.time_id = t.time_id
GROUP BY t.day_name, t.DAY_OF_WEEK_NUMBER ,t.hour
ORDER BY t.DAY_OF_WEEK_NUMBER ASC, t.hour DESC
