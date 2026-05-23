-- Dimension: Currency
SELECT DISTINCT
    currency,
    ROW_NUMBER() OVER (ORDER BY currency) as currency_key,
    currency as currency_code,
    CASE currency 
        WHEN 'USD' THEN '$'
        WHEN 'EUR' THEN '€'
        WHEN 'SGD' THEN 'S$'
    END as symbol
FROM 'data/silver/date=*/payments_silver.parquet';