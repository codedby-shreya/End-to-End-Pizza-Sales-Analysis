-- Q18: Top Pizza per Category

WITH pizza_sales AS (
    SELECT 
        pizza_types.category,
        pizza_types.name,
        COUNT(order_details.order_id) AS total_orders
    FROM pizza_types
    JOIN pizzas
        ON pizza_types.pizza_type_id = pizzas.pizza_type_id
    JOIN order_details
        ON order_details.pizza_id = pizzas.pizza_id
    GROUP BY pizza_types.category, pizza_types.name
),

ranked_pizzas AS (
    SELECT 
        category,
        name,
        total_orders,
        RANK() OVER (PARTITION BY category ORDER BY total_orders DESC) AS rnk
    FROM pizza_sales
)

SELECT 
    category,
    name,
    total_orders
FROM ranked_pizzas
WHERE rnk = 1;