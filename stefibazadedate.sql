CREATE TABLE FILME (
id_film NUMBER (6,0) NOT NULL PRIMARY KEY, 
nume_film VARCHAR2(50) NOT NULL, 
data_lansarii DATE, 
durata_filmului VARCHAR2(10) NOT NULL, 
nota_recenize NUMBER (6,0),
id_director  NUMBER (6,0) NOT NULL,
id_soundtrack  NUMBER (6,0) NOT NULL,
CONSTRAINT FK_film_director FOREIGN KEY (id_director)
REFERENCES DIRECTORI_DE_FILM(id_director) on delete set null,
CONSTRAINT FK_film_st FOREIGN KEY (id_soundtrack)
REFERENCES COLOANA_SONORA(id_soundtrack) on delete set null
); 

CREATE TABLE GENURI (
id_gen NUMBER (6,0) not null primary key, 
nume_gen VARCHAR2(20) not null 
); 

CREATE TABLE PREMII (
id_premiu NUMBER (6,0) not null primary key, 
nume_premiu VARCHAR2(20) not null,
data_premiu DATE,
id_film NUMBER (6,0) not null,
CONSTRAINT FK_film_prem FOREIGN KEY (id_film)
REFERENCES FILME(id_film) on delete set null
); 


CREATE TABLE DIRECTORI_DE_FILM (
id_director NUMBER (6,0) not null primary key, 
nume_director VARCHAR2(25) not null,
prenume_director VARCHAR2(25) not null
); 

CREATE TABLE ACTORI (
id_actor NUMBER(6,0) not null primary key, 
nume_actor VARCHAR2(25) not null,
prenume_actor VARCHAR2(25) not null
); 

CREATE TABLE COLOANA_SONORA (
id_soundtrack NUMBER(6,0) not null primary key, 
nume_soundtrack VARCHAR2(25)
); 

CREATE TABLE MELODII (
id_melodie NUMBER (6,0) not null primary key, 
nume_melodie VARCHAR2(25) not null,  
durata_melodie VARCHAR2(10), 
gen_muzical VARCHAR2(20),
nume_artist VARCHAR2(30) not null
); 

CREATE TABLE MAGAZINE (
id_magazin NUMBER (6,0) NOT NULL PRIMARY KEY, 
nume_magazin VARCHAR2(20) NOT NULL, 
email VARCHAR2(25),
numar_telefon VARCHAR2(20), 
id_adresa  NUMBER (6,0) not null,
CONSTRAINT FK_mag_adres FOREIGN KEY (id_adresa)
REFERENCES ADRESE(id_adresa) on delete set null
);

CREATE TABLE CLIENTI (
id_client NUMBER(6,0) not null primary key, 
nume_client  VARCHAR2(25) not null,
prenume_client  VARCHAR2(25) not null,
email VARCHAR2(25),
numar_telefon VARCHAR2(20)
); 

CREATE TABLE ADRESE (
id_adresa NUMBER(6,0) not null primary key, 
oras  VARCHAR2(30) not null,
strada  VARCHAR2(30) not null
); 

CREATE TABLE ANGAJATI (
id_angajat NUMBER(6,0) not null primary key, 
nume_angajat  VARCHAR2(25) not null,
prenume_angajat  VARCHAR2(25) not null,
email VARCHAR2(25),
numar_telefon VARCHAR2(20),
data_angajarii DATE not null,
salariu NUMBER(8,2),
id_job VARCHAR2(10) not null,
id_magazin	NUMBER(6,0) not null,
CONSTRAINT FK_mag_adres FOREIGN KEY (id_magazin)
REFERENCES MAGAZINE(id_magazin) on delete set null,
CONSTRAINT FK_mag_adres FOREIGN KEY (id_job)
REFERENCES JOBS(id_job) on delete set null
); 

CREATE TABLE JOBS (
id_job VARCHAR2(10) not null primary key, 
nume_job  VARCHAR2(35) not null,
salariu_minim NUMBER(6,0),
salariu_maxim NUMBER(6,0)
); 

