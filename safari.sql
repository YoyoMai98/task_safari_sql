DROP TABLE assignments;
DROP TABLE animals;
DROP TABLE enclosures;
DROP TABLE staff;

CREATE TABLE staff(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber INT
);

CREATE TABLE enclosures(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);

CREATE TABLE assignments(
    id SERIAL PRIMARY KEY,
    employeeId INT REFERENCES staff(id),
    enclosureId INT REFERENCES enclosures(id),
    day VARCHAR(255)
);
-- populate with data
--STAFF
INSERT INTO staff (name, employeeNumber) VALUES ('Yongran', 1);
INSERT INTO staff (name, employeeNumber) VALUES ('Hanqing', 2);
--ENCLOSURES
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Parrots', 5, false);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Giraffes', 2, true);
--ANIMALS
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Melvin', 'Giraffe', 4, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Rachel', 'Giraffe', 4, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Polly', 'Parrot', 1, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Jenny', 'Parrot', 3, 1);
--ASSIGNMENTS
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (1, 1, 'Friday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (2, 2, 'Friday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (1, 2, 'Wednesday');


-- The names of the animals in a given enclosure
SELECT animals.name, enclosures.name
FROM animals
INNER JOIN enclosures
ON animals.enclosure_id = enclosures.id;

-- The names of the staff working in a given enclosure
SELECT staff.name, enclosures.name
FROM staff
INNER JOIN assignments
ON staff.id = assignments.employeeid
INNER JOIN enclosures
ON assignments.enclosureid = enclosures.id;

-- The names of staff working in enclosures which are closed for maintenance
SELECT staff.name, enclosures.name
FROM staff
INNER JOIN assignments
ON staff.id = assignments.employeeid
INNER JOIN enclosures
ON assignments.enclosureId = enclosures.id
WHERE enclosures.closedformaintenance = true;

-- The name of the enclosure where the oldest animal lives, if same age choose 
-- first one alphabetically
SELECT enclosures.name
FROM animals
INNER JOIN enclosures
ON animals.enclosure_id = enclosures.id
ORDER BY animals.age DESC, animals.name 
LIMIT 1
; 

-- The number of different animal types a given keeper (Yongran) has been assigned to work with.
SELECT COUNT(DISTINCT animals.type)
FROM staff
INNER JOIN assignments
ON staff.id = assignments.employeeid
INNER JOIN enclosures
ON assignments.enclosureId = enclosures.id
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
WHERE staff.name = 'Yongran';

-- The number of different keepers who have been assigned to work in a given enclosure
SELECT COUNT(DISTINCT employeeId)
FROM assignments
WHERE enclosureId = 2;