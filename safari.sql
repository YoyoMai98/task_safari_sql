

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