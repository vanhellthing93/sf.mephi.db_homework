SELECT res.car AS car_name, Cars.class AS car_class, AVG(res.position) AS average_position, COUNT(res.race) AS race_count, cl.country AS car_country
    FROM Results res
    JOIN Cars ON res.car = Cars.name
    JOIN Classes cl ON Cars.class = cl.class
    GROUP BY res.car
    ORDER BY average_position, Cars.name
    LIMIT 1;