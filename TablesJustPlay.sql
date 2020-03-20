CREATE TABLE Categories(
   id_categorie INT IDENTITY(1,1),
   Nom VARCHAR(50),
   PRIMARY KEY(id_categorie)
);

CREATE TABLE Langues(
   id_langue INT IDENTITY(1,1),
   Nom VARCHAR(50),
   PRIMARY KEY(id_langue)
);

CREATE TABLE Casting(
   id_casting INT IDENTITY(1,1),
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   PRIMARY KEY(id_casting)
);

CREATE TABLE Genre(
   id_genre INT IDENTITY(1,1),
   Nom VARCHAR(50),
   PRIMARY KEY(id_genre)
);

CREATE TABLE Abonnement(
   id_abonnement INT IDENTITY(1,1),
   Nom VARCHAR(50),
   Nombre_ecran INT,
   Prix DECIMAL(15,2),
   PRIMARY KEY(id_abonnement)
);

CREATE TABLE Pays(
   id_Pays INT IDENTITY(1,1),
   Nom VARCHAR(50),
   PRIMARY KEY(id_Pays)
);

CREATE TABLE Ville(
   id_ville INT IDENTITY(1,1),
   Nom VARCHAR(50),
   Code_postal INT,
   PRIMARY KEY(id_ville)
);

CREATE TABLE Videos(
   video_url VARCHAR(50),
   Titre VARCHAR(50),
   Description TEXT,
   date_de_sortie DATE,
   date_ajout DATETIME,
   id_Pays INT NOT NULL,
   id_categorie INT NOT NULL,
   PRIMARY KEY(video_url),
   FOREIGN KEY(id_Pays) REFERENCES Pays(id_Pays),
   FOREIGN KEY(id_categorie) REFERENCES Categories(id_categorie)
);

CREATE TABLE Adresse(
   id_adresse INT IDENTITY(1,1),
   Lieu_de_residence VARCHAR(50),
   id_ville INT,
   PRIMARY KEY(id_adresse),
   FOREIGN KEY(id_ville) REFERENCES Ville(id_ville)
);

CREATE TABLE Utilisateurs(
   id_utilisateur INT IDENTITY(1,1),
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Date_de_naissance DATE,
   Password VARCHAR(50),
   E_Mail VARCHAR(50),
   id_adresse INT,
   PRIMARY KEY(id_utilisateur),
   FOREIGN KEY(id_adresse) REFERENCES Adresse(id_adresse)
);

CREATE TABLE Profils(
   id_profil INT IDENTITY(1,1),
   avatar_url INT,
   id_utilisateur INT NOT NULL,
   PRIMARY KEY(id_profil),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateurs(id_utilisateur)
);

CREATE TABLE Paiement(
   id_paiement INT IDENTITY(1,1),
   statut_paiement VARCHAR(50),
   id_abonnement INT NOT NULL,
   id_utilisateur INT NOT NULL,
   PRIMARY KEY(id_paiement),
   FOREIGN KEY(id_abonnement) REFERENCES Abonnement(id_abonnement),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateurs(id_utilisateur)
);

CREATE TABLE Visible(
   video_url VARCHAR(50),
   id_langue INT,
   PRIMARY KEY(video_url, id_langue),
   FOREIGN KEY(video_url) REFERENCES Videos(video_url),
   FOREIGN KEY(id_langue) REFERENCES Langues(id_langue)
);

CREATE TABLE Joue(
   video_url VARCHAR(50),
   id_casting INT,
   PRIMARY KEY(video_url, id_casting),
   FOREIGN KEY(video_url) REFERENCES Videos(video_url),
   FOREIGN KEY(id_casting) REFERENCES Casting(id_casting)
);

CREATE TABLE détients(
   video_url VARCHAR(50),
   id_genre INT,
   PRIMARY KEY(video_url, id_genre),
   FOREIGN KEY(video_url) REFERENCES Videos(video_url),
   FOREIGN KEY(id_genre) REFERENCES Genre(id_genre)
);

CREATE TABLE réalise(
   video_url VARCHAR(50),
   id_casting INT,
   PRIMARY KEY(video_url, id_casting),
   FOREIGN KEY(video_url) REFERENCES Videos(video_url),
   FOREIGN KEY(id_casting) REFERENCES Casting(id_casting)
);

CREATE TABLE Accesible(
   video_url VARCHAR(50),
   id_Pays INT,
   PRIMARY KEY(video_url, id_Pays),
   FOREIGN KEY(video_url) REFERENCES Videos(video_url),
   FOREIGN KEY(id_Pays) REFERENCES Pays(id_Pays)
);

CREATE TABLE Localiser(
   id_Pays INT,
   id_ville INT,
   PRIMARY KEY(id_Pays, id_ville),
   FOREIGN KEY(id_Pays) REFERENCES Pays(id_Pays),
   FOREIGN KEY(id_ville) REFERENCES Ville(id_ville)
);
