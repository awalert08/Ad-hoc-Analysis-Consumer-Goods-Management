#Top 3 Best-Selling Products by Division – FY 2021


WITH CTE1 AS(
SELECT division, p.product_code, product,
SUM(sold_quantity) as total_sold_quantity
FROM dim_product p
JOIN fact_sales_monthly s
ON p.product_code = s.product_code
WHERE fiscal_year = 2021
GROUP BY division, product_code, product
ORDER BY total_sold_quantity),

CTE2 AS(
SELECT division, product_code, product, 
total_sold_quantity,
DENSE_RANK() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order
FROM CTE1 )

SELECT * FROM CTE2
WHERE rank_order <= 3;