CREATE TABLE INCHIRIERE(
id_film NUMBER (6,0),
id_magazin NUMBER (6,0),
id_client NUMBER (6,0),
PRIMARY KEY (id_film, id_magazin, id_client), 
data_inchiriere DATE not null
);

CREATE TABLE APARTINE(
id_film NUMBER (6,0),
id_gen NUMBER (6,0),
PRIMARY KEY (id_film, id_gen),
CONSTRAINT FK_film_ap FOREIGN KEY (id_film)
REFERENCES FILME(id_film) on delete set null,
CONSTRAINT FK_ap_gen FOREIGN KEY (id_gen)
REFERENCES GENURI(id_gen) on delete set null
);

CREATE TABLE CONTINE(
id_soundtrack NUMBER (6,0),
id_melodie NUMBER (6,0),
PRIMARY KEY (id_soundtrack, id_melodie),
CONSTRAINT FK_cs_cont FOREIGN KEY (id_soundtrack)
REFERENCES COLOANA_SONORA(id_soundtrack) on delete set null,
CONSTRAINT FK_cont_mel FOREIGN KEY (id_melodie)
REFERENCES MELODII(id_melodie) on delete set null
);

CREATE TABLE DISTRIBUTIE(
id_film NUMBER (6,0),
id_actor NUMBER (6,0),
PRIMARY KEY (id_film, id_actor),
CONSTRAINT FK_film_dis FOREIGN KEY (id_film)
REFERENCES FILME(id_film) on delete set null,
CONSTRAINT FK_dis_actr FOREIGN KEY (id_actor)
REFERENCES ACTORI(id_actor) on delete set null
);

INSERT INTO GENURI
values (1, 'Actiune');
INSERT INTO GENURI
values (2, 'Animatie');
INSERT INTO GENURI
values (3, 'Comedie');
INSERT INTO GENURI
values (4, 'Drama');
INSERT INTO GENURI
values (5, 'Horror');
INSERT INTO GENURI
values (6, 'Thriller');
INSERT INTO GENURI
values (7, 'Science Fiction');
INSERT INTO GENURI
values (8, 'Documentar');
INSERT INTO GENURI
values (9, 'Musical');
INSERT INTO GENURI
values (10, 'Aventura');

INSERT INTO PREMII
values (1, 'Cel mai bun film', TO_DATE('10/02/2020', 'DD/MM/YYYY'), 3); --parasite
INSERT INTO PREMII
values (2, 'Cele mai bune costume', TO_DATE('10/02/2020', 'DD/MM/YYYY'), 6);--little women
INSERT INTO PREMII
values (3, 'Cel mai bun machiaj', TO_DATE('10/02/2020', 'DD/MM/YYYY'), 10);--bombshell
INSERT INTO PREMII
values (4, 'Cel mai bun scenariu original', TO_DATE('10/02/2020', 'DD/MM/YYYY'), 3);--parasite
INSERT INTO PREMII
values (5, 'Cea mai bun? coloana sonora', TO_DATE('10/02/2020', 'DD/MM/YYYY'), 7);--1917
INSERT INTO PREMII
values (6, 'Cele mai bune efecte vizuale', TO_DATE('10/02/2020', 'DD/MM/YYYY'), 7);--1917
INSERT INTO PREMII
values (7, 'Cel mai bun scenariu adaptat', TO_DATE('10/02/2020', 'DD/MM/YYYY'), 5);--jojo rabbit
INSERT INTO PREMII
values (8, 'Cel mai bun montaj', TO_DATE('10/02/2020', 'DD/MM/YYYY'), 7);--1917
INSERT INTO PREMII
values (9, 'Cea mai bun? melodie original?', TO_DATE('10/02/2020', 'DD/MM/YYYY'),8);--rocket man
INSERT INTO PREMII
values (10, 'Cel mai bun film de anima?ie', TO_DATE('10/02/2020', 'DD/MM/YYYY'), 4);--toy story 4
INSERT INTO PREMII
values (11, 'Cea mai buna productie', TO_DATE('25/02/2019', 'DD/MM/YYYY'), 2);--black panther

