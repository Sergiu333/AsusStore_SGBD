--tema :  gestionarea produselor in cadrul magazinului 'Asus-Store'  ;

drop database if exists Asus_Store;
create database Asus_Store;
use Asus_Store;


DROP TABLE IF EXISTS PC;
DROP TABLE IF EXISTS caracteristici;
DROP TABLE IF EXISTS parametri_de_bază ;
DROP TABLE IF EXISTS ecran;
DROP TABLE IF EXISTS Procesor;
DROP TABLE IF EXISTS sisteme_de_operare;
DROP TABLE IF EXISTS Memorie;
DROP TABLE IF EXISTS Stocarea_datelor;
DROP TABLE IF EXISTS interfete_conectori;
DROP TABLE IF EXISTS placa;

DROP TABLE IF EXISTS Tip_Ram;
DROP TABLE IF EXISTS Tip_Cpu;
DROP TABLE IF EXISTS Tip_Display;
DROP TABLE IF EXISTS Tip_Stocare;
DROP TABLE IF EXISTS Tip_Placa_Video;

DROP TABLE IF EXISTS editie;
DROP TABLE IF EXISTS Brend_Pc;


--crearea tabelelor

CREATE TABLE PC (
id_Pc  INT  PRIMARY KEY,
nume varchar(20) NOT NULL,
model varchar(10) NOT NULL,
color varchar(15) NOT NULL,
pret FLOAT NOT NULL,
data_fabricarii DATE NOT NULL,
material varchar(10) NOT NULL,
stoc varchar(2) NOT NULL,
id_Caracteristici INT NOT NULL);

CREATE TABLE caracteristici (
id_Caracteristici INT PRIMARY KEY,
id_Parametri int Not null,
id_Ecran INT NOT NULL,
id_Procesor INT NOT NULL,
id_Sietem INT NOT NULL,
id_Memorie INT NOT NULL,
id_Date INT NOT NULL,
id_Interfete INT NOT NULL,
id_Placa INT NOT NULL);

CREATE TABLE parametri_de_bază  (
id_Parametri INT  PRIMARY KEY,
id_Brend_Pc INT NOT NULL,
id_editie INT NOT NULL,
greutate FLOAT NOT NULL);

--***********************************************
CREATE TABLE Brend_Pc(
id_brend_Pc INT PRIMARY KEY,
numeBrend varchar(20));

CREATE TABLE editie(
id_editie INT PRIMARY KEY,
numeEditie varchar(20));
--***********************************************

CREATE TABLE ecran ( -- si aici trbeuie de schimbat 
id_Ecran INT PRIMARY KEY,
dimensiune_ecran FLOAT NOT NULL,
rezolutie varchar(15) NOT NULL,
id_TipDisplay INT NOT NULL,
Rata_de_reimprospătare varchar(10) NOT NULL ,
acoperire_ecran varchar(15) NOT NULL);

CREATE TABLE Procesor (---tip tabel aparte
id_Procesor INT  PRIMARY KEY,
id_Tip_Cpu INT NOT NULL,     
Cpu varchar(5) NOT NULL,
numarul_de_nuclee INT NOT NULL,
fregventa_procesorului varchar(20) NOT NULL,
arhitectura varchar(10) NOT NULL,
Cache INT NOT NULL);

CREATE TABLE sisteme_de_operare (
id_Sietem INT  PRIMARY KEY,
nume_sistem varchar(10) NOT NULL);

CREATE TABLE Memorie (---tip ram tabel aparte(tip_Memorie)
id_Memorie INT PRIMARY KEY,
capacitate_max INT NOT NULL,
Ram INT NOT NULL,
id_Tip_Ram INT NOT NULL);

CREATE TABLE Stocarea_datelor (--
id_Date INT  PRIMARY KEY,
id_Tip_Stocare INT NOT NULL,
capacitate INT NOT NULL);

