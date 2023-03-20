SELECT voyageur.*
FROM voyageur
    INNER JOIN reservation ON voyageur.codev = reservation.codev
ORDER BY reservation.date_reservation DESC
LIMIT 3;