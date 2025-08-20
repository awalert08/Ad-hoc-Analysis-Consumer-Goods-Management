#Top Sales Channel & Contribution – FY 2021


WITH gross_sales_2021 AS (
    SELECT channel, 
    ROUND(SUM(gross_price * sold_quantity)/1000000 , 2) as Gross_sales_amount_mln 
	FROM fact_sales_monthly s
    JOIN fact_gross_price g
    ON s.product_code = g.product_code
    JOIN dim_customer c 
    ON s.customer_code = c.customer_code
    WHERE s.fiscal_year = 2021
    GROUP BY channel
),
total_gross_2021 AS (
    SELECT SUM(Gross_sales_amount_mln) AS total_sales_mln
    FROM gross_sales_2021
)
SELECT 
    s.channel,
    Gross_sales_amount_mln,
    ROUND((s.Gross_sales_amount_mln  / t.total_sales_mln) * 100, 2) AS percentage
FROM gross_sales_2021 s
CROSS JOIN total_gross_2021 t
ORDER BY  Gross_sales_amount_mln DESC
LIMIT 1;