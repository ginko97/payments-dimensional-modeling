-- Dimension: Merchant (with surrogate key)
SELECT DISTINCT
    ROW_NUMBER() OVER (ORDER BY merchant_id) as merchant_key,   -- Surrogate Key
    merchant_id,
    'Merchant_' || merchant_id as merchant_name,
    'Retail' as category,
    'Singapore' as country
FROM 'data/silver/date=*/payments_silver.parquet';