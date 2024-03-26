-- 2.Which films have the highest rental rates and are most in demand?

SELECT 
    f.film_id,
    title,
    rating,
    rental_rate,
    COUNT(*) AS No_of_times_take_rent_per_each_film
FROM
    film AS f
        INNER JOIN
    inventory AS i ON f.film_id = i.film_id
        INNER JOIN
    rental AS r ON i.inventory_id = r.inventory_id
GROUP BY film_id
ORDER BY rental_rate DESC , No_of_times_take_rent_per_each_film DESC