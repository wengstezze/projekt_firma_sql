#Aby zrealizować projekt, njapierw musimy utworzyć bazę danych o danej nazwie, jaką sobie ustalimy.
#W moim przypadku jest to nazwa projekt_firma. W drugim poleceniu wybraliśmy utworzoną bazę, aby na niej pracować:

CREATE DATABASE projekt_firma;
USE projekt_firma;


#(1)Utworzyć dwie tabele: pracownicy, wydzialy (CREATE):

CREATE TABLE pracownicy
(
	id_prac 	INT 		PRIMARY KEY NOT NULL, 
	imie_i_nazw VARCHAR(30) 			NOT NULL, 
	d_ur 		DATE 					NOT NULL, 
	numer_wydz 	INT						NOT NULL
);

CREATE TABLE wydzialy
(
	numer_wydz 	INT 		PRIMARY KEY NOT NULL, 
	nazwa_wydz 	VARCHAR(20)     		NOT NULL
);


#(2)Wstawić dane do tabel (INSERT):

INSERT INTO pracownicy(id_prac, imie_i_nazw, d_ur, numer_wydz)
VALUES (7513, 'Ewa Nowacka', 	  STR_TO_DATE('1967-05-02', '%Y-%m-%d'), 128);

INSERT INTO pracownicy(id_prac, imie_i_nazw, d_ur, numer_wydz)
VALUES (9842, 'Bartosz Kowalski', STR_TO_DATE('1957-09-15', '%Y-%m-%d'), 128);

INSERT INTO pracownicy(id_prac, imie_i_nazw, d_ur, numer_wydz)
VALUES (6651, 'Andrzej Plater',   STR_TO_DATE('1978-12-22', '%Y-%m-%d'), 128);

INSERT INTO pracownicy(id_prac, imie_i_nazw, d_ur, numer_wydz)
VALUES (9006, 'Barbara Cetryk',   STR_TO_DATE('1963-09-19', '%Y-%m-%d'), 128);


#(3)Sprawdzić prawidłowość utworzenia tabel i wpisania danych (SELECT *):

SELECT * FROM pracownicy ORDER BY imie_i_nazw;
SELECT * FROM wydzialy;


#uwaga: kwerendy (4)-(7) dotyczą danych tylko z jednej tabeli

#(4)Utworzyć kwerendę wyświetlającą pracowników urodzonych pomiędzy 1960-01-01 a 1970-01-01:

SELECT pracownicy.imie_i_nazw, pracownicy.d_ur FROM pracownicy
WHERE pracownicy.d_ur >= '1960-01-01' and pracownicy.d_ur <= '1970-01-01';


#(5)Utworzyć kwerendę zliczającą wszystkich pracowników (należy użyć funkcji COUNT):

SELECT COUNT(*) ilosc_pracownikow
FROM pracownicy;


#(6)Utworzyć kwerendę zliczającą pracowników dla każdego numeru wydziału (należy użyć funkcji COUNT i komendy GROUP BY):

SELECT pracownicy.numer_wydz
COUNT(*) ilosc_pracownikow
FROM pracownicy
GROUP BY pracownicy.numer_wydz;
