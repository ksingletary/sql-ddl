DROP DATABASE IF EXISTS  medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE MedicalCenter (
    mc_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255)
);

CREATE TABLE Doctor (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    specialty VARCHAR(255),
    mc_id INT REFERENCES MedicalCenter(mc_id)
);

CREATE TABLE Patient (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE
);

CREATE TABLE Disease (
    disease_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Visit (
    visit_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patient(patient_id),
    doctor_id INT REFERENCES Doctor(doctor_id),
    date_of_visit DATE
);

CREATE TABLE Diagnosis (
    diagnosis_id SERIAL PRIMARY KEY,
    visit_id INT REFERENCES Visit(visit_id),
    disease_id INT REFERENCES Disease(disease_id)
);

--Now we Insert data


--Data for MedicalCenter table

INSERT INTO MedicalCenter (name, location)
VALUES
('Howard University Hospital', 'Washington D.C'),
('Baltimore Washington Medical Center', 'MD'),
('East Ohio Medical Complex', 'Ohio');

--Data for Doctor table

INSERT INTO Doctor (name, specialty, mc_id)
VALUES
('Dr. Ali', 'Cardiothoracic Surgeon', 1),
('Dr. Singletary', 'Neurology', 2),
('Dr. Carson', 'Radiology', 3);

--Data for Patients

INSERT INTO Patient (name, date_of_birth)
VALUES
('Peter', '1995-10-12'),
('Quagmire', '1965-05-05'),
('Joe', '1987-10-10');

--Data for Diseases

INSERT INTO Disease (name)
VALUES
('Hypertension'),
('Diabetes'),
('Cancer');

--Data for Visit

INSERT INTO Visit (doctor_id, patient_id, date_of_visit)
VALUES
(1, 1, '2023-09-25'),
(2, 2, '2023-09-30'),
(3, 3, '2023-10-05'),
(1, 3, '2023-10-10');

--Data for Diagnosis

INSERT INTO Diagnosis (visit_id, disease_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1);
