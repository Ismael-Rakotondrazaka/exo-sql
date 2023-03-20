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