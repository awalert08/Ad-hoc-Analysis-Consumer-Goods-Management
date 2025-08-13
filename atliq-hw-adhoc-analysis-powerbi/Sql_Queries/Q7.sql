#Monthly Gross Sales Analysis for “Atliq Exclusive”

SELECT MONTHNAME(s.date) as Month, YEAR(s.date) as Year, ROUND(SUM(gross_price * sold_quantity)/1000000 , 2) as Gross_sales_amount_mln
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
JOIN  fact_gross_price g
ON s.product_code = g.product_code AND 
s.fiscal_year = g.fiscal_year
WHERE customer = "Atliq Exclusive"
GROUP BY s.date 
ORDER BY s.date DESC;
