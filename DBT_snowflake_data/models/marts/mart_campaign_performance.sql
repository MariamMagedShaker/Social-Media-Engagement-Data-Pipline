SELECT
  t.year,
  t.month,
  cam.campaign_name,
  cam.campaign_phase,
  COUNT(p.post_id) AS post_count,
  AVG(p.engagement_rate) AS avg_engagement,
  AVG(p.buzz_change_rate) AS avg_buzz,
  AVG(p.sentiment_score) AS avg_sentiment
FROM {{ ref('stg_fact_table') }} p
JOIN {{ ref('stg_campaign') }} cam ON p.campaign_id = cam.campaign_id
JOIN {{ ref('stg_time_dim') }} t ON p.time_id = t.time_id
GROUP BY cam.campaign_name, cam.campaign_phase, t.year, t.month
ORDER BY t.year DESC