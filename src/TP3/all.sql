USE 'db_tp3';
/* 1 */
SELECT *
FROM voyageur
WHERE travail = 'Dentiste';
/* 2 */
SELECT *
FROM voyageur
WHERE YEAR(CURRENT_DATE) - YEAR(datenais) < 18;
/* 3 */
UPDATE train
SET frais = frais * 2
WHERE design = 'TGV4';
/* 4 */
SELECT design,
    couleur
FROM train
WHERE nbr_place >= 100;
/* 5 */
SELECT MIN(frais) AS frais_minimum,
    MAX(frais) AS frais_maximum
FROM train;
/* 6 */
SELECT voyageur.*
FROM voyageur
    INNER JOIN reservation ON voyageur.codev = reservation.codev
ORDER BY reservation.date_reservation DESC
LIMIT 3;
/* 7 */
SELECT *
FROM voyageur
WHERE prenoms LIKE 'jean%';
/* 8 */
SELECT voyageur.*
FROM voyageur
WHERE codev NOT IN (
        SELECT DISTINCT codev
        FROM reservation
    );
/* 9 */
SELECT voyageur.nom,
    voyageur.prenoms
FROM voyageur
    INNER JOIN reservation ON reservation.codev = voyageur.codev
WHERE YEAR(reservation.date_reservation) = 2019;
/* 10 */
SELECT voyageur.nom,
    voyageur.prenoms
FROM voyageur
    INNER JOIN reservation ON reservation.codev = voyageur.codev
WHERE YEAR(reservation.date_reservation) = 2019;
/* 11 */
SELECT codet,
    count(codev)
FROM reservation
GROUP BY codet;
/* 12 */
SELECT COUNT(codev) AS nbr_voyageur
FROM reservation
WHERE classe = 2;
/* 13 */
SELECT DISTINCT train.design
FROM train
    INNER JOIN reservation ON reservation.codet = train.codet
    INNER JOIN voyageur ON reservation.codev = voyageur.codev
WHERE voyageur.travail = 'Ministre';
/* 14 */
SELECT *
FROM reservation
ORDER BY date_reservation DESC;
/* 15 */
SELECT voyageur.nom
FROM voyageur
    INNER JOIN reservation ON voyageur.codev = reservation.codev
GROUP BY reservation.codev
HAVING COUNT(reservation.codev) > 2;
/* 16 */
SELECT *
FROM voyageur
ORDER BY datenais ASC
LIMIT 1;
/* 17 */
SELECT *
FROM voyageur
WHERE travail = (
        SELECT travail
        FROM voyageur
        WHERE nom = 'KOTOARISON'
            AND prenoms = 'Justin'
    )
    AND codev <> (
        SELECT codev
        FROM voyageur
        WHERE nom = 'KOTOARISON'
            AND prenoms = 'Justin'
    );
/* 18 */
SELECT DISTINCT nom
FROM voyageur
    INNER JOIN reservation ON reservation.codev = voyageur.codev
    INNER JOIN train ON train.codet = reservation.codet
WHERE train.design = 'TGV3';
/* 19 */
SELECT DISTINCT voyageur.*
FROM voyageur
    INNER JOIN reservation ON reservation.codev = voyageur.codev
WHERE reservation.place BETWEEN 0 AND 50;
/* 20 */
SELECT DISTINCT voyageur.*
FROM voyageur
    INNER JOIN reservation ON reservation.codev = voyageur.codev
WHERE reservation.codet IN (
        SELECT DISTINCT reservation.codet
        FROM reservation
        WHERE reservation.codet IN (
                SELECT DISTINCT reservation.codet
                FROM reservation
                WHERE reservation.codev = (
                        SELECT voyageur.codev
                        FROM voyageur
                        WHERE (
                                voyageur.nom = 'RIVO'
                                AND voyageur.prenoms = 'Jean Batiste'
                            )
                    )
            )
    )
    AND voyageur.codev <> (
        SELECT voyageur.codev
        FROM voyageur
        WHERE (
                voyageur.nom = 'RIVO'
                AND voyageur.prenoms = 'Jean Batiste'
            )
    );
/* 21 */
SELECT SUM(train.frais * train_voyageur.nbr_voyageur) AS recette
FROM train
    INNER JOIN (
        SELECT reservation.codet AS train_en_service,
            COUNT(*) AS nbr_voyageur
        FROM reservation
        WHERE reservation.date_reservation = '2020-11-17'
        GROUP BY reservation.codet
    ) AS train_voyageur ON train_voyageur.train_en_service = train.codet;