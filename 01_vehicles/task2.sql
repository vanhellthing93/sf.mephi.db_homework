SELECT
    veh.maker,
    Car.model,
    Car.horsepower,
    Car.engine_capacity,
    "Car" AS vehicle_type
FROM
    Car
JOIN Vehicle veh ON
    Car.model = veh.model
WHERE
    horsepower > 150 AND engine_capacity < 3 AND price < 35000
UNION ALL
SELECT
    veh.maker,
    moto.model,
    moto.horsepower,
    moto.engine_capacity,
    "Motorcycle" AS vehicle_type
FROM
    Motorcycle moto
JOIN Vehicle veh ON
    moto.model = veh.model
WHERE
    horsepower > 150 AND engine_capacity < 1.5 AND price < 20000
UNION ALL
SELECT
    veh.maker,
    bic.model,
    NULL AS horsepower,
    NULL AS engine_capacity,
    "Bicycle" AS vehicle_type
FROM
    Bicycle bic
JOIN Vehicle veh ON
    bic.model = veh.model
WHERE
    gear_count > 18 AND price < 4000
ORDER BY
    horsepower IS NULL,
    horsepower
DESC
    ;