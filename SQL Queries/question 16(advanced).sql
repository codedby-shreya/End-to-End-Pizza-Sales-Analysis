-- Q16: Size-wise Revenue by Category

SELECT 
    category,
    size,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(
        SUM(revenue) * 100.0 / SUM(SUM(revenue)) OVER (), 
        2
    ) AS revenue_percentage
FROM 
(
    SELECT 
        pizza_types.category,
        pizzas.size,
        (order_details.quantity * pizzas.price) AS revenue
    FROM order_details
    JOIN pizzas 
        ON order_details.pizza_id = pizzas.pizza_id
    JOIN pizza_types 
        ON pizzas.pizza_type_id = pizza_types.pizza_type_id
) AS sales
GROUP BY 
    category, size
ORDER BY 
    total_revenue DESC;


