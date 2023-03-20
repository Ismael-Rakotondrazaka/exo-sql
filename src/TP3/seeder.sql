CREATE DATABASE IF NOT EXISTS `db_tp3`;
USE `db_tp3`;
CREATE TABLE IF NOT EXISTS `voyageur` (
    codev VARCHAR(255) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    prenoms VARCHAR(255) NOT NULL,
    datenais DATE,
    travail VARCHAR(255) NOT NULL,
    PRIMARY KEY (codev)
);
CREATE TABLE IF NOT EXISTS `train` (
    codet VARCHAR(255) NOT NULL,
    design VARCHAR(255) NOT NULL,
    couleur VARCHAR(255) NOT NULL,
    nbr_place INT NOT NULL,
    frais INT,
    PRIMARY KEY(codet)
);
CREATE TABLE IF NOT EXISTS `reservation` (
    codev VARCHAR(255) NOT NULL,
    codet VARCHAR(255) NOT NULL,
    place INT NOT NULL,
    classe INT NOT NULL,
    date_reservation DATE,
    FOREIGN KEY (codet) REFERENCES train(codet),
    FOREIGN KEY (codev) REFERENCES voyageur(codev)
);
INSERT INTO voyageur (codev, nom, prenoms, datenais, travail)
VALUES (
        'V1',
        'RAKOTOBE',
        'Jean Luc',
        '1975-10-15',
        'Ministre'
    ),
    (
        'V2',
        'RANDRIANTSOA',
        'Tiana Aldin',
        '1998-10-12',
        'Marchand'
    ),
    (
        'V3',
        'KOTOARISON',
        'Justin',
        '1991-11-02',
        'Dentiste'
    ),
    (
        'V4',
        'RIVO',
        'Jean Batiste',
        '1993-10-13',
        'Enseignant'
    ),
    (
        'V5',
        'ZANATOKY',
        'Marie Francoise',
        '2004-10-15',
        'Coiffeuse'
    ),
    (
        'V6',
        'NDREMA',
        'Bevazaha',
        '1986-01-05',
        'Dentise'
    );
INSERT INTO train (codet, design, couleur, nbr_place, frais)
VALUES (
        'T1',
        'TGV1',
        'Bleu',
        200,
        1000
    ),
    (
        'T2',
        'TGV2',
        'Gris',
        50,
        2000
    ),
    (
        'T3',
        'TGV3',
        'Gris',
        150,
        3000
    ),
    (
        'T4',
        'TGV4',
        'Blanc',
        100,
        1500
    );
INSERT INTO reservation (codev, codet, place, classe, date_reservation)
VALUES ('V1', 'T2', 5, 1, '2020-11-17'),
    ('V3', 'T4', 40, 2, '2020-11-18'),
    ('V2', 'T2', 49, 2, '2019-05-01'),
    ('V1', 'T1', 3, 1, '2020-10-10'),
    ('V5', 'T1', 180, 3, '2020-11-17'),
    ('V3', 'T3', 25, 1, '2020-11-17'),
    ('V1', 'T1', 52, 2, '2019-10-23'),
    ('V5', 'T4', 87, 3, '2020-02-14'),
    ('V2', 'T2', 30, 3, '2020-11-17'),
    ('V4', 'T1', 95, 2, '2020-09-24');