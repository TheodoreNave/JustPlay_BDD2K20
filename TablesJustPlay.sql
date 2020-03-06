CREATE TABLE Categories(
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
   Prenom VARCHAR(50),
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

CREATE TABLE Videos(
   id INT,
   Titre VARCHAR(50),
   video_url VARCHAR(50),
   Description TEXT,
   date_de_sortie DATE,
   date_ajout DATETIME,
   id_Pays INT NOT NULL,
   id_Categories INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_Pays) REFERENCES Pays(id),
   FOREIGN KEY(id_Categories) REFERENCES Categories(id)
);

CREATE TABLE Adresse(
   id INT,
   Ville VARCHAR(50),
   Code_Postal VARCHAR(50),
   Lieu_de_residence VARCHAR(50),
   id_Pays INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_Pays) REFERENCES Pays(id)
);

CREATE TABLE Utilisateurs(
   id INT,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Date_de_naissance DATE,
   Password VARCHAR(50),
   E_Mail VARCHAR(50),
   id_Adresse INT,
   id_Abonnement INT,
   PRIMARY KEY(id),
   FOREIGN KEY(id_Adresse) REFERENCES Adresse(id),
   FOREIGN KEY(id_Abonnement) REFERENCES Abonnement(id)
);

CREATE TABLE Profils(
   id INT,
   avatar_url INT,
   id_Utilisateurs INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_Utilisateurs) REFERENCES Utilisateurs(id)
);

CREATE TABLE Visible(
   id_Videos INT,
   id_Langues INT,
   PRIMARY KEY(id_Videos, id_Langues),
   FOREIGN KEY(id_Videos) REFERENCES Videos(id),
   FOREIGN KEY(id_Langues) REFERENCES Langues(id)
);

CREATE TABLE Joue(
   id_Videos INT,
   id_Casting INT,
   PRIMARY KEY(id_Videos, id_Casting),
   FOREIGN KEY(id_Videos) REFERENCES Videos(id),
   FOREIGN KEY(id_Casting) REFERENCES Casting(id)
);

CREATE TABLE détients(
   id_Videos INT,
   id_Genre INT,
   PRIMARY KEY(id_Videos, id_Genre),
   FOREIGN KEY(id_Videos) REFERENCES Videos(id),
   FOREIGN KEY(id_Genre) REFERENCES Genre(id)
);

CREATE TABLE réalise(
   id_Videos INT,
   id_Casting INT,
   PRIMARY KEY(id_Videos, id_Casting),
   FOREIGN KEY(id_Videos) REFERENCES Videos(id),
   FOREIGN KEY(id_Casting) REFERENCES Casting(id)
);

CREATE TABLE Accesible(
   id_Videos INT,
   id_Pays INT,
   PRIMARY KEY(id_Videos, id_Pays),
   FOREIGN KEY(id_Videos) REFERENCES Videos(id),
   FOREIGN KEY(id_Pays) REFERENCES Pays(id)
);