CREATE TABLE interfete_conectori (-- si aici ceva trebuie de schimbat 
id_Interfete INT PRIMARY KEY,
Hdmi INT NOT NULL,
Microfon INT NOT NULL,--
usb INT NOT NULL,
Bluetooth INT NOT NULL,--
wifi INT NOT NULL);--

CREATE TABLE placa(-- tab aparte
id_Placa INT PRIMARY KEY,
id_Tip_Placa_video INT NOT NULL,
memorie_video varchar(10),
model_placa_video varchar(20));

--*****************************************************************

CREATE TABLE Tip_Ram(--
id_Tip_Ram	INT PRIMARY KEY,
nume_Ram varchar (4) NOT NULL);

CREATE TABLE Tip_Cpu(--
id_Tip_Cpu INT PRIMARY KEY,
Tip_Cpu varchar(10));

CREATE TABLE Tip_Display(--
id_TipDisplay INT PRIMARY KEY,
Nume_Tip_Display varchar (10));

CREATE TABLE Tip_Stocare(--
id_Tip_Stocare INT PRIMARY KEY,
Nume_Tip_Stocare varchar(3));

CREATE TABLE Tip_Placa_Video(--
id_Tip_Placa_video INT PRIMARY KEY,
Tip_Placa_Video varchar(10));

--***********************************************************************


--unirea tabelelor 


Alter Table PC Add Foreign Key (id_Caracteristici) references caracteristici(id_Caracteristici);

ALTER TABLE caracteristici
ADD CONSTRAINT FK_caracteristici_id_Parametri
FOREIGN KEY (id_Parametri) REFERENCES parametri_de_bază  (id_Parametri)


ALTER TABLE caracteristici
ADD CONSTRAINT FK_caracteristici_id_Ecran
FOREIGN KEY (id_Ecran) REFERENCES ecran (id_Ecran)


ALTER TABLE caracteristici
ADD CONSTRAINT FK_caracteristici_id_Procesor
FOREIGN KEY (id_Procesor) REFERENCES Procesor (id_Procesor)


ALTER TABLE caracteristici
ADD CONSTRAINT FK_caracteristici_id_Sietem
FOREIGN KEY (id_Sietem) REFERENCES sisteme_de_operare (id_Sietem)



ALTER TABLE caracteristici
ADD CONSTRAINT FK_caracteristici_id_Memorie
FOREIGN KEY (id_Memorie) REFERENCES Memorie (id_Memorie)



ALTER TABLE caracteristici
ADD CONSTRAINT FK_caracteristici_id_Date
FOREIGN KEY (id_Date) REFERENCES Stocarea_datelor  (id_Date)



ALTER TABLE caracteristici
ADD CONSTRAINT FK_caracteristici_id_Interfete
FOREIGN KEY (id_Interfete) REFERENCES interfete_conectori  (id_Interfete)


ALTER TABLE caracteristici
ADD CONSTRAINT FK_caracteristici_id_Placa
FOREIGN KEY (id_Placa) REFERENCES placa (id_Placa)


Alter Table Memorie Add Foreign Key (id_Tip_Ram) references Tip_Ram(id_Tip_Ram);
Alter Table Procesor Add Foreign Key (id_Tip_Cpu) references Tip_Cpu(id_Tip_Cpu);
Alter Table ecran Add Foreign Key (id_TipDisplay) references Tip_Display(id_TipDisplay);
Alter Table Stocarea_datelor Add Foreign Key (id_Tip_Stocare) references Tip_Stocare(id_Tip_Stocare);
Alter Table placa Add Foreign Key (id_Tip_Placa_video) references Tip_Placa_Video(id_Tip_Placa_video);

Alter Table parametri_de_bază Add Foreign Key (id_brend_Pc) references Brend_Pc(id_brend_Pc);
Alter Table parametri_de_bază Add Foreign Key (id_editie) references editie(id_editie);


--inregistrarea datelor in tabele

INSERT INTO Tip_Ram(id_Tip_Ram,nume_Ram)
VALUES(1,'DDR1'),
(2,'DDR2'),
(3,'DDR3'),
(4,'DDR4');

