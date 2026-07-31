  -- Q17: Customer Ordering Patterns
  -- Analyze single vs multi-pizza orders


SELECT 
    order_type,
    COUNT(*) AS total_orders
FROM (
    SELECT 
        order_id,
        CASE 
            WHEN COUNT(*) = 1 THEN 'Single Pizza Order'
            ELSE 'Multi Pizza Order'
        END AS order_type
    FROM orders
    GROUP BY order_id
) AS order_summary
GROUP BY order_type;