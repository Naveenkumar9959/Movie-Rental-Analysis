-- 6.How does customer loyalty impact sales revenue over time?

SELECT 
    MONTHNAME(payment_date), SUM(amount), COUNT(rental_id)
FROM
    payment
WHERE
    YEAR(payment_date) = 2005
GROUP BY MONTHNAME(payment_date)
