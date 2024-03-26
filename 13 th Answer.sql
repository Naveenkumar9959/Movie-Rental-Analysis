SELECT 
    HOUR(r.rental_date),
    r.staff_id,
    COUNT(r.rental_id),
    SUM(amount)
FROM
    rental AS r
        INNER JOIN
    payment AS p ON p.rental_id = r.rental_id
WHERE
    YEAR(rental_date) = 2005
        AND r.staff_id = 2
GROUP BY 1 , 2;



SELECT 
    DATE(r.rental_date),
    r.staff_id,
    COUNT(r.rental_id),
    SUM(amount)
FROM
    rental AS r
        INNER JOIN
    payment AS p ON p.rental_id = r.rental_id
WHERE
    YEAR(rental_date) = 2005
        AND r.staff_id = 2
GROUP BY 1 , 2;
