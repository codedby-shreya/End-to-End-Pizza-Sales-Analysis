-- Q11) Shows which day generates most revenue

SELECT 
    DAYNAME(order_date) AS day_of_week,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_pizzas,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM 
(
    SELECT 
        orders.order_id,
        orders.order_date,
        order_details.quantity,
        (order_details.quantity * pizzas.price) AS revenue
    FROM order_details
    JOIN pizzas 
        ON order_details.pizza_id = pizzas.pizza_id
    JOIN orders 
        ON orders.order_id = order_details.order_id
) AS sales
GROUP BY 
    DAYNAME(order_date), DAYOFWEEK(order_date)
ORDER BY 
    DAYOFWEEK(order_date);