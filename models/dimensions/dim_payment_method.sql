-- Dimension: Payment Method
SELECT DISTINCT
    payment_method,
    ROW_NUMBER() OVER (ORDER BY payment_method) as payment_method_key,
    payment_method as method_name,
    CASE 
        WHEN payment_method = 'card' THEN 'Credit/Debit Card'
        WHEN payment_method = 'wallet' THEN 'Digital Wallet'
        ELSE 'Bank Transfer'
    END as method_description
FROM 'data/silver/date=*/payments_silver.parquet';