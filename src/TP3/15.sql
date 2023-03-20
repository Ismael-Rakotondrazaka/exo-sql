SELECT voyageur.nom
FROM voyageur
    INNER JOIN reservation ON voyageur.codev = reservation.codev
GROUP BY reservation.codev
HAVING COUNT(reservation.codev) > 2;