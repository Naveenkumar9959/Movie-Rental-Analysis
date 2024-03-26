-- 5.Are certain language films more popular among specific customer segments?

with rent as (SELECT 
    f.film_id,title,language_id,r.*
FROM
    inventory AS i
        INNER JOIN
    film AS f ON i.film_id = f.film_id
        INNER JOIN
    rental AS r ON i.inventory_id = r.inventory_id)
    
    ,customer_d as (SELECT 
    customer_id,store_id,concat(first_name,last_name) as full_name,address,city,country
FROM
    customer AS ct
        INNER JOIN
    address AS ad ON ct.address_id = ad.address_id
        INNER JOIN
    city AS c ON ad.city_id = c.city_id
        INNER JOIN
    country AS cy ON c.country_id = cy.country_id)
    
   SELECT 
     country,name as `language`, COUNT(rental_id)
FROM
    rent AS r
        INNER JOIN
    customer_d AS cd ON r.customer_id = cd.customer_id
        INNER JOIN
    language AS l ON r.language_id = l.language_id
    -- where store_id=2 we have to count rentals store wise 
GROUP BY country,r.language_id 