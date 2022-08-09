/* Database schema to keep the structure of entire database. */

-- CREATE TABLE - DAY 1

DROP TABLE animals;

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