INSERT INTO DIRECTORI_DE_FILM
values(1,'Coogler', 'Ryan');
INSERT INTO DIRECTORI_DE_FILM
values(2,'Bong', 'Joon-ho');
INSERT INTO DIRECTORI_DE_FILM
values(3,'Cooley', 'Josh');
INSERT INTO DIRECTORI_DE_FILM
values(4,'Waititi', 'Taika');
INSERT INTO DIRECTORI_DE_FILM
values(5,'Gerwig', 'Greta');
 INSERT INTO DIRECTORI_DE_FILM
values(6,'Reichert', 'Julia');
INSERT INTO DIRECTORI_DE_FILM
values(7,'Mendes', 'Sam');
 INSERT INTO DIRECTORI_DE_FILM
values(8,'Roach', 'Jay');
INSERT INTO DIRECTORI_DE_FILM
values(9,'Fletcher', 'Dexter');
INSERT INTO DIRECTORI_DE_FILM
values(10,'Columbus', 'Chris');

INSERT INTO ACTORI
values(1,'Radcliffe', 'Daniel');
INSERT INTO ACTORI
values(2,'Boseman', 'Chadwick');
INSERT INTO ACTORI
values(3,'Song', 'Kang-ho ');
INSERT INTO ACTORI
values(4,'Rupert', 'Grint');
INSERT INTO ACTORI
values(5,'Hanks', 'Tom');
INSERT INTO ACTORI
values(6,'Johansson', 'Scarlett');
INSERT INTO ACTORI
values(7,'Watson', 'Emma');
INSERT INTO ACTORI
values(8,'Chalamet', 'Timothée');
INSERT INTO ACTORI
values(9,'Allen', 'Robert');
INSERT INTO ACTORI
values(10,'MacKay', 'George');
INSERT INTO ACTORI
values(11,'Margot', 'Robbie');
INSERT INTO ACTORI
values(12,'Madden', 'Richard');
INSERT INTO ACTORI
values(13,'Carrel', 'Steve');

INSERT INTO COLOANA_SONORA
values(1,'Black Panther (soundtrack)');
INSERT INTO COLOANA_SONORA
values(2,'Parasite (Soundtrack)');
INSERT INTO COLOANA_SONORA
values(3,'Toy Story 4 (Original Motion Picture Soundtrack)');
INSERT INTO COLOANA_SONORA
values(4,'Jojo Rabbit (Original Score)');
INSERT INTO COLOANA_SONORA
values(5,'Little Women - Album');
INSERT INTO COLOANA_SONORA
values(6,'1917 (Original Motion Picture Soundtrack)');
INSERT INTO COLOANA_SONORA
values(7,'Rocketman (Music From The Motion Picture)');
INSERT INTO COLOANA_SONORA
values(8,'Complete Harry Potter Soundtrack');

INSERT INTO MELODII
values(1,'Pray For Me', '3:27', 'RAP', 'The Weeknd, Kendrick Lamar');
INSERT INTO MELODII
values(2,'All The Stars', '3:52', 'RAP', 'Kendrick Lamar, SZA');
INSERT INTO MELODII
values(3,'Zappaguri', '5:01', 'Orechestra', 'Jung Jaeil');
INSERT INTO MELODII
values(4,'You`ve Got a Friend', '2:08', NULL, 'Randy Newman');
INSERT INTO MELODII
values(5,'I Can`t Let You', '2:09', NULL, 'Randy Newman');
INSERT INTO MELODII
values(6,'Everybody Gotta Live', '3:24', NULL, 'Various Artists');
INSERT INTO MELODII
values(7,'Little Women', '3:13', NULL, 'Alexandre Desplat');
INSERT INTO MELODII
values(8,'The Night Window', '3:43', NULL, 'Thomas Newman');
INSERT INTO MELODII
values(9,'All Your Loving ', '3:33', NULL, 'Taron Egerton');
INSERT INTO MELODII
values(10,'Rocket Man', '3:11', NULL, 'Taron Egerton');

