WITH
    CarAvgResults AS(
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
MinClassAvg AS(
    SELECT
        car_class,
        MIN(average_position) AS min_avg_position
    FROM
        CarAvgResults
    GROUP BY
        car_class
)
SELECT
    ca.car_name,
    ca.car_class,
    ROUND(ca.average_position, 4) AS average_position,
    ca.race_count
FROM
    CarAvgResults ca
JOIN MinClassAvg mca ON
    ca.car_class = mca.car_class AND ca.average_position = mca.min_avg_position
ORDER BY
    average_position;