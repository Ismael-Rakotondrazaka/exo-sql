SELECT codet,
    count(codev)
FROM reservation
GROUP BY codet;