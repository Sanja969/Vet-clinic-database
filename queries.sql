/*Queries that provide answers to the questions from all projects.*/

-- FILTERS - DAY 1

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN 'January 1, 2016' AND 'January 1, 2019';
SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = TRUE;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- aggregate and GROYP BY - DAY 2

SELECT COUNT(name) FROM animals;

SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, SUM(escape_attempts) FROM animals 
GROUP BY neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)  FROM animals 
GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN 'January 1, 1990' AND 'December 31, 2000'
GROUP BY species;