CCREATE TABLE Pays
(
    ID_Pays INT NOT NULL AUTO_INCREMENT,
 	Nom VARCHAR(50),
    PRIMARY KEY (ID_Pays)
)ENGINE=InnoDB;

CREATE TABLE Region
(
	ID_Region INT NOT NULL AUTO_INCREMENT,
	ID_Pays INT,
	Nom VARCHAR(50),
	PRIMARY KEY(ID_Region),
	FOREIGN KEY(ID_Pays) REFERENCES Pays(ID_Pays)
)ENGINE=InnoDB;

CREATE TABLE Admin
(
	ID_Admin INT NOT NULL AUTO_INCREMENT,
	Pseudo VARCHAR(50),
	Mdp VARCHAR(175),
	PRIMARY KEY(ID_Admin)
)ENGINE=InnoDB;


CREATE TABLE Visiteur
(
	ID_Visiteur INT NOT NULL AUTO_INCREMENT,
	Nom VARCHAR(50),
	Prenom VARCHAR(50),
	Mail VARCHAR(50),
	Numero CHAR(10),
	Mdp VARCHAR(175),
	Vola Decimal(7,2),
	PRIMARY KEY(ID_Visiteur)
)ENGINE=InnoDB;

CREATE TABLE Categorie
(
	ID_Categorie INT NOT NULL AUTO_INCREMENT,
	Etoiles int,
	PRIMARY KEY(ID_Categorie)
)ENGINE=InnoDB;

CREATE TABLE Hotel
(
	ID_Hotel INT NOT NULL AUTO_INCREMENT,
	ID_Pays int,
	ID_Region int,
	ID_Categorie int,
	Nom VARCHAR(50),
	tarif Decimal(7,2),
	description VARCHAR(300),
	photo VARCHAR(200),
	PRIMARY KEY(ID_Hotel),
	FOREIGN KEY(ID_Region) REFERENCES Region(ID_Region),
	FOREIGN KEY(ID_Categorie) REFERENCES Categorie(ID_Categorie)
)ENGINE=InnoDB;

CREATE TABLE Reservation
(
	ID_Reservation INT NOT NULL AUTO_INCREMENT,
	ID_Hotel int,
	ID_Visiteur int,
	Date_A datetime,
	Date_D datetime,
	Nbr_Personne int,
	Lit int,
	Cout Decimal(7,2),
	PRIMARY KEY(ID_Reservation),
	FOREIGN KEY(ID_Hotel) REFERENCES Hotel(ID_Hotel),
	FOREIGN KEY(ID_Visiteur) REFERENCES Visiteur(ID_Visiteur)
)ENGINE=InnoDB;

CREATE TABLE Avis
(
	ID_Avis INT NOT NULL AUTO_INCREMENT,
	ID_Hotel int,
	ID_Visiteur int,
	Commentaire VARCHAR(1000),
	PRIMARY KEY(ID_Avis),
	FOREIGN KEY(ID_Hotel) REFERENCES Hotel(ID_Hotel),
	FOREIGN KEY(ID_Visiteur) REFERENCES Visiteur(ID_Visiteur)
)ENGINE=InnoDB;

CREATE TABLE Equipement
(
	ID_Equipement INT NOT NULL AUTO_INCREMENT,
	NOM VARCHAR(100),
	PRIMARY KEY(ID_Equipement)
)ENGINE=InnoDB;

CREATE TABLE Activite
(
	ID_Activite INT NOT NULL AUTO_INCREMENT,
	NOM VARCHAR(100),
	PRIMARY KEY(ID_Activite)
)ENGINE=InnoDB;

CREATE TABLE ListeA
(
	ID_ListeA INT NOT NULL AUTO_INCREMENT,
	ID_Hotel int,
	ID_Activite int,
	PRIMARY KEY(ID_listeA),
	FOREIGN KEY(ID_Hotel) REFERENCES Hotel(ID_Hotel),
	FOREIGN KEY(ID_Activite) REFERENCES Activite(ID_Activite)
)ENGINE=InnoDB;

CREATE TABLE ListeE
(
	ID_ListeE INT NOT NULL AUTO_INCREMENT,
	ID_Hotel INT,
	ID_Equipement int,
	PRIMARY KEY(ID_ListeE),
	FOREIGN KEY(ID_Hotel) REFERENCES Hotel(ID_Hotel),
	FOREIGN KEY(ID_Equipement) REFERENCES Equipement(ID_Equipement)
)ENGINE=InnoDB;




/*CREATE VIEW NOTYet AS 
	SELECT e.ID_Etudiant, m.UE, m.Intitule, M.Credit,m.Semestre, n.Noty,
	CASE 
    WHEN Noty<10 THEN 'any'
	WHEN Noty>=10 and Noty<12 THEN 'P'
	WHEN Noty>=12 and Noty<14 THEN 'AB'
	WHEN Noty>=14 and Noty<16 THEN 'B'
	WHEN Noty>=16 THEN 'TB'
	END "Resultat"
	FROM Etudiant e, Matiere m, Note n
	WHERE e.ID_Etudiant = n.ID_Etudiant 
		AND m.ID_Matiere = n.ID_Matiere;	*/



