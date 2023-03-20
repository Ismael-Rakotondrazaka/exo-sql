SELECT voyageur.nom,
    voyageur.prenoms
FROM voyageur
    INNER JOIN reservation ON reservation.codev = voyageur.codev
WHERE YEAR(reservation.date_reservation) = 2019;