INSERT INTO Tip_Cpu(id_Tip_Cpu,Tip_Cpu)
VALUES(1,'i5-10300H'),
(2,'i5-11400H'),
(3,'Core i7'),
(4,'i3-1005G1');

INSERT INTO Tip_Display(id_TipDisplay,Nume_Tip_Display)
VALUES(1,'IPS'),
(2,'LED IPS'),
(3,'TN');

INSERT INTO Tip_Placa_Video(id_Tip_Placa_video,Tip_Placa_Video)
VALUES(1,'integrata'),
(2,'discreta');

INSERT INTO Tip_Stocare(id_Tip_Stocare,Nume_Tip_Stocare)
VALUES(1,'HDD'),
(2,'SSD');

INSERT INTO Brend_Pc(id_Brend_Pc,numeBrend)
VALUES(1,'Asus'),
(2,'Lenovo'),
(3,'Apple'),
(4,'lenovo');

INSERT INTO editie(id_editie,numeEditie)
VALUES(1,'TUF Gaming'),
(2,'IdeaPad Gaming'),
(3,'MacBook'),
(4,'IdeaPad');

INSERT INTO parametri_de_bază(id_Parametri,id_brend_Pc,id_editie,greutate)--brend tab aparte
VALUES
(1,1,1,2.3),
(2,1,1,2.1),
(3,2,2,2.2),
(4,3,3,2.0),
(5,4,4,1.8);

INSERT INTO ecran(id_Ecran,dimensiune_ecran,rezolutie,id_TipDisplay,Rata_de_reimprospătare,acoperire_ecran)
VALUES
(1,15.6,'1920 x 1080 px',1,'144 Hz','Matte'),
(2,15.6,'1920 x 1080 px',1,'144 Hz','Matte'),
(3,15.6,'1920 x 1080 px',1,'60 Hz','Matte'),
(4,16,'3072 x 1920 px',2,'144 Hz','Matte'),
(5,15.6,'1920 x 1080',3,'60 Hz','Anti-Glare');

INSERT INTO Procesor(id_Procesor,id_Tip_Cpu,Cpu,numarul_de_nuclee,fregventa_procesorului,arhitectura,Cache)
VALUES
(1,1,'i5',4,'2500 - 4500 MHz','Comet Lake',8),
(2,2,'i5',6,'4500 MHz','Tiger Lake',12),
(3,1,'i5',4,'2500 - 4500 MHz', 'Comet',8),
(4,3,'i7',6,'2600 MHz','',12),
(5,4,'i3',2,'1.20 - 3.40 GHz','Ice Lake',4);

INSERT INTO sisteme_de_operare(id_Sietem,nume_sistem)
VALUES
(1,'Win 10'),
(2,'FreeDos'),
(3,'Linux'),
(4,'Mac OS');

INSERT INTO Memorie(id_Memorie,capacitate_max,Ram,id_Tip_Ram)
VALUES 
(1,32,16,4),
(2,16,8,4),
(3,16,8,4),
(4,16,16,4),
(5,12,8,4);

INSERT INTO Stocarea_datelor(id_Date,id_Tip_Stocare,capacitate)
VALUES 
(1,2,512),
(2,2,512),
(3,2,512),
(4,2,512),
(5,2,256);

INSERT INTO interfete_conectori(id_Interfete,Hdmi,Microfon,usb,Bluetooth,wifi)--
VALUES 
(1,1,2,1,1,1),
(2,1,2,1,1,1),
(3,1,1,2,1,1),
(4,1,1,1,1,1),
(5,1,1,2,1,1);

INSERT INTO placa(id_Placa,id_Tip_Placa_video,memorie_video,model_placa_video)
VALUES 
(1,1,'',''),
(3,2,'4','GeForce GTX 1650'),
(4,2,'4','Radeon Pro 5300M');