INSERT INTO FILME
values(1,'Harry Potter the Sorcerer`s Stone', TO_DATE('25/02/2019', 'DD/MM/YYYY'), '2h 32min', 8, 10, 8);
INSERT INTO FILME
values(2,'Black Panther', TO_DATE('29/01/2018', 'DD/MM/YYYY'), '2h 14min', 7, 1, 1);
INSERT INTO FILME
values(3,'Parasite', TO_DATE('21/05/2019', 'DD/MM/YYYY'), '2h 12min', 9, 2, 2);
INSERT INTO FILME
values(4,'Toy Story 4', TO_DATE('11/06/2019', 'DD/MM/YYYY'), '1h 40min', 8, 3, 3);
INSERT INTO FILME
values(5,'Jojo Rabbit', TO_DATE('08/09/2019', 'DD/MM/YYYY'), '1h 48min', 8, 4, 4);
INSERT INTO FILME
values(6,'Little Women', TO_DATE('07/12/2019', 'DD/MM/YYYY'), '2h 15min', 8, 5, 5);
INSERT INTO FILME
values(7,'1917', TO_DATE('04/12/2019', 'DD/MM/YYYY'), '1h 59min', 8, 7, 6);
INSERT INTO FILME
values(8,'Rocketman', TO_DATE('16/05/2019', 'DD/MM/YYYY'), '2h 2min', 7, 9, 7);
INSERT INTO FILME
values(9,'American Factory', TO_DATE('25/01/2019', 'DD/MM/YYYY'), '1h 50min', 7, 6, 6);
INSERT INTO FILME
values(10,'Bombshell', TO_DATE('13/12/2019', 'DD/MM/YYYY'), '1h 49min', 7, 8, 6);

INSERT INTO JOBS
values(1,'Presedinte', 5000, 6000);
INSERT INTO JOBS
values(2,'Finance Manager', 3000, 3200);
INSERT INTO JOBS
values(3,'Stock Manager', 2900, 3100);
INSERT INTO JOBS
values(4,'Programmer', 4000, 4100);
INSERT INTO JOBS
values(5,'Shipping Clerk', 2200, 2400);
INSERT INTO JOBS
values(6,'Sales Rep', 3000, 3100);
INSERT INTO JOBS
values(7,'Store Manager', 2400, 2600);
INSERT INTO JOBS
values(8,'Intern', 1800, 1900);


INSERT INTO ANGAJATI
values(1,'Lazar', 'Stefania', 'lazarstefania63@yahoo.com', '0762938000', TO_DATE('01/11/2018', 'DD/MM/YYYY'), 5900, 1);
INSERT INTO ANGAJATI
values(2,'Oprea', 'Iulian', 'op_iulian_3@yahoo.com', '0762345234', TO_DATE('15/11/2018', 'DD/MM/YYYY'), 4100, 4);
INSERT INTO ANGAJATI
values(3,'Popescu', 'Catalin', 'cata_popescu@gmail.com', '0743546278', TO_DATE('15/12/2018', 'DD/MM/YYYY'), 3100, 2);
INSERT INTO ANGAJATI
values(4,'Stoicescu', 'Adrian', 'stoi_adi@yahoo.com', '0765234433', TO_DATE('15/12/2018', 'DD/MM/YYYY'), 3000, 3);
INSERT INTO ANGAJATI
values(5,'Aron', 'Ana-Maria', 'am_aaron@yahoo,com', '0743564766', TO_DATE('13/02/2019', 'DD/MM/YYYY'), 2500, 7);
INSERT INTO ANGAJATI
values(6,'Miron', 'Maria', NULL, NULL, TO_DATE('15/12/2018', 'DD/MM/YYYY'), 2950, 1, 4);
INSERT INTO ANGAJATI
values(7,'Protopopescu', 'Mihai', 'm_prtpop@gmail.com', '0743437812', TO_DATE('14/07/2019', 'DD/MM/YYYY'), 3000, 2, 3);
INSERT INTO ANGAJATI
values(8,'Georgescu', 'Vlad', NULL, NULL, TO_DATE('03/04/2018', 'DD/MM/YYYY'), 3900, 4, 4);

select * 
from jobs;

select * from angajati;

