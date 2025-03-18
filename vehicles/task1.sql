SELECT
    veh.maker,
    moto.model
FROM
    Motorcycle moto
JOIN Vehicle veh ON
    moto.model = veh.model
WHERE
    moto.horsepower > 150 AND moto.price < 20000 AND moto.type = 'Sport'
ORDER BY
    moto.horsepower
DESC
    ;