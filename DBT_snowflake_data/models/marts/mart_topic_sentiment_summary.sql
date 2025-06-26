SELECT
  topic.topic_category,
  s.sentiment_label,
  s.emotion_type,
  COUNT(p.post_id) AS post_count,
  AVG(p.sentiment_score) AS avg_sentiment,
  AVG(p.toxicity_score) AS avg_toxicity
FROM {{ ref('stg_fact_table') }} p
JOIN {{ ref('stg_topic_cat_dim') }} topic ON p.TOPIC_CATEGORY_ID = topic.TOPIC_CATEGORY_ID
JOIN {{ ref('stg_sentiment_dim') }} s ON p.SENTIMENT_ID = s.SENTIMENT_ID
JOIN {{ ref('stg_time_dim') }} t ON p.time_id = t.time_id
GROUP BY s.sentiment_label, s.emotion_type, topic.topic_category
