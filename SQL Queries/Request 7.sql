/*Get the complete report of the Gross sales amount for the customer
 “Atliq Exclusive” for each month . 
 This analysis helps to get an idea of low and high-performing months 
 and take strategic decisions. 
 The final report contains these columns: Month Year Gross sales Amount*/
 
 
 Select
      concat(monthname(s.date), ' ' , year(s.date)) as month_name,
      s.fiscal_year,
      sum(g.gross_price*s.sold_quantity) as Gross_sales_Amount
from fact_sales_monthly s
join dim_customer c
on s.customer_code = c.customer_code
join fact_gross_price g
on s.product_code = g.product_code and s.fiscal_year = g.fiscal_year
where c.customer = "Atliq Exclusive"
group by month_name, s.fiscal_year
order by s.fiscal_year asc



