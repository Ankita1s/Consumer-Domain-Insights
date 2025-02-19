/*Get the Top 3 products in each division that have a high total_sold_quantity 
in the fiscal_year 2021? The final output contains these fields,
division 
product_code
product 
total_sold_quantity 
rank_order*/


with Cte as (
select 
   p.division,
   p.product_code,
   p.product,
   p.variant,
   sum(s.sold_quantity) as Total_sold_quantity,
   dense_rank() over (partition by p.division order by sum(s.sold_quantity) desc) as rank_order
from fact_sales_monthly s
join dim_product p
on s.product_code = p.product_code
where s.fiscal_year = "2021"
group by p.division, p.product_code, p.product, p.variant )

select
	*
from cte
where rank_order<=3
order by division, rank_order








   