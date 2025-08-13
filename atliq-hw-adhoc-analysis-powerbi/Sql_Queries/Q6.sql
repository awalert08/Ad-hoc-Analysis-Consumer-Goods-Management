#Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for 
#the fiscal year 2021 and in the Indian market.

WITH CTE1 AS(
SELECT pre.customer_code, c.customer, market, ROUND(AVG(pre.pre_invoice_discount_pct)*100,2) as average_discount_percentage 
FROM dim_customer c
JOIN fact_pre_invoice_deductions pre
ON c.customer_code = pre.customer_code
WHERE fiscal_year = "2021" AND c.market = "India"
GROUP BY customer_code, customer
ORDER BY average_discount_percentage DESC LIMIT 5
)

SELECT customer_code, customer, average_discount_percentage
FROM CTE1 ;