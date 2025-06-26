-- analysis/weekend_vs_weekday_engagement.sql
SELECT
  CASE WHEN t.day_name IN ('Saturday', 'Sunday') THEN 'Weekend' ELSE 'Weekday' END AS day_type,
  AVG(p.engagement_rate) AS avg_engagement
FROM {{ ref('stg_fact_table') }} p
JOIN {{ ref('stg_time_dim') }} t ON p.time_id = t.time_id
GROUP BY day_type;