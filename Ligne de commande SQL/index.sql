/* CREATION DE LA BASE DE DONNÉE */

CREATE DATABASE logiciel_cinema;

/* SELECTION DE NOTRE BASE DE DONNÉE */

USE logiciel_cinema;

/* CREATION DES TABLES */

CREATE TABLE administrateurs (
    id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL
);

CREATE TABLE seances (
    id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50) NOT NULL,
    heure VARCHAR(30) NOT NULL,
    date DATE NOT NULL
);

CREATE TABLE prix (
    id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    type VARCHAR(50) NOT NULL,
    prix DECIMAL(10,2) NOT NULL
);

CREATE TABLE utilisateurs (
    id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    age INT(11) NOT NULL,
    obtenir_prix INT(11) NOT NULL,
    FOREIGN KEY (obtenir_prix) REFERENCES prix(id)
);

CREATE TABLE cinemas (
    id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50) NOT NULL,
    adresse VARCHAR(200) NOT NULL,
    numero_telephone CHAR(10) NOT NULL
);

CREATE TABLE films (
    id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    titre VARCHAR(50) NOT NULL,
    synopsis VARCHAR(250) NULL,
    genre VARCHAR(50) NOT NULL,
    temps_film VARCHAR(30) NOT NULL
);

CREATE TABLE sessions (
    id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    jour_heure DATETIME NOT NULL,
    projection INT(11) NOT NULL,
    FOREIGN KEY (projection) REFERENCES films(id)
);

CREATE TABLE reservations (
    id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    date_reservation DATE NOT NULL,
    reservation INT(11) NOT NULL,
    FOREIGN KEY (reservation) REFERENCES utilisateurs(id),
    au INT(11) NOT NULL,
    FOREIGN KEY (au) REFERENCES cinemas(id),
    obtenir_session INT(11) NOT NULL,
    FOREIGN KEY (obtenir_session) REFERENCES sessions(id)
);

CREATE TABLE salles (
    id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre_salle INT(11) NOT NULL,
    numero_siege INT(11) NOT NULL,
    contient INT(11) NOT NULL,
    FOREIGN KEY (contient) REFERENCES cinemas(id),
    possede INT(11) NOT NULL,
    FOREIGN KEY (possede) REFERENCES sessions(id)
);

/* ALIMENTATION DE NOS TABLES */

/* ALIMENTATION DE LA TABLE PRIX */

INSERT INTO prix (type, prix) VALUES ('Adulte',9.20),('Etudiant',7.60),('Enfant',5.90);

/* ALIMENTATION DE LA TABLE UTILISATEURS */

INSERT INTO utilisateurs (nom, prenom, age, obtenir_prix) VALUES ('Shaffer','Owen', 11, 3),('Ellison','Marie', 25, 1),('Murray','Liam', 16, 2),('Weber','Eden', 40, 1),('Foley','Jordan', 17, 2);

/* ALIMENTATION DE LA TABLE CINEMAS */

INSERT INTO cinemas (nom, adresse, numero_telephone) VALUES ('Gaumont','8 place Brun','0464560220'),('Kinepolis','53 rue Augustin Meunier','0142238893'),('UGC','1 avenue de Guibert','0619682703'),('Pathé','40 chemin de Langlois','0801057360');

/* ALIMENTATION DE LA TABLE FILMS */

INSERT INTO films (titre, synopsis, genre, temps_film) VALUES ('Avengers','Tout vos super hero préféré ce rassemble pour combattre le mal !','Super-Hero','2h23');
INSERT INTO films (titre, synopsis, genre, temps_film) VALUES ('Joker','Arthur Fleck, comédien raté, rencontre des voyous violents en errant dans les rues de Gotham City déguisé en clown.','Thriller/Crime','2h2');
INSERT INTO films (titre, synopsis, genre, temps_film) VALUES ('Titanic','Expédition sous-marine dans une épave du Titanic','Romance/Drame','3h14');
INSERT INTO films (titre, synopsis, genre, temps_film) VALUES ('Get out','Maintenant que Chris et sa copine Rose vont rencontrer leurs parents respectifs, des choses bien étrange ce passe','Horreur','1h44');

/* ALIMENTATION DE LA TABLE SESSIONS */

INSERT INTO sessions (jour_heure, projection) VALUES ('2022-01-05 16:30:00',1),('2022-01-06 14:30:00',2),('2022-01-07 19:20:00',3),('2022-01-08 22:30:00',4),('2022-01-09 10:30:00',1);

/* ALIMENTATION DE LA TABLE SALLES */

INSERT INTO salles (nombre_salle, numero_siege, contient, possede) VALUES (14, 52, 1, 1),(12, 34, 2, 2),(18, 10, 3, 3),(10, 27, 4, 4),(10, 49, 4, 1);

/* ALIMENTATION DE LA TABLE RESERVATIONS */

INSERT INTO reservations (date_reservation, reservation, au, obtenir_session) VALUES ('2022-01-05', 1, 1, 1),('2022-01-06', 2, 2, 2),('2022-01-07', 3, 3, 3),('2022-01-08', 4, 4, 4),('2022-01-09', 5, 2, 4);

/* EXPORT DE LA BASE DE DONNÉES AU CLIENT */

mysqldump -u root -p logiciel_cinema > data-dump.sql;