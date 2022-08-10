/* Database schema to keep the structure of entire database. */

-- CREATE TABLE - DAY 1

DROP TABLE IF EXISTS animals;

CREATE TABLE animals (
    id serial PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal
);

-- UPDATE TABLE WITH NEW COLUMN - DAY 2

ALTER TABLE animals
  ADD species varchar(100);


-- CREATE TABLES OWNERS, SPECIES AND ADD FOREIGN KEY TO ANIMALS TABLE TO CONNETC WITH OWNERS AND SPECIES TABLE -DAY 3

DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
  id serial PRIMARY KEY,
  full_name varchar(100),
  age int
);

DROP TABLE IF EXISTS species;

CREATE TABLE species (
  id serial PRIMARY KEY,
  name varchar(100)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
  ADD species_id int;

ALTER TABLE animals
  ADD FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE animals
  ADD owner_id int;

ALTER TABLE animals
  ADD FOREIGN KEY (owner_id) REFERENCES owners (id) ON DELETE CASCADE ON UPDATE CASCADE;
  