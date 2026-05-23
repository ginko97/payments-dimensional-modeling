SELECT 
    ROW_NUMBER() OVER (ORDER BY p.timestamp, p.transaction_id) AS payment_key,
    p.transaction_id,
    d.date_key,
    u.user_key,
    m.merchant_key,
    pm.payment_method_key,
    c.currency_key,
    p.amount,
    p.risk_score,
    p.status,
    p.is_high_risk,
    p.timestamp AS created_at
FROM stg_payments p
LEFT JOIN dim_date d ON d.full_date = DATE(p.timestamp)
LEFT JOIN dim_user u ON u.user_id = p.user_id
LEFT JOIN dim_merchant m ON m.merchant_id = p.merchant_id
LEFT JOIN dim_payment_method pm ON pm.method_name = p.payment_method
LEFT JOIN dim_currency c ON c.currency_code = p.currency;