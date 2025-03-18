SELECT
    c.name AS 'Customer name',
    c.email AS 'Customer email',
    c.phone AS 'Customer phone number',
    COUNT(b.ID_booking) AS 'Total bookings',
    GROUP_CONCAT(
        DISTINCT h.name
    ORDER BY
        h.name SEPARATOR ', '
    ) AS Hotels,
    AVG(
        DATEDIFF(
            b.check_out_date,
            b.check_in_date
        )
    ) AS 'Average booking'
FROM
    Customer c
JOIN Booking b ON
    c.ID_customer = b.ID_customer
JOIN Room r ON
    b.ID_room = r.ID_room
JOIN Hotel h ON
    r.ID_hotel = h.ID_hotel
GROUP BY
    c.ID_customer
HAVING
    COUNT(DISTINCT h.ID_hotel) > 1 AND COUNT(b.ID_booking) > 2
ORDER BY
    4
DESC
    ;