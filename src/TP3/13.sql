SELECT DISTINCT train.design
FROM train
    INNER JOIN reservation ON reservation.codet = train.codet
    INNER JOIN voyageur ON reservation.codev = voyageur.codev
WHERE voyageur.travail = 'Ministre';