INSERT INTO caracteristici(id_Caracteristici,id_Parametri,id_Ecran,id_Procesor,id_Sietem,id_Memorie,id_Date,id_Interfete,id_Placa)
VALUES
(1,1,1,1,1,1,1,1,1),
(2,2,2,2,2,2,2,2,1),
(3,3,3,3,3,3,3,3,3),
(4,4,4,4,4,4,4,4,4),
(5,5,5,5,2,5,5,5,1);


INSERT INTO PC(id_Pc, nume, model,color,pret, data_fabricarii,material,stoc,id_Caracteristici) 
VALUES 
(1,'TUF Gaming F15','FX506LH','Fortress Gray',17990.0,'2020','Plastic','Da',1),
(2,'TUF Gaming F15','FX506HC','Black',18990.0,'2020','Plastic','Da',2),
(3,'IdeaPad Gaming 3','15IMH05','Black',14390.0,'2020','Plastic','Da',3),
(4,'MacBook Pro', '16 (2019)','Space Gray',53990.0,'2019','Metal','Da',4),
(5,'IdeaPad 3','15IIL05','Gray',8690.0,'2018','Plastic','Da',5);


/*viziuni*/


/*Drop.. verifica daca aceste viziuni exista si daca ele exista ele se sterg*/
DROP view IF EXISTS vPC; 
DROP view IF EXISTS vprocesor;
DROP view IF EXISTS vmemorie;

/*viziunea propriu zisa*/

CREATE VIEW vPC
AS
SELECT id_Parametri,id_Ecran,id_Procesor,id_Sietem,id_Memorie,id_Date,id_Interfete,id_Placa FROM caracteristici INNER JOIN PC
ON	caracteristici.id_Caracteristici=PC.id_Caracteristici;	
select * from vPC;

CREATE VIEW vPC_caracteristici 
AS --viziune din viziune
Select PC.nume, PC.color, PC.pret ,id_Ecran,id_Procesor,id_Sietem,id_Memorie,id_Date,id_Interfete,id_Placa 
FROM PC,caracteristici
WHERE PC.nume='TUF Gaming F15';

select * from vPC_caracteristici;

CREATE VIEW vPcBrend_PcEditie
AS
SELECT PC.nume, PC.pret ,Brend_Pc.numeBrend
FROM PC INNER JOIN  Brend_Pc
ON PC.id_Pc=Brend_Pc.id_brend_Pc;

select * from vPcBrend_PcEditie;


CREATE VIEW vprocesor
AS
SELECT Cpu,numarul_de_nuclee,fregventa_procesorului,Cache FROM Procesor   
where Cpu='i5';	
select * from vprocesor;

CREATE VIEW vmemorie
AS
SELECT id_Date,capacitate FROM Stocarea_datelor   
where id_Tip_Stocare=2 and capacitate='512';

select * from vmemorie;

/*********************************************************************************/

/*Selecturi*/

select max(id_Pc) from PC;  --aceasta ne arata cite calculatoare avem inregistrate

DELETE FROM PC WHERE id_Pc=3;

SELECT * FROM PC
ORDER BY nume DESC; --ordoneaza dupa nume

UPDATE sisteme_de_operare -- modifica cimpurile cu valoarea linux in ubuntu
SET nume_sistem = 'ubuntu'
WHERE nume_sistem='Linux';

SELECT MIN(numeBrend)
FROM Brend_Pc
WHERE id_brend_Pc=1;

SELECT numeEditie  --verifica daca tabela editie are MacBook
FROM editie
WHERE EXISTS
(SELECT numeEditie FROM editie WHERE numeEditie='MacBook');

SELECT nume
FROM PC
LEFT JOIN caracteristici
ON PC.id_Caracteristici = caracteristici.id_Caracteristici;

SELECT id_editie,numeEditie --o alternativa prescurtata pentru conditia OR
FROM editie
WHERE numeEditie IN ('MacBook', 'TUF Gaming');

SELECT nume, pret
FROM PC
WHERE pret<17000;


SELECT capacitate_max,Ram,nume_Ram
FROM Memorie
RIGHT JOIN Tip_Ram
ON Memorie.id_Tip_Ram = Tip_Ram.nume_Ram;


