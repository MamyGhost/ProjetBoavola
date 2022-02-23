CREATE DATABASE ecole;
CREATE ROLE user_ecole LOGIN PASSWORD 'root';
ALTER DATABASE ecole OWNER TO user_ecole;


DROP TABLE classe;
DROP TABLE etudiant;
DROP TABLE note;
DROP TABLE matiere;
DROP TABLE ecolage;
DROP TABLE detailclasse;
DROP TABLE detailecolage;
DROP TABLE payement;


CREATE TABLE classe(
	id serial,
	nom varchar(30),
	primary key(id)
);
INSERT INTO classe(nom) VALUES('S1_A');
INSERT INTO classe(nom) VALUES('S3_A');
INSERT INTO classe(nom) VALUES('S5_A');


CREATE TABLE etudiant(
	id serial,
	matricule varchar(125),
	nom varchar(125),
	prenom varchar(125),
	dtn date,
	contact varchar(25),
	primary key(id)
);
INSERT INTO etudiant(matricule,nom,prenom,dtn,contact) VALUES('ETU9632','Jean','Rakoto','12/03/2002','0324035487');
INSERT INTO etudiant(matricule,nom,prenom,dtn,contact) VALUES('ETU6395','Bao','Andria','15/11/2003','0341525512');
INSERT INTO etudiant(matricule,nom,prenom,dtn,contact) VALUES('ETU0173','Rila','Malala','10/02/2002','0322545685');
INSERT INTO etudiant(matricule,nom,prenom,dtn,contact) VALUES('ETU7284','Rabe','Razafy','05/10/2001','0341414778');
INSERT INTO etudiant(matricule,nom,prenom,dtn,contact) VALUES('ETU4708','Jila','Vero','15/03/2003','0333412541');
INSERT INTO etudiant(matricule,nom,prenom,dtn,contact) VALUES('ETU1529','Dera','Tema','25/12/2002','0332415986');


CREATE TABLE note(
	id serial,
	idclasse int,
	idetudiant int,
	idmatiere int,
	note int,
	primary key(id)
);
ALTER TABLE note add foreign key (idclasse) references classe(id);
ALTER TABLE note add foreign key (idetudiant) references etudiant(id);
INSERT INTO note(idclasse,idetudiant,idmatiere,note) VALUES(1,1,1,11);
INSERT INTO note(idclasse,idetudiant,idmatiere,note) VALUES(1,2,1,12);
INSERT INTO note(idclasse,idetudiant,idmatiere,note) VALUES(2,3,2,11);
INSERT INTO note(idclasse,idetudiant,idmatiere,note) VALUES(2,4,2,12);
INSERT INTO note(idclasse,idetudiant,idmatiere,note) VALUES(3,5,3,11);
INSERT INTO note(idclasse,idetudiant,idmatiere,note) VALUES(3,6,3,12);




CREATE TABLE matiere(
	id serial,
	nom varchar(75),
	coeeficient int,
	primary key(id)
);
INSERT INTO matiere(nom,coeeficient) VALUES('MATH105','4');
INSERT INTO matiere(nom,coeeficient) VALUES('INF107','4');
INSERT INTO matiere(nom,coeeficient) VALUES('PROG','5');



CREATE TABLE detailclasse(
	id serial,
	idclasse int,
	idetudiant int,
	numero int,
	anneescolaire int,
	primary key(id)
);
ALTER TABLE detailclasse add foreign key (idclasse) references classe(id);
ALTER TABLE detailclasse add foreign key (idetudiant) references etudiant(id);
INSERT INTO detailclasse(idclasse,idetudiant,numero,anneescolaire) VALUES(1,1,4,2021);
INSERT INTO detailclasse(idclasse,idetudiant,numero,anneescolaire) VALUES(1,2,4,2021);
INSERT INTO detailclasse(idclasse,idetudiant,numero,anneescolaire) VALUES(2,3,5,2021);
INSERT INTO detailclasse(idclasse,idetudiant,numero,anneescolaire) VALUES(2,4,5,2021);
INSERT INTO detailclasse(idclasse,idetudiant,numero,anneescolaire) VALUES(3,5,6,2021);
INSERT INTO detailclasse(idclasse,idetudiant,numero,anneescolaire) VALUES(3,6,6,2021);

CREATE TABLE ecolage(
	id serial,
	idclasse int,
	primary key(id)
);
ALTER TABLE ecolage add foreign key (iddetailclasse) references detailclasse(id);
INSERT INTO ecolage(idclasse) VALUES(1);
INSERT INTO ecolage(idlclasse) VALUES(2);
INSERT INTO ecolage(idclasse) VALUES(3);

CREATE TABLE detailecolage(
	id serial,
	idecolage int,
	datelimite date,
	total bigint,
	anneescolaire int,
	primary key(id)
);
ALTER TABLE detailecolage add foreign key (idecolage) references ecolage(id);
INSERT INTO detailecolage(idecolage,datelimite,total,anneescolaire) VALUES(1,'12/11/2021','1000000',2021);


CREATE TABLE payement(
	id serial,
	iddetailecolage int,
	idetudiant int,
	paye boolean, 
	primary key(id)
);
ALTER TABLE payement add foreign key (iddetailecolage) references detailecolage(id);
ALTER TABLE payement add foreign key (idetudiant) references etudiant(id);
INSERT INTO payement(iddetailecolage,idetudiant,paye) VALUES(1,1,false);
INSERT INTO payement(iddetailecolage,idetudiant,paye) VALUES(1,2,false);
INSERT INTO payement(iddetailecolage,idetudiant,paye) VALUES(1,3,false);

CREATE TABLE detailpayement(
	id serial,
	idpayement int,
	datepayement date,
	montant bigint,
	primary key(id)
);
ALTER TABLE detailpayement add foreign key (idpayement) references payement(id);
INSERT INTO detailpayement(idpayement,datepayement,montant) VALUES(1,'05/09/2021','1000000');
INSERT INTO detailpayement(idpayement,datepayement,montant) VALUES(2,'14/10/2021','1000000');
INSERT INTO detailpayement(idpayement,datepayement,montant) VALUES(3,'14/11/2021','1000000');

