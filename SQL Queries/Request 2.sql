/*What is the percentage of unique product increase in 2021 vs. 2020? 
The final output contains these fields, unique_products_2020 unique_products_2021 percentage_chg*/

with 
x as (select count(distinct(product_code)) as A from fact_sales_monthly where fiscal_year = "2020"),
y as (select count(distinct(product_code)) as B from fact_sales_monthly where fiscal_year = "2021")

Select 
        x.A as unique_products_2020,
        y.B as unique_products_2020,
        round((y.B-x.A)*100/x.A,2) as percentage_change
from x,y