/****************************************************************************/

/*
Anghelenici Sergiu , BD :'Asus-Store'
Am utilizat jonctiunea SQL RIGHT OUTER JOIN pentru ca adaugă toate rândurile din al doilea tabel la tabelul rezultat,
Dacă nu există o valoare potrivită în cele două tabele, returnează valoarea nulă.
Sarcina : Afiseaza citeva cimpuri principale din PC si numele sistemului de operare si ordoneaza dupa id_Pc.
*/
SELECT PC.nume, PC.model,PC.color,PC.pret, sisteme_de_operare.nume_sistem
FROM PC                                                                         --tabel_1
RIGHT JOIN sisteme_de_operare													--batel_2
ON
PC.id_Pc = sisteme_de_operare.id_Sietem
ORDER BY PC.id_Pc;

/***********************************************************************************/


/*Aceasta procedura afiseaza lista calculatoarelor cu pretul mai mic decit 16000*/
USE Asus_Store
GO
DROP PROCEDURE IF EXISTS GetAllProducts;
GO
CREATE PROCEDURE GetAllProducts	
AS
SELECT *FROM PC WHERE pret<16000;


EXECUTE GetAllProducts;


/****************************************************/


/*Aceasta procedura verifica daca cimpul coincide cu cel pe care il setam noi se afiseaza la ecran */
DROP PROCEDURE IF EXISTS GetInfo;
GO
CREATE PROCEDURE GetInfo
@Anul SMALLINT = 2018,
@Numele VARCHAR(20)='IdeaPad 3'
AS
SELECT * FROM PC WHERE YEAR(data_fabricarii) = @Anul
AND nume LIKE @Numele;

EXECUTE GetInfo;



/*********************************/





/*Sa ne imaginam ca intram pe un site si dorim sa cautam o marca 'MacBook'
deci specificam in bara de filtru MacBook si se face conectarea la bd
verifica si ne arata rezultatul specificat de noi
(sarcina trebuie sa contina parametri)*/

DROP PROCEDURE IF EXISTS test3;
GO
CREATE PROCEDURE test3
@Filtru VARCHAR(10) ='MacBook'
AS
IF @Filtru ='MacBook'
BEGIN

SELECT nume, model,color,pret FROM PC WHERE nume=@Filtru;

END

	ELSE IF @Filtru='TUF Gaming F15'
	BEGIN 

	SELECT nume, model,color,pret FROM PC WHERE nume=@Filtru;

	END


EXECUTE test3;

/***************************************************************************/


/*Aceasta procedura afiseaza un cimp din tabela Tip_cpu*/
DROP PROCEDURE IF EXISTS GetInfo2; --stergerea daca exista
GO
CREATE PROCEDURE GetInfo2 --crearea procedurii

@CPUNumele VARCHAR(20)='i5-10300H' -- numele default al parametrului
AS
IF @CPUNumele ='i5-10300H' -- verificarea 
BEGIN

SELECT id_Tip_Cpu,Tip_Cpu FROM Tip_Cpu WHERE Tip_Cpu=@CPUNumele; --instuctiunea select

END

EXECUTE GetInfo2;-- executarea procedurii







/*Aceasta procedura afiseaza tabela ecran */
DROP PROCEDURE IF EXISTS Get_ecran;
GO
CREATE PROCEDURE Get_ecran	
AS

Select * from ecran;

execute Get_ecran;



/**************************************************************************/



/*Aceasta procedura a inregistra inca un sistem de operare */
DROP PROCEDURE IF EXISTS insert1;
GO
CREATE PROCEDURE insert1
@id_Sietem_ int ,
@nume_sistem varchar(10)
AS
insert into sisteme_de_operare(id_Sietem,nume_sistem)values(
@id_Sietem_ , @nume_sistem);

select * from sisteme_de_operare;
execute insert1 5,'WIN 7';
select * from sisteme_de_operare;

/******************************************************************************/