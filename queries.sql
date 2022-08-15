/*Queries that provide answers to the questions FROM all projects.*/

-- FILTERS - DAY 1

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN 'January 1, 2016' AND 'January 1, 2019';
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- -- aggregate and GROYP BY - DAY 2

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

-- QUESTIONS RELATED TO OWNERS ANS SPECIES - DAY 3

SELECT full_name, name FROM owners o
LEFT JOIN animals a
  ON o.id = a.owner_id
WHERE owner_id = 4;

SELECT species.name, animals.name FROM species
LEFT JOIN animals
  ON species.id = animals.species_id
WHERE animals.species_id = 1;

SELECT full_name, name FROM owners o
LEFT JOIN animals a
  ON o.id = a.owner_id
ORDER BY full_name;

SELECT species.name, COUNT(animals.name) FROM species
LEFT JOIN animals
  ON species.id = animals.species_id
GROUP BY species.name;

SELECT o.full_name, s.name, a.name FROM animals a
INNER JOIN owners o
  ON o.id = a.owner_id
INNER JOIN species s
  ON s.id = a.species_id
WHERE owner_id = 2 AND species_id = 2;

SELECT full_name, name FROM owners o
LEFT JOIN animals a
  ON o.id = a.owner_id
WHERE owner_id = 5 AND escape_attempts = 0;

SELECT full_name, COUNT(name) FROM owners o
LEFT JOIN animals a
  ON a.owner_id = o.id
GROUP BY full_name;

-- QUESTIONS RELATED TO VISITS AND VETS - DAY 4

SELECT v.name as vet, a.name as animal, vis.date_of_visit FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE vis.date_of_visit = (select max(date_of_visit) FROM visits WHERE vets_id=1) 
ORDER BY vis.date_of_visit desc;

SELECT count(a.name) FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE v.name = 'Stephanie Mendez';

SELECT v.name, s.name FROM specializations sp
INNER JOIN species s
  ON s.id = sp.species_id
RIGHT JOIN vets v
  ON v.id = sp.vets_id;

SELECT v.name, a.name, vis.date_of_visit FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE v.name = 'Stephanie Mendez' and date_of_visit BETWEEN 'April 1, 2020' and 'August 30, 2020';

SELECT a.name, count(a.name) FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
GROUP BY a.name
ORDER BY count desc
LIMIT 1;

SELECT v.name, a.name, date_of_visit FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE date_of_visit = (select min(date_of_visit) FROM visits WHERE vets_id = 2)
ORDER BY date_of_visit;

SELECT a.name, v.name, date_of_visit  FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE date_of_visit = (select max(date_of_visit) FROM visits);


SELECT v.name, count(a.name) FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
WHERE v.id not in (select vets_id FROM specializations)
GROUP BY v.name;


SELECT v.name, s.name, count(a.species_id) FROM visits vis
INNER JOIN animals a
  ON a.id = vis.animals_id
INNER JOIN vets v
  ON v.id = vis.vets_id
INNER JOIN species s
  ON s.id = a.species_id
WHERE v.name = 'Maisy Smith'
GROUP BY (v.name, s.name)
ORDER BY count desc
LIMIT 1;

--week 2
-- query plans 

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';



