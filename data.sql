/* Populate database with sample data. */

-- INSERT RAWS WITH ID PRIMARY KEY WITH GIVEN SEQUENCE - DAY 1

DELETE FROM animals;

DROP SEQUENCE animals_seq;

CREATE SEQUENCE animals_seq
  START 1
  INCREMENT 1;

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Agumon', 'February 3, 2020', 0, TRUE, 10.23),
  (nextval('animals_seq'), 'Gabumon', 'November 15, 2018', 2, TRUE, 8),
  (nextval('animals_seq'), 'Pikachu', 'January 7, 2021', 1, FALSE, 15.04),
  (nextval('animals_seq'), 'Devimon', 'May 12, 2017', 5, TRUE, 11);

-- UPDATE AND DELETE RECORDS - INSTERT MORE RAWS AND UPDATE VALUE FOR ANIMALS TYPE - DAY 2 

INSERT INTO animals 
VALUES (nextval('animals_seq'), 'Charmander', 'February 8, 2020', 0, TRUE, 11),
  (nextval('animals_seq'), 'Plantmon', 'November 15, 2021', 2, TRUE, 5.7),
  (nextval('animals_seq'), 'Squirtle', 'April 2, 1993', 3, TRUE, 12.13),
  (nextval('animals_seq'), 'Angemon', 'June 12, 2005', 1, FALSE, 45),
  (nextval('animals_seq'), 'Boarmon', 'June 7, 2005', 7, TRUE, 20.4),
  (nextval('animals_seq'), 'Blossom', 'October 13, 1998', 3, TRUE, 17),
  (nextval('animals_seq'), 'Ditto', 'May 14, 2022', 4, TRUE, 22);


-- UPDATE animals SET species = 'unspecified';

-- UPDATE animals SET species = 'digimon'
-- WHERE name like '%mon';

-- UPDATE animals SET species = 'pokemon'
-- WHERE species = 'unspecified';

BEGIN;
SAVEPOINT first_savepoint;
DELETE FROM animals;
ROLLBACK TO SAVEPOINT first_savepoint;
COMMIT;

DELETE FROM animals
WHERE date_of_birth > 'January 1, 2022';


BEGIN;
SAVEPOINT second_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT second_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

-- ADD DATA TO OWNER AND SPECIES TABLES - DAY 3

DELETE FROM owners;

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

DELETE FROM species;

INSERT INTO species (name)
VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = 2
WHERE name like '%mon';

UPDATE animals SET species_id = 1
WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1
where name = 'Agumon';

UPDATE animals SET owner_id = 2
where name IN ('Gabumon', 'Pikachu');

update animals SET owner_id = 3
where name in ('Devimon', 'Plantmon');

update animals SET owner_id = 4
where name in ('Charmander', 'Squirtle', 'Blossom');

update animals SET owner_id = 5
where name in ('Angemon', 'Boarmon');