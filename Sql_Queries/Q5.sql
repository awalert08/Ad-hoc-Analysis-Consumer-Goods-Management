# Get the products that have the highest and lowest manufacturing costs.


WITH cte1 AS (
    SELECT 
        p.product_code, 
        product, 
        ROUND(manufacturing_cost, 2) AS manufacturing_cost
    FROM dim_product p
    JOIN fact_manufacturing_cost m
        ON p.product_code = m.product_code
)

-- Final Query
SELECT 'Max manufacturing_cost' AS type, product_code, product, manufacturing_cost
FROM (
    SELECT product_code, product, manufacturing_cost
    FROM cte1
    ORDER BY manufacturing_cost DESC
    LIMIT 1
) AS max_cost

UNION ALL

SELECT 'Min manufacturing_cost' AS type, product_code, product, manufacturing_cost
FROM (
    SELECT product_code, product, manufacturing_cost
    FROM cte1
    ORDER BY manufacturing_cost ASC
    LIMIT 1
) AS min_cost;
