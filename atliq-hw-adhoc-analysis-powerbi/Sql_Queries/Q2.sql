#Year-over-Year Percentage Increase in Unique Products (2021 vs 2020)


WITH CTE1 as
(SELECT segment, COUNT(Distinct(s.product_code)) as unique_products_2020 
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code = p.product_code
WHERE fiscal_year = "2020"),
CTE2 as
(SELECT segment, COUNT(Distinct(s.product_code)) as unique_products_2021
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code = p.product_code
WHERE fiscal_year = "2021")

SELECT unique_products_2020, unique_products_2021, 
ROUND((unique_products_2021 - unique_products_2020)/(unique_products_2020)*100, 2) as percentage_chg
FROM CTE1
JOIN CTE2 ON CTE1.segment = CTE2.segment;
