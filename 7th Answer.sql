-- 7. Are certain film categories more popular in specific locations?
-- category wise films 
with category_f as (SELECT 
    f.film_id,title,name as `category`
FROM
    film AS f
        INNER JOIN
    film_category AS fc ON f.film_id = fc.film_id
        INNER JOIN
    category AS c ON fc.category_id = c.category_id)
    
-- Store Details 
,store_loc as (SELECT 
    s.store_id, ad.address_id, st.staff_id, concat(first_name," ",last_name) as staff_name,city,country
FROM
    store AS s
        INNER JOIN
    staff AS st ON s.store_id = st.staff_id
    inner join address as ad on s.address_id=ad.address_id
    inner join city as c on ad.city_id=c.city_id
    inner join country as cy on c.country_id=cy.country_id)
    
-- rent details for record
,rent as (SELECT 
    film_id,
    i.store_id,
    r.rental_id,
    rental_date,
    p.amount,
    r.customer_id,
    return_date,
    city,country
FROM
    inventory AS i
        INNER JOIN
    rental AS r ON i.inventory_id = r.inventory_id
    inner join payment as p on r.rental_id=p.rental_id
    inner join store_loc as s on i.store_id=s.store_id
    where year(rental_date)=2005)
    
    
    -- count of rents per category  by store wise
    SELECT 
    category ,s.store_id,count(rental_id),sum(amount)
FROM
    category_f AS c
        INNER JOIN
    rent AS r ON c.film_id = r.film_id
        INNER JOIN
    store_loc as s  on r.store_id=s.store_id
     -- where r.store_id=1  this is used for extracting particular location details
    group by category,s.store_id
     
