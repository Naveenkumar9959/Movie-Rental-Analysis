-- What are the purchasing patterns of new customers versus repeat customers?
 with cte as (SELECT 
    r.customer_id,
    MIN(rental_date) as first_rent,
    CASE
        WHEN MONTH(MIN(rental_date)) = 5 THEN 'Repeat customer'
        ELSE 'First_customer'
    END AS customer_type
FROM
    rental AS r
        INNER JOIN
    customer AS c ON r.customer_id = c.customer_id
GROUP BY customer_id)

,cte2 as (select customer_type,count(r.rental_id) as total_rents ,sum(amount)  total_amount 
from cte  inner join rental As r on cte.customer_id=r.customer_id 
inner join payment as p on r.rental_id=p.rental_id
where year(rental_date)=2005
group by customer_type)


select * from cte2

-- select ((select  sum(total_amount) from cte2 where customer_type='Repeat customer')/sum(total_amount))*100 from cte2
-- select ((select  sum(total_amount) from cte2 where customer_type='Repeat customer')/sum(total_amount))*100 from cte2
