-- analysis/campaign_sentiment_change.sql
SELECT
  cam.campaign_name,
  cam.campaign_phase,
  cam.campaign_phase_order,
  t.year,
  t.month,
  AVG(p.sentiment_score) AS avg_sentiment
FROM {{ ref('stg_fact_table') }} p
JOIN {{ ref('mart_campaign_summary') }} cam ON p.campaign_id = cam.campaign_id
JOIN {{ ref('stg_time_dim') }} t ON p.time_id = t.time_id
GROUP BY cam.campaign_name,cam.campaign_phase, cam.campaign_phase_order, t.year, t.month
ORDER BY t.year DESC ,t.month DESC, cam.campaign_name, campaign_phase_order ;