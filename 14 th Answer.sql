-- 14.What are the cultural or demographic factors that influence customer preferences in different locations?

with fact_table as (SELECT 
    r.rental_id,
    rental_date,
    c.customer_id,
    r.staff_id,
    payment_id,
    amount,
    payment_date,
    store_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    email,
    ad.address_id,
    ad.address,
    city,
    country
FROM
    rental AS r
        INNER JOIN
    payment AS p ON r.rental_id = p.rental_id
        INNER JOIN
    customer AS c ON r.customer_id = c.customer_id
        INNER JOIN
    address AS ad ON c.address_id = ad.address_id
        INNER JOIN
    city AS ct ON ct.city_id = ad.city_id
        INNER JOIN
    country AS cy ON cy.country_id = ct.country_id)
    
    select customer_id,full_name,city,country,sum(amount) as total_spending_amount,count(rental_id) as total_rents from fact_table
     where store_id=1 -- filter the customers as store wise 
    group by customer_id,full_name
    order by total_spending_amount desc