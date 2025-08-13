#Segment-wise Increase in Unique Products (2021 vs 2020)


WITH CTE1 as
(SELECT segment, COUNT(Distinct(s.product_code)) as product_count_2020 
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code = p.product_code
WHERE fiscal_year = "2020"
GROUP BY segment),
CTE2 as
(SELECT segment, COUNT(Distinct(s.product_code)) as product_count_2021
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code = p.product_code
WHERE fiscal_year = "2021"
GROUP BY segment)

SELECT CTE1.segment, product_count_2020, product_count_2021, 
(product_count_2021 - product_count_2020) as difference
FROM CTE1
JOIN CTE2 ON CTE1.segment = CTE2.segment
ORDER BY difference DESC;
