/*Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
The final output contains these fields, 
segment product_count_2020 product_count_2021 difference*/



with
x as
(
select p.segment, count(distinct s.product_code) as A
from fact_sales_monthly s join dim_product p on s.product_code = p.product_code
where s.fiscal_year = "2020"
group by p.segment
),

y as
(
select p.segment, count(distinct s.product_code) as B
from fact_sales_monthly s join dim_product p on s.product_code = p.product_code
where s.fiscal_year = "2021"
group by p.segment
)

select
     x.segment,
     x.A as product_count_2020,
     y.B as product_count_2021,
     y.B-x.A as difference
from x join y using (segment)
order by difference desc  



