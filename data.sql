/* Populate database with sample data. */

-- INSERT RAWS WITH ID PRIMARY KEY WITH GIVEN SEQUENCE - DAY 1

DELETE FROM animals;

DROP SEQUENCE animals_seq;

CREATE SEQUENCE animals_seq
  START 1
  INCREMENT 1;

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Agumon', 'February 3, 2020', 0, TRUE, 10.23);

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Gabumon', 'November 15, 2018', 2, TRUE, 8);

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Pikachu', 'January 7, 2021', 1, FALSE, 15.04);

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Devimon', 'May 12, 2017', 5, TRUE, 11);

-- UPDATE AND DELETE RECORDS - INSTERT MORE RAWS AND UPDATE VALUE FOR ANIMALS TYPE - DAY 2 


INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Charmander', 'February 8, 2020', 0, TRUE, 11);

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Plantmon', 'November 15, 2021', 2, TRUE, 5.7);

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Squirtle', 'April 2, 1993', 3, TRUE, 12.13);

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Angemon', 'June 12, 2005', 1, FALSE, 45);

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Boarmon', 'June 7, 2005', 7, TRUE, 20.4);

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Blossom', 'October 13, 1998', 3, TRUE, 17);

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Ditto', 'May 14, 2022', 4, TRUE, 22);


UPDATE animals SET species = 'unspecified';

UPDATE animals SET species = 'digimon'
WHERE name like '%mon';

UPDATE animals SET species = 'pokemon'
WHERE species = 'unspecified';

DELETE FROM animals
WHERE date_of_birth > 'January 1, 2022';


BEGIN;
SAVEPOINT first_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT first_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