INSERT INTO CLIENTI
values(1,'Lazar', 'Elena', 'elenarazal95@yahoo.com', '0762336337');
INSERT INTO CLIENTI
values(2,'Oprea', 'Ana', 'ana_op69@yahoo.com', '0763369469');
INSERT INTO CLIENTI
values(3,'Chirila', 'Anton', 'cc_anton@yahoo.com', '0762238980');
INSERT INTO CLIENTI
values(4,'Grigoriu', 'Mihai', 'ggmihai@yahoo.com', '0742546787');
INSERT INTO CLIENTI
values(5,'Vasile', 'Teodora', 'teoteov@gmail.com', '0765982738');

INSERT INTO ADRESE
values(1,'Bucuresti', 'Aleea Cenuseresei');
INSERT INTO ADRESE
values(2,'Bistrita', 'Strada Însorit?');
INSERT INTO ADRESE
values(3,'Cluj', 'Strada Laterala');
INSERT INTO ADRESE
values(4,'Pitesti', 'Strada Garlei');
INSERT INTO ADRESE
values(5,'Vama Veche', 'Strada Plajei');

INSERT INTO MAGAZINE
values(1,'4Evermore Pitesti','4e_pit@ee.ro', '0762748590', 4);
INSERT INTO MAGAZINE
values(2,'4Evermore Bucuresti','4e_buc@ee.ro', '0765786434', 1);
INSERT INTO MAGAZINE
values(3,'4Evermore Vama Veche','4e_vv@ee.ro', '0764786589', 5);
INSERT INTO MAGAZINE
values(4,'4Evermore Cluj','4e_clj@ee.ro', '0745375868', 3);
INSERT INTO MAGAZINE
values(5,'4Evermore Bistrita','4e_bis@ee.ro', '0746574885', 2);

INSERT INTO CONTINE
values(1,1);
INSERT INTO CONTINE
values(1,2);
INSERT INTO CONTINE
values(2,3);
INSERT INTO CONTINE
values(3,4);
INSERT INTO CONTINE
values(3,5);
INSERT INTO CONTINE
values(4,6);
INSERT INTO CONTINE
values(5,7);
INSERT INTO CONTINE
values(6,8);
INSERT INTO CONTINE
values(7,9);
INSERT INTO CONTINE
values(7,10);

INSERT INTO APARTINE
values(1,4);
INSERT INTO APARTINE
values(1,6);
INSERT INTO APARTINE
values(1,7);
INSERT INTO APARTINE
values(1,10);
INSERT INTO APARTINE
values(2,1);
INSERT INTO APARTINE
values(2,7);
INSERT INTO APARTINE
values(3,6);
INSERT INTO APARTINE
values(4,2);
INSERT INTO APARTINE
values(5,3);
INSERT INTO APARTINE
values(5,4);
INSERT INTO APARTINE
values(6,3);
INSERT INTO APARTINE
values(6,4);
INSERT INTO APARTINE
values(7,1);
INSERT INTO APARTINE
values(7,4);
INSERT INTO APARTINE
values(8,9);
INSERT INTO APARTINE
values(9,8);
INSERT INTO APARTINE
values(10,4);

INSERT INTO DISTRIBUTIE
values(1,1);
INSERT INTO DISTRIBUTIE
values(1,4);
INSERT INTO DISTRIBUTIE
values(1,7);
INSERT INTO DISTRIBUTIE
values(2,2);
INSERT INTO DISTRIBUTIE
values(3,3);
INSERT INTO DISTRIBUTIE
values(4,5);
INSERT INTO DISTRIBUTIE
values(5,6);
INSERT INTO DISTRIBUTIE
values(6,7);
INSERT INTO DISTRIBUTIE
values(6,8);
INSERT INTO DISTRIBUTIE
values(7,9);
INSERT INTO DISTRIBUTIE
values(8,12);
INSERT INTO DISTRIBUTIE
values(9,10);
INSERT INTO DISTRIBUTIE
values(10,11);

