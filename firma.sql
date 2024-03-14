#Aby zrealizować projekt, najpierw musimy utworzyć bazę danych o danej nazwie, jaką sobie ustalimy.
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
VALUES (9842, 'Bartosz Kowalski', STR_TO_DATE('1957-09-15', '%Y-%m-%d'), 42);

INSERT INTO pracownicy(id_prac, imie_i_nazw, d_ur, numer_wydz)
VALUES (6651, 'Andrzej Plater',   STR_TO_DATE('1978-12-22', '%Y-%m-%d'), 128);

INSERT INTO pracownicy(id_prac, imie_i_nazw, d_ur, numer_wydz)
VALUES (9006, 'Barbara Cetryk',   STR_TO_DATE('1963-09-19', '%Y-%m-%d'), 128);


INSERT INTO wydzialy(numer_wydz, nazwa_wydz)
VALUES (42, 'Finanse');

INSERT INTO wydzialy(numer_wydz, nazwa_wydz)
VALUES (128, 'Badania i Rozw');


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

SELECT pracownicy.numer_wydz,
COUNT(*) ilosc_pracownikow
FROM pracownicy
GROUP BY pracownicy.numer_wydz;


#(7)Utworzyć kwerendę wyświetlającą pracowników z tego samego wydziału co Ewa Nowacka (należy użyć zapytania z podzapytaniem):

SELECT pracownicy.imie_i_nazw, pracownicy.numer_wydz
FROM pracownicy 
WHERE pracownicy.numer_wydz = (SELECT pracownicy.numer_wydz
							   FROM pracownicy
							   WHERE pracownicy.imie_i_nazw = "Ewa Nowacka");


#uwaga: kwerendy (8)-(9) dotyczą danych z dwóch tabel
#(8)Utworzyć kwerendę wyświetlającą wszystkich pracowników wraz z podaniem numeru wydziału i nazwy wydziału (należy
#użyć słowa kluczowego INNER JOIN):

SELECT pracownicy.imie_i_nazw, wydzialy.numer_wydz, wydzialy.nazwa_wydz
FROM pracownicy
INNER JOIN wydzialy ON wydzialy.numer_wydz = pracownicy.numer_wydz;


#(9)Utworzyć kwerendę zliczającą pracowników dla każdej nazwy wydziału (należy użyć funkcji COUNT i komendy GROUP BY):

SELECT wydzialy.nazwa_wydz, 
	   COUNT(pracownicy.id_prac) ilosc_pracownikow
FROM pracownicy
INNER JOIN wydzialy ON wydzialy.numer_wydz = pracownicy.numer_wydz
GROUP BY wydzialy.nazwa_wydz;


#(10)Utworzyć relację jeden do wielu pomiędzy tabelami:

ALTER TABLE pracownicy
ADD CONSTRAINT pracownicy_ref1
FOREIGN KEY (wydzialy)
REFERENCES wydzialy (numer_wydz);


#(11)Pokazać na przykładzie, że relacja działa prawidłowo (np. poprzez próbę dopisania pracownika z niewłaściwym numerem wydziału):

INSERT INTO pracownicy (id_prac, imie_i_nazw, d_ur, numer_wydz) 
VALUES (8525, 'Adam Małysz', STR_TO_DATE('1960-09-19', '%Y-%m-%d'), 12);




