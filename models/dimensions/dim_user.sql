-- Dimension: User (with surrogate key)
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY user_id) as user_key,   -- Surrogate Key
    user_id,
    'User_' || user_id as user_name,
    CASE WHEN user_id % 10 = 0 THEN 'Premium' ELSE 'Regular' END as user_type,
    'Singapore' as country
FROM 'data/silver/date=*/payments_silver.parquet';