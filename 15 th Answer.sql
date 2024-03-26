-- 15. The availability of films in different languages can have a significant impact on customer satisfaction and rental frequency:
SELECT 
    l.name AS `language`, COUNT(title)
FROM
    film AS f
        INNER JOIN
    language AS l ON f.language_id = l.language_id
GROUP BY l.name