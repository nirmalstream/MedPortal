DROP DATABASE IF EXISTS medportal;
CREATE DATABASE medportal;
USE medportal;

CREATE TABLE patient (
    patient_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    blood_type VARCHAR(5),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255),
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(20),
    PRIMARY KEY (patient_id)
);

CREATE TABLE doctor (
    doctor_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    license_number VARCHAR(20) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    PRIMARY KEY (doctor_id),
    UNIQUE KEY (license_number)
);

CREATE TABLE appointment (
    appointment_id INT AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    reason_for_visit VARCHAR(255),
    clinical_notes TEXT,
    PRIMARY KEY (appointment_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id) ON DELETE CASCADE,
    UNIQUE KEY (patient_id, doctor_id, appointment_date)
);

CREATE TABLE medical_record (
    record_id INT AUTO_INCREMENT,
    appointment_id INT NOT NULL,
    visit_date DATETIME NOT NULL,
    chief_complaint VARCHAR(255),
    diagnosis VARCHAR(255),
    treatment_plan TEXT,
    follow_up_required BOOLEAN DEFAULT FALSE,
    follow_up_date DATE,
    PRIMARY KEY (record_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id) ON DELETE CASCADE,
    UNIQUE KEY (appointment_id)
);

CREATE TABLE prescription (
    prescription_id INT AUTO_INCREMENT,
    appointment_id INT NOT NULL,
    patient_id INT NOT NULL,
    medication_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50),
    frequency VARCHAR(50),
    duration VARCHAR(50),
    instructions TEXT,
    prescribed_date DATETIME NOT NULL,
    PRIMARY KEY (prescription_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id) ON DELETE CASCADE
);

CREATE TABLE procedure_record (
    procedure_id INT AUTO_INCREMENT,
    procedure_name VARCHAR(100) NOT NULL,
    procedure_type VARCHAR(50),
    duration_minutes INT,
    outcome VARCHAR(50),
    notes TEXT,
    PRIMARY KEY (procedure_id)
);

CREATE TABLE appointment_procedure (
    appointment_id INT NOT NULL,
    procedure_id INT NOT NULL,
    performed_at DATETIME,
    PRIMARY KEY (appointment_id, procedure_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (procedure_id) REFERENCES procedure_record(procedure_id) ON DELETE CASCADE
);