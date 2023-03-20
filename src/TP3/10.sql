SELECT DISTINCT voyageur.nom,
    voyageur.travail
FROM voyageur
    INNER JOIN reservation ON reservation.codev = voyageur.codev
WHERE reservation.classe = 1;