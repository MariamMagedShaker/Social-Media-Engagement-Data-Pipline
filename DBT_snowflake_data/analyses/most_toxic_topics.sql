-- analysis/most_toxic_topics.sql
SELECT
  t.topic_category,
  AVG(p.toxicity_score) AS avg_toxicity
FROM {{ ref('stg_fact_table') }} p
JOIN {{ ref('stg_topic_cat_dim') }} t ON p.TOPIC_CATEGORY_ID = t.TOPIC_CATEGORY_ID
GROUP BY t.topic_category
ORDER BY avg_toxicity DESC
LIMIT 10;