#Quarterly Sold Quantity Analysis – 2020

SELECT get_fiscal_quarter(date) as Quarter,
ROUND(SUM(sold_quantity)/1000000, 2) as total_sold_quantity_mln
FROM fact_sales_monthly
WHERE YEAR(date) = 2020
GROUP BY Quarter
ORDER BY total_sold_quantity_mln DESC
