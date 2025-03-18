WITH
    CarResults AS(
    SELECT
        Cars.name AS car_name,
        Cars.class AS car_class,
        AVG(res.position) AS average_position,
        COUNT(res.race) AS race_count,
        cl.country AS car_country
    FROM
        Results res
    JOIN Cars ON res.car = Cars.name
    JOIN Classes cl ON
        cl.class = Cars.class
    GROUP BY
        Cars.name,
        Cars.class,
        cl.country
    HAVING
        average_position > 3.0
),
ClassResults AS(
    SELECT
        Cars.class AS class,
        COUNT(Cars.name) AS car_count,
        COUNT(res.race) AS total_races
    FROM
        Results res
    JOIN Cars ON res.car = Cars.name
    GROUP BY
        Cars.class
)
SELECT
    cr.car_name AS car_name,
    cr.car_class AS car_class,
    cr.average_position AS average_position,
    cr.race_count AS race_count,
    cr.car_country AS car_country,
    cls.total_races AS total_races,
    cls.car_count AS low_position_count
FROM
    CarResults cr
JOIN ClassResults cls ON
    cls.class = cr.car_class
ORDER BY
    low_position_count
DESC
    ;