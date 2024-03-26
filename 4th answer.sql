-- 4.Are there seasonal trends in customer behavior across different locations?
SELECT 
    *
FROM
    (SELECT 
        MONTH(rental_date) as month,
            city,
            country,
            COUNT(r.rental_id) as total_rents_per_month,
            SUM(amount) as Total_smount_per_month
    FROM
        rental AS r
    INNER JOIN payment AS p ON p.rental_id = r.rental_id
    INNER JOIN staff AS s ON r.staff_id = s.staff_id
    INNER JOIN address AS ad ON s.address_id = ad.address_id
    INNER JOIN city AS c ON c.city_id = ad.city_id
    INNER JOIN Country AS cy ON c.country_id = cy.country_id
    WHERE
        YEAR(rental_date) = 2005
            and store_id=1
    GROUP BY MONTH(rental_date) , city , country) as store1
        INNER JOIN
    (SELECT 
        MONTH(rental_date) as month,
            city,
            country,
            COUNT(r.rental_id) as total_rents_per_month,
            SUM(amount) as Total_smount_per_month
    FROM
        rental AS r
    INNER JOIN payment AS p ON p.rental_id = r.rental_id
    INNER JOIN staff AS s ON r.staff_id = s.staff_id
    INNER JOIN address AS ad ON s.address_id = ad.address_id
    INNER JOIN city AS c ON c.city_id = ad.city_id
    INNER JOIN Country AS cy ON c.country_id = cy.country_id
    WHERE
        YEAR(rental_date) = 2005
            AND store_id = 2
    GROUP BY MONTH(rental_date) , city , country) as store2
    
    on store1.month=store2.month
