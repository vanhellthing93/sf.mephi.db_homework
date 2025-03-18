WITH
    CarAvgRes AS(
    SELECT
        Cars.name AS car_name,
        Cars.class AS car_class,
        AVG(res.position) AS average_position,
        COUNT(res.race) AS race_count
    FROM
        Cars
    JOIN Results res ON
        Cars.name = res.car
    GROUP BY
        Cars.name,
        Cars.class
),
ClassAvgRes AS(
    SELECT
        Cars.class AS car_class,
        AVG(res.position) AS avg_class_position,
        COUNT(DISTINCT Cars.name) AS car_count
    FROM
        Cars
    JOIN Results res ON
        Cars.name = res.car
    GROUP BY
        Cars.class
)
SELECT
    ca.car_name,
    ca.car_class,
    ROUND(ca.average_position, 4) AS average_position,
    ca.race_count,
    cl.country AS car_country
FROM
    CarAvgRes ca
JOIN ClassAvgRes cla ON
    ca.car_class = cla.car_class
JOIN Classes cl ON
    ca.car_class = cl.class
WHERE
    ca.average_position < cla.avg_class_position AND cla.car_count > 1
ORDER BY
    ca.car_class,
    ca.average_position;