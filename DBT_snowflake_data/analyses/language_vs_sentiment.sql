  -- analysis/language_vs_sentiment.sql
 SELECT
  l.language,
  AVG(p.sentiment_score) AS avg_sentiment
FROM {{ ref('stg_fact_table') }} p
JOIN {{ ref('stg_user_dim') }} u ON p.user_id = u.user_id
JOIN {{ ref('stg_language_dim') }} l ON u.language_id = l.language_id
GROUP BY l.language;