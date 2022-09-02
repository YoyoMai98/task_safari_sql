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
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Giraffes', 2, false);
--ANIMALS
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Melvin', 'Giraffe', 4, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Rachel', 'Giraffe', 1, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Polly', 'Parrot', 1, 1);
--ASSIGNMENTS
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (1, 1, 'Friday');
INSERT INTO assignments (employeeId, enclosureId, day) VALUES (2, 2, 'Friday');

SELECT * FROM staff;
SELECT * FROM enclosures;
SELECT * FROM animals;
SELECT * FROM assignments;
