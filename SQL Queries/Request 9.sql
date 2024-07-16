/*Which channel helped to bring more gross sales in the fiscal year 2021 
and the percentage of contribution? 
The final output contains these fields, channel gross_sales_mln percentage*/

With cte as 
(
select
   c.channel,
   round(sum(p.gross_price*s.sold_quantity)/1000000,2) as gross_sales_mln
from fact_sales_monthly s
join dim_customer c 
on s.customer_code = c.customer_code
join fact_gross_price p
on s.fiscal_year = p.fiscal_year and s.product_code = p.product_code
where s.fiscal_year = "2021"
group by c.channel
order by gross_sales_mln desc
)
select
	  *,
      round(gross_sales_mln*100/sum(gross_sales_mln) over(),0)as percent_contri
from cte
order by percent_contri desc


