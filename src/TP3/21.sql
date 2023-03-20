SELECT SUM(train.frais * train_voyageur.nbr_voyageur) AS recette
FROM train
    INNER JOIN (
        SELECT reservation.codet AS train_en_service,
            COUNT(*) AS nbr_voyageur
        FROM reservation
        WHERE reservation.date_reservation = '2020-11-17'
        GROUP BY reservation.codet
    ) AS train_voyageur ON train_voyageur.train_en_service = train.codet;