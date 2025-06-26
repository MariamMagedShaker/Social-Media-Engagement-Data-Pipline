SELECT 
    TIME_ID ,

    -- Date parts
    EXTRACT(YEAR FROM TIMESTAMP) AS year,
    EXTRACT(QUARTER FROM TIMESTAMP) AS quarter,
    EXTRACT(MONTH FROM TIMESTAMP) AS month,
    EXTRACT(DAY FROM TIMESTAMP) AS day,
    EXTRACT(HOUR FROM TIMESTAMP) AS hour,
    
    -- Weekday
    DAYOFWEEK(TIMESTAMP) AS day_of_week_number,         -- 1 = Sunday, 7 = Saturday
   -- INITCAP(DAYNAME(timestamp)) AS day_name,
    CASE TRIM(TO_CHAR(timestamp, 'DY'))
        WHEN 'Sun' THEN 'Sunday'
        WHEN 'Mon' THEN 'Monday'
        WHEN 'Tue' THEN 'Tuesday'
        WHEN 'Wed' THEN 'Wednesday'
        WHEN 'Thu' THEN 'Thursday'
        WHEN 'Fri' THEN 'Friday'
        WHEN 'Sat' THEN 'Saturday'
        ELSE 'Unknown'
        END AS day_name,
    
    -- Truncated dates
    DATE_TRUNC('month', TIMESTAMP) AS month_start,
    DATE_TRUNC('day', TIMESTAMP) AS date_only
    
FROM {{ source('raw_data', 'TIME_DIM') }}