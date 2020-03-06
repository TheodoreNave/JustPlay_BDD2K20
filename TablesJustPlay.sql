CREATE TABLE Catégories(
   id INT,
   Nom VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE Langues(
   id INT,
   Nom VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE Casting(
   id INT,
   Nom VARCHAR(50),
   Prénom VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE Genre(
   id INT,
   Nom VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE Abonnement(
   id INT,
   Statut_Paiement INT,
   Type INT,
   PRIMARY KEY(id)
);

CREATE TABLE Pays(
   id INT,
   Nom VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE Vidéos(
   id INT,
   Titre VARCHAR(50),
   video_url VARCHAR(50),
   Description TEXT,
   date_de_sortie DATE,
   date_d_ajout DATETIME,
   id_1 INT NOT NULL,
   id_2 INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES Pays(id),
   FOREIGN KEY(id_2) REFERENCES Catégories(id)
);

CREATE TABLE Adresse(
   id INT,
   Ville VARCHAR(50),
   Code_Postal VARCHAR(50),
   Lieu_de_résidence VARCHAR(50),
   id_1 INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES Pays(id)
);

CREATE TABLE Utilisateurs(
   id INT,
   Nom VARCHAR(50),
   abonnement INT,
   Prénom VARCHAR(50),
   Date_de_naissance DATE,
   Password VARCHAR(50),
   E_Mail VARCHAR(50),
   id_1 INT,
   id_2 INT,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES Adresse(id),
   FOREIGN KEY(id_2) REFERENCES Abonnement(id)
);

CREATE TABLE Profils(
   id INT,
   avatar_url INT,
   id_1 INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES Utilisateurs(id)
);

CREATE TABLE Disponiblle(
   id INT,
   id_1 INT,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES Vidéos(id),
   FOREIGN KEY(id_1) REFERENCES Langues(id)
);

CREATE TABLE Joue(
   id INT,
   id_1 INT,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES Vidéos(id),
   FOREIGN KEY(id_1) REFERENCES Casting(id)
);

CREATE TABLE détients(
   id INT,
   id_1 INT,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES Vidéos(id),
   FOREIGN KEY(id_1) REFERENCES Genre(id)
);

CREATE TABLE réalise(
   id INT,
   id_1 INT,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES Vidéos(id),
   FOREIGN KEY(id_1) REFERENCES Casting(id)
);

CREATE TABLE Disponible(
   id INT,
   id_1 INT,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES Vidéos(id),
   FOREIGN KEY(id_1) REFERENCES Pays(id)
);
