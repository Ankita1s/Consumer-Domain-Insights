/*Generate a report which contains the top 5 
customers who received an average high pre_invoice_discount_pct 
for the fiscal year 2021 and in the Indian market. The final output contains these fields, 
customer_code customer average_discount_percentage*/

select 
    d.customer_code,
    c.customer,
    Round(avg(d.pre_invoice_discount_pct),4) as average_discount_percentage
from fact_pre_invoice_deductions d
join dim_customer c
using(customer_code)
where fiscal_year = "2021" and market = "India"
group by d.customer_code, c.customer
order by average_discount_percentage desc
limit 5