INSERT INTO INCHIRIERE
values(1,1,5, TO_DATE('23/03/2020', 'DD/MM/YYYY'));
INSERT INTO INCHIRIERE
values(2,2,4, TO_DATE('16/04/2019', 'DD/MM/YYYY'));
INSERT INTO INCHIRIERE
values(3,3,3, TO_DATE('27/03/2021', 'DD/MM/YYYY'));
INSERT INTO INCHIRIERE
values(4,4,2, TO_DATE('12/07/2020', 'DD/MM/YYYY'));
INSERT INTO INCHIRIERE
values(5,5,1, TO_DATE('11/05/2020', 'DD/MM/YYYY'));
INSERT INTO INCHIRIERE
values(6,1,2, TO_DATE('17/12/2020', 'DD/MM/YYYY'));
INSERT INTO INCHIRIERE
values(7,2,4, TO_DATE('15/08/2019', 'DD/MM/YYYY'));
INSERT INTO INCHIRIERE
values(8,3,5, TO_DATE('05/08/2019', 'DD/MM/YYYY'));
INSERT INTO INCHIRIERE
values(9,4,3, TO_DATE('13/02/2019', 'DD/MM/YYYY'));
INSERT INTO INCHIRIERE
values(10,5,1, TO_DATE('20/03/2021', 'DD/MM/YYYY'));
INSERT INTO INCHIRIERE
values(1,3,3, TO_DATE('17/11/2019', 'DD/MM/YYYY'));

--1
--Sa se afiseze numele filmelor inchiriate din orasul Pitesti si data de inchiriere a acestora,ordonate in functie de data aparitii filmului.
--Stiind ca clientii trebuie sa returneze filmele in o luna, afisati aceasta data, si cate zile au trecut de cand au inchiriat filmul.
select f.nume_film, i.data_inchiriere, ADD_MONTHS(i.data_inchiriere,1) as data_expirare,
TO_DATE(CURRENT_DATE, 'DD/MM/YYYY') - TO_DATE(i.data_inchiriere,'DD/MM/YYYY') as zile_trecute
--preluam numele filmului si data de inchiriere, iar cu functia ADD_MONTHS adaugam 1 luna pentru a afla data de returnare a filmului.
--scadem datele calendaristice pentru a afla numarul de zile ce a trecut de cand s-a inchiriat filmul.
from inchiriere i, filme f, magazine m, clienti c, adrese a
where i.id_film=f.id_film --join-ul se face prin atributele id_film , id_magazin si id_client.
and i.id_magazin=m.id_magazin
and m.id_adresa=a.id_adresa --adresa trebuie sa fie a magazinului pe care il dorim noi
and i.id_client=c.id_client
and INITCAP(a.oras) = 'Pite?ti' 
--functia INITCAP corecteaza numele orasului in caz ca nu e scris cu majuscula ,iar orasul trebuie sa fie Pite?ti
order by f.data_lansarii; --ordonam dupa data lansarii


--2. Sa se afiseze numele filmelor 
-- care au 2 melodii in coloana sonora.
select f.nume_film,
DECODE (TO_CHAR(data_lansarii,'MM'),
      '01', 'Ianuarie',
      '02', 'Februarie',
      '03', 'Martie',
      '04', 'Aprilie',
      '05', 'Mai',
      '06', 'Iunie',
      '07', 'Iulie',
      '08', 'August',
      '09', 'Septembrie',
      '10', 'Octombrie',
      '11', 'Noiembrie',
      '12', 'Decembrie',
      0)
      as "Luna aparitiei" --luna aparitiei
from filme f
where (f.nume_film,2) IN   (select f.nume_film, count(*)
                        from coloana_sonora st, contine cn, melodii mel
                        where f.id_soundtrack = st.id_soundtrack
                        and st.id_soundtrack = cn.id_soundtrack
                        and cn.id_melodie = mel.id_melodie
                        group by f.nume_film, st.id_soundtrack
                        );
