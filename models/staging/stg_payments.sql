-- Staging: Clean data from Silver layer
SELECT 
    transaction_id,
    timestamp,
    user_id,
    merchant_id,
    amount,
    currency,
    status,
    payment_method,
    risk_score,
    DATE(timestamp) as transaction_date,
    CASE WHEN risk_score > 0 THEN TRUE ELSE FALSE END as is_high_risk
FROM 'data/silver/date=*/payments_silver.parquet';