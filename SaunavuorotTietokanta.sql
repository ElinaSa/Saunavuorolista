
CREATE TABLE Saunapaiva (
                Saunapaiva VARCHAR(10) NOT NULL,
                Lisatieto VARCHAR(100) NOT NULL,
                CONSTRAINT Saunapaiva_pk PRIMARY KEY (Saunapaiva)
)

CREATE TABLE Aikataulu (
                Pukuhuone VARCHAR(10) NOT NULL,
                Saunapaiva VARCHAR(10) NOT NULL,
                Kellonaika DATETIME NOT NULL,
                CONSTRAINT Aikataulu_pk PRIMARY KEY (Pukuhuone)
)

CREATE TABLE Asukastiedot (
                Asunto VARCHAR(10) NOT NULL,
                Sukunimi VARCHAR(50),
                Etunimi VARCHAR(30),
                Osoite VARCHAR(30) NOT NULL,
                Puhelinnumero VARCHAR(20),
                Sahkoposti VARCHAR(50),
                CONSTRAINT Asukastiedot_pk PRIMARY KEY (Asunto)
)

CREATE TABLE Saunavuorot (
                VarausID INT NOT NULL,
                Pukuhuone VARCHAR(10) NOT NULL,
                Asunto VARCHAR(10) NOT NULL,
                VarausAlkaa DATETIME NOT NULL,
                VarausPaattyy DATETIME,
                Lisatiedot VARCHAR(250),
                CONSTRAINT Saunavuorot_pk PRIMARY KEY (VarausID)
)

ALTER TABLE Aikataulu ADD CONSTRAINT Saunapaiva_Aikataulu_fk
FOREIGN KEY (Saunapaiva)
REFERENCES Saunapaiva (Saunapaiva)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Saunavuorot ADD CONSTRAINT Aikataulu_Saunavuorot_fk
FOREIGN KEY (Pukuhuone)
REFERENCES Aikataulu (Pukuhuone)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Saunavuorot ADD CONSTRAINT Asukastiedot_Saunavuorot_fk
FOREIGN KEY (Asunto)
REFERENCES Asukastiedot (Asunto)
ON DELETE NO ACTION
ON UPDATE NO ACTION