SELECT DISTINCT voyageur.*
FROM voyageur
    INNER JOIN reservation ON reservation.codev = voyageur.codev
WHERE reservation.place BETWEEN 0 AND 50;