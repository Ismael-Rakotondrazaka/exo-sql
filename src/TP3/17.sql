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