--3. Sa se afiseze numele(numele in majuscule, prenumele in minuscule) 
--si salariul tuturor angajatilor al caror salariu este mai mic
--decat media salariilor din Cluj.
select UPPER(a0.nume_angajat) as nume, LOWER(a0.prenume_angajat) as prenume, a0.salariu
from angajati a0
where a0.salariu < (SELECT AVG(a.salariu)
                  FROM jobs j, angajati a, magazine m, adrese adr
                  WHERE j.id_job = a.id_job and a.id_magazin=m.id_magazin 
                  and m.id_adresa=adr.id_adresa and adr.oras = 'Cluj');



--4. Sa se afiseze coloanele sonore si melodiile ce fac parte din ea, 
--genul muzical al melodiei, iar daca acesta este null se va afisa
--mesajul "Gen muzical necunoscut"
--si o coloana ce afiseaza numele melodiei impreuna cu id-ul acesteia.
select st.nume_soundtrack, mel.nume_melodie, 
NVL(mel.gen_muzical, 'Melodia nu are gen muzical') as gen_muzical,
CASE mel.id_melodie
    WHEN 1 THEN CONCAT(mel.nume_melodie,' are id-ul 1')
    WHEN 2 THEN CONCAT(mel.nume_melodie,' are id-ul 2')
    WHEN 3 THEN CONCAT(mel.nume_melodie,' are id-ul 3')
    WHEN 4 THEN CONCAT(mel.nume_melodie,' are id-ul 4')
    WHEN 5 THEN CONCAT(mel.nume_melodie,' are id-ul 5')
    WHEN 6 THEN CONCAT(mel.nume_melodie,' are id-ul 6')
    WHEN 7 THEN CONCAT(mel.nume_melodie,' are id-ul 7')
    WHEN 8 THEN CONCAT(mel.nume_melodie,' are id-ul 8')
    WHEN 9 THEN CONCAT(mel.nume_melodie,' are id-ul 9')
    WHEN 10 THEN CONCAT(mel.nume_melodie,' are id-ul 10')
    ELSE mel.nume_melodie
    END
    as "nume_melodie_cu_id"
from coloana_sonora st, melodii mel, contine con
where st.id_soundtrack = con.id_soundtrack
and con.id_melodie = mel.id_melodie;
--functia NVL returneaza gen_muzical daca acesta e diferit de NULL si mesajul daca genul muzical este null.

--5. Sa se afiseze diferenta dintre cel mai mare si cel mai mic salariu pentru joburile care au litera O 
--si cati angajati au in prezent acel job.
WITH val_dep AS (
                  select j.nume_job, max(a.salariu) - min(a.salariu) as diferenta, count(*) as nr_angajati
                  from angajati a, jobs j
                  where a.id_job = j.id_job
                  group by a.id_job, j.nume_job )
SELECT * 
FROM val_dep
where UPPER(val_dep.nume_job) LIKE ('%O%');


--12
UPDATE ANGAJATI
SET id_job=NULL
WHERE id_angajat=7;

UPDATE FILME
SET id_soundtrack=NULL
WHERE id_film=10;

UPDATE MAGAZINE
SET ID_ADRESA=NULL
WHERE id_magazin=3;



--13
CREATE SEQUENCE CLIENTI_SQ
START WITH     10
INCREMENT BY   1;

INSERT INTO CLIENTI values (CLIENTI_SQ.nextval, 'Stoica', 'Alexandru', 'st_aalex@yahoo.com', '0763475869');
INSERT INTO CLIENTI values (CLIENTI_SQ.nextval, 'Dumitrescu', 'Andrei', 'dumandr@gmail.com', '0745672389');
INSERT INTO CLIENTI values (CLIENTI_SQ.nextval, 'Dumi', 'Andr', 'dumandr@gmail.com', '0745672389');

select *
from clienti;

ALTER TABLE MAGAZINE
MODIFY ID_ADRESA NULL;

--16
-- outer join
--Sa se afiseze joburile angajatilor care lucreaza 
--in orasele din baza de date.

select a.oras, j.nume_job
from adrese a
LEFT OUTER JOIN magazine m ON a.id_adresa = m.id_adresa
LEFT OUTER JOIN angajati ang ON m.id_magazin = ang.id_magazin
LEFT OUTER JOIN jobs j ON ang.id_job = j.id_job;


