SELECT voyageur.*
FROM voyageur
WHERE codev NOT IN (
        SELECT DISTINCT codev
        FROM reservation
    );