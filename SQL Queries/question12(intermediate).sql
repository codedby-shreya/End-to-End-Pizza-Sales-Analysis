 -- Q12: Shows size availability per pizza

SELECT 
    pizza_types.name,
    COUNT(DISTINCT pizzas.size) AS variety_score,
    GROUP_CONCAT(DISTINCT pizzas.size) AS sizes
FROM pizzas
JOIN pizza_types 
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name;

