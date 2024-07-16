/*In which quarter of 2020, got the maximum total_sold_quantity?
 The final output contains these fields sorted by the 
 total_sold_quantity, Quarter total_sold_quantity*/
 
 
select
   CASE
        WHEN MONTH(date) IN(9,10,11) then 'Q1'
        WHEN MONTH(date) IN(12,1,2) THEN 'Q2'
		WHEN MONTH(date) IN(3,4,5) THEN 'Q3'
        Else 'Q4'
    END 
    as Quarter,
    sum(sold_quantity) as Total_sold_quantity
 from fact_sales_monthly
 where fiscal_year = "2020"    
 group by Quarter
 order by Quarter asc
 
 