SELECT DISTINCT nom
FROM voyageur
    INNER JOIN reservation ON reservation.codev = voyageur.codev
    INNER JOIN train ON train.codet = reservation.codet
WHERE train.design = 'TGV3';