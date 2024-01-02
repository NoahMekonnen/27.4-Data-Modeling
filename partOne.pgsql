DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY, 
    doctor_name TEXT NOT NUll
);

CREATE TABLE patients(
    id SERIAL PRIMARY KEY,
    patient_name TEXT NOT NUll
);

CREATE TABLE diseases(
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL,
    patient_id INTEGER NOT NULL REFERENCES patients 
);

CREATE TABLE visits(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES doctors,
    patient_id INTEGER NOT NULL REFERENCES patients,
    disease_id INTEGER NOT NULL REFERENCES diseases
);

INSERT INTO doctors
(doctor_name)
VALUES
('St.John of the Cross');

INSERT INTO patients
(patient_name)
VALUES
('Me');

INSERT INTO diseases
(disease_name,patient_id)
VALUES
('original sin', 1),
('sin', 1);

INSERT INTO visits
(doctor_id, patient_id, disease_id)
VALUES
(1, 1, 1),
(1, 1, 2);

