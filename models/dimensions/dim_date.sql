-- Dimension: Date (Very Important in Star Schema)
SELECT 
    DATE(timestamp) as date_key,
    DATE(timestamp) as full_date,
    YEAR(timestamp) as year,
    MONTH(timestamp) as month,
    DAY(timestamp) as day,
    QUARTER(timestamp) as quarter,
    DAYOFWEEK(timestamp) as day_of_week,
    CASE WHEN DAYOFWEEK(timestamp) IN (6,7) THEN TRUE ELSE FALSE END as is_weekend
FROM 'data/silver/date=*/payments_silver.parquet'
GROUP BY ALL;