USE medportal;

DELIMITER $$

CREATE PROCEDURE create_patient(
    IN in_first_name VARCHAR(50),
    IN in_last_name VARCHAR(50),
    IN in_date_of_birth DATE,
    IN in_gender VARCHAR(10),
    IN in_blood_type VARCHAR(5),
    IN in_phone VARCHAR(20),
    IN in_email VARCHAR(100),
    IN in_address VARCHAR(255),
    IN in_emergency_contact_name VARCHAR(100),
    IN in_emergency_contact_phone VARCHAR(20)
)
BEGIN
    INSERT INTO patient (first_name, last_name, date_of_birth, gender, blood_type, phone, email, address, emergency_contact_name, emergency_contact_phone)
    VALUES (in_first_name, in_last_name, in_date_of_birth, in_gender, in_blood_type, in_phone, in_email, in_address, in_emergency_contact_name, in_emergency_contact_phone);
    SELECT LAST_INSERT_ID() AS patient_id;
END$$

CREATE PROCEDURE get_patient_by_id(IN in_patient_id INT)
BEGIN
    SELECT * FROM patient WHERE patient_id = in_patient_id;
END$$

CREATE PROCEDURE update_patient(
    IN in_patient_id INT,
    IN in_first_name VARCHAR(50),
    IN in_last_name VARCHAR(50),
    IN in_date_of_birth DATE,
    IN in_gender VARCHAR(10),
    IN in_blood_type VARCHAR(5),
    IN in_phone VARCHAR(20),
    IN in_email VARCHAR(100),
    IN in_address VARCHAR(255),
    IN in_emergency_contact_name VARCHAR(100),
    IN in_emergency_contact_phone VARCHAR(20)
)
BEGIN
    UPDATE patient
    SET first_name = in_first_name,
        last_name = in_last_name,
        date_of_birth = in_date_of_birth,
        gender = in_gender,
        blood_type = in_blood_type,
        phone = in_phone,
        email = in_email,
        address = in_address,
        emergency_contact_name = in_emergency_contact_name,
        emergency_contact_phone = in_emergency_contact_phone
    WHERE patient_id = in_patient_id;
END$$

CREATE PROCEDURE delete_patient(IN in_patient_id INT)
BEGIN
    DELETE FROM patient WHERE patient_id = in_patient_id;
END$$

CREATE PROCEDURE get_all_patients()
BEGIN
    SELECT p.*, 
           calculate_patient_age(p.patient_id) AS age,
           get_patient_appointment_count(p.patient_id) AS appointment_count
    FROM patient p 
    ORDER BY patient_id;
END$$

CREATE PROCEDURE get_patients_by_doctor(IN in_doctor_id INT)
BEGIN
    SELECT DISTINCT p.*, 
           calculate_patient_age(p.patient_id) AS age,
           get_patient_appointment_count(p.patient_id) AS appointment_count
    FROM patient p
    JOIN appointment a ON p.patient_id = a.patient_id
    WHERE a.doctor_id = in_doctor_id
    ORDER BY p.last_name, p.first_name;
END$$

CREATE PROCEDURE create_doctor(
    IN in_first_name VARCHAR(50),
    IN in_last_name VARCHAR(50),
    IN in_specialization VARCHAR(100),
    IN in_license_number VARCHAR(20),
    IN in_phone VARCHAR(20),
    IN in_email VARCHAR(100)
)
BEGIN
    INSERT INTO doctor (first_name, last_name, specialization, license_number, phone, email)
    VALUES (in_first_name, in_last_name, in_specialization, in_license_number, in_phone, in_email);
    SELECT LAST_INSERT_ID() AS doctor_id;
END$$

CREATE PROCEDURE get_doctor_by_id(IN in_doctor_id INT)
BEGIN
    SELECT * FROM doctor WHERE doctor_id = in_doctor_id;
END$$

CREATE PROCEDURE get_all_doctors()
BEGIN
    SELECT * FROM doctor ORDER BY last_name, first_name;
END$$

CREATE PROCEDURE create_appointment(
    IN in_patient_id INT,
    IN in_doctor_id INT,
    IN in_appointment_date DATETIME,
    IN in_status VARCHAR(20),
    IN in_reason_for_visit VARCHAR(255),
    IN in_clinical_notes TEXT
)
BEGIN
    INSERT INTO appointment (patient_id, doctor_id, appointment_date, status, reason_for_visit, clinical_notes)
    VALUES (in_patient_id, in_doctor_id, in_appointment_date, in_status, in_reason_for_visit, in_clinical_notes);
    SELECT LAST_INSERT_ID() AS appointment_id;
END$$

CREATE PROCEDURE get_appointment_by_id(IN in_appointment_id INT)
BEGIN
    SELECT a.*, p.first_name AS patient_first_name, p.last_name AS patient_last_name,
           d.first_name AS doctor_first_name, d.last_name AS doctor_last_name
    FROM appointment a
    JOIN patient p ON a.patient_id = p.patient_id
    JOIN doctor d ON a.doctor_id = d.doctor_id
    WHERE a.appointment_id = in_appointment_id;
END$$

CREATE PROCEDURE update_appointment(
    IN in_appointment_id INT,
    IN in_patient_id INT,
    IN in_doctor_id INT,
    IN in_appointment_date DATETIME,
    IN in_status VARCHAR(20),
    IN in_reason_for_visit VARCHAR(255),
    IN in_clinical_notes TEXT
)
BEGIN
    UPDATE appointment
    SET patient_id = in_patient_id,
        doctor_id = in_doctor_id,
        appointment_date = in_appointment_date,
        status = in_status,
        reason_for_visit = in_reason_for_visit,
        clinical_notes = in_clinical_notes
    WHERE appointment_id = in_appointment_id;
END$$

CREATE PROCEDURE delete_appointment(IN in_appointment_id INT)
BEGIN
    DELETE FROM appointment WHERE appointment_id = in_appointment_id;
END$$

CREATE PROCEDURE get_all_appointments()
BEGIN
    SELECT a.*, p.first_name AS patient_first_name, p.last_name AS patient_last_name,
           d.first_name AS doctor_first_name, d.last_name AS doctor_last_name
    FROM appointment a
    JOIN patient p ON a.patient_id = p.patient_id
    JOIN doctor d ON a.doctor_id = d.doctor_id
    ORDER BY a.appointment_date DESC;
END$$

CREATE PROCEDURE get_appointments_by_doctor(IN in_doctor_id INT)
BEGIN
    SELECT a.*, p.first_name AS patient_first_name, p.last_name AS patient_last_name,
           d.first_name AS doctor_first_name, d.last_name AS doctor_last_name
    FROM appointment a
    JOIN patient p ON a.patient_id = p.patient_id
    JOIN doctor d ON a.doctor_id = d.doctor_id
    WHERE a.doctor_id = in_doctor_id
    ORDER BY a.appointment_date DESC;
END$$

CREATE PROCEDURE create_medical_record(
    IN in_appointment_id INT,
    IN in_visit_date DATETIME,
    IN in_chief_complaint VARCHAR(255),
    IN in_diagnosis VARCHAR(255),
    IN in_treatment_plan TEXT,
    IN in_follow_up_required BOOLEAN,
    IN in_follow_up_date DATE
)
BEGIN
    INSERT INTO medical_record (appointment_id, visit_date, chief_complaint, diagnosis, treatment_plan, follow_up_required, follow_up_date)
    VALUES (in_appointment_id, in_visit_date, in_chief_complaint, in_diagnosis, in_treatment_plan, in_follow_up_required, in_follow_up_date);
    SELECT LAST_INSERT_ID() AS record_id;
END$$

CREATE PROCEDURE get_medical_record_by_id(IN in_record_id INT)
BEGIN
    SELECT * FROM medical_record WHERE record_id = in_record_id;
END$$

CREATE PROCEDURE update_medical_record(
    IN in_record_id INT,
    IN in_visit_date DATETIME,
    IN in_chief_complaint VARCHAR(255),
    IN in_diagnosis VARCHAR(255),
    IN in_treatment_plan TEXT,
    IN in_follow_up_required BOOLEAN,
    IN in_follow_up_date DATE
)
BEGIN
    UPDATE medical_record
    SET visit_date = in_visit_date,
        chief_complaint = in_chief_complaint,
        diagnosis = in_diagnosis,
        treatment_plan = in_treatment_plan,
        follow_up_required = in_follow_up_required,
        follow_up_date = in_follow_up_date
    WHERE record_id = in_record_id;
END$$

CREATE PROCEDURE delete_medical_record(IN in_record_id INT)
BEGIN
    DELETE FROM medical_record WHERE record_id = in_record_id;
END$$

CREATE PROCEDURE get_all_medical_records()
BEGIN
    SELECT mr.*, a.appointment_date, a.reason_for_visit,
           p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM medical_record mr
    JOIN appointment a ON mr.appointment_id = a.appointment_id
    JOIN patient p ON a.patient_id = p.patient_id
    ORDER BY mr.visit_date DESC;
END$$

CREATE PROCEDURE get_medical_records_by_doctor(IN in_doctor_id INT)
BEGIN
    SELECT mr.*, a.appointment_date, a.reason_for_visit,
           p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM medical_record mr
    JOIN appointment a ON mr.appointment_id = a.appointment_id
    JOIN patient p ON a.patient_id = p.patient_id
    WHERE a.doctor_id = in_doctor_id
    ORDER BY mr.visit_date DESC;
END$$

CREATE PROCEDURE create_prescription(
    IN in_appointment_id INT,
    IN in_patient_id INT,
    IN in_medication_name VARCHAR(100),
    IN in_dosage VARCHAR(50),
    IN in_frequency VARCHAR(50),
    IN in_duration VARCHAR(50),
    IN in_instructions TEXT,
    IN in_prescribed_date DATETIME
)
BEGIN
    INSERT INTO prescription (appointment_id, patient_id, medication_name, dosage, frequency, duration, instructions, prescribed_date)
    VALUES (in_appointment_id, in_patient_id, in_medication_name, in_dosage, in_frequency, in_duration, in_instructions, in_prescribed_date);
    SELECT LAST_INSERT_ID() AS prescription_id;
END$$

CREATE PROCEDURE get_prescription_by_id(IN in_prescription_id INT)
BEGIN
    SELECT * FROM prescription WHERE prescription_id = in_prescription_id;
END$$

CREATE PROCEDURE update_prescription(
    IN in_prescription_id INT,
    IN in_medication_name VARCHAR(100),
    IN in_dosage VARCHAR(50),
    IN in_frequency VARCHAR(50),
    IN in_duration VARCHAR(50),
    IN in_instructions TEXT
)
BEGIN
    UPDATE prescription
    SET medication_name = in_medication_name,
        dosage = in_dosage,
        frequency = in_frequency,
        duration = in_duration,
        instructions = in_instructions
    WHERE prescription_id = in_prescription_id;
END$$

CREATE PROCEDURE delete_prescription(IN in_prescription_id INT)
BEGIN
    DELETE FROM prescription WHERE prescription_id = in_prescription_id;
END$$

CREATE PROCEDURE get_all_prescriptions()
BEGIN
    SELECT pr.*, p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM prescription pr
    JOIN patient p ON pr.patient_id = p.patient_id
    ORDER BY pr.prescribed_date DESC;
END$$

CREATE PROCEDURE get_prescriptions_by_doctor(IN in_doctor_id INT)
BEGIN
    SELECT pr.*, p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM prescription pr
    JOIN patient p ON pr.patient_id = p.patient_id
    JOIN appointment a ON pr.appointment_id = a.appointment_id
    WHERE a.doctor_id = in_doctor_id
    ORDER BY pr.prescribed_date DESC;
END$$

CREATE PROCEDURE create_procedure_record(
    IN in_procedure_name VARCHAR(100),
    IN in_procedure_type VARCHAR(50),
    IN in_duration_minutes INT,
    IN in_outcome VARCHAR(50),
    IN in_notes TEXT
)
BEGIN
    INSERT INTO procedure_record (procedure_name, procedure_type, duration_minutes, outcome, notes)
    VALUES (in_procedure_name, in_procedure_type, in_duration_minutes, in_outcome, in_notes);
    SELECT LAST_INSERT_ID() AS procedure_id;
END$$

CREATE PROCEDURE get_procedure_by_id(IN in_procedure_id INT)
BEGIN
    SELECT * FROM procedure_record WHERE procedure_id = in_procedure_id;
END$$

CREATE PROCEDURE update_procedure_record(
    IN in_procedure_id INT,
    IN in_procedure_name VARCHAR(100),
    IN in_procedure_type VARCHAR(50),
    IN in_duration_minutes INT,
    IN in_outcome VARCHAR(50),
    IN in_notes TEXT
)
BEGIN
    UPDATE procedure_record
    SET procedure_name = in_procedure_name,
        procedure_type = in_procedure_type,
        duration_minutes = in_duration_minutes,
        outcome = in_outcome,
        notes = in_notes
    WHERE procedure_id = in_procedure_id;
END$$

CREATE PROCEDURE delete_procedure_record(IN in_procedure_id INT)
BEGIN
    DELETE FROM procedure_record WHERE procedure_id = in_procedure_id;
END$$

CREATE PROCEDURE get_all_procedures()
BEGIN
    SELECT pr.*, ap.performed_at, a.appointment_id,
           p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM procedure_record pr
    JOIN appointment_procedure ap ON pr.procedure_id = ap.procedure_id
    JOIN appointment a ON ap.appointment_id = a.appointment_id
    JOIN patient p ON a.patient_id = p.patient_id
    ORDER BY ap.performed_at DESC;
END$$

CREATE PROCEDURE get_procedures_by_doctor(IN in_doctor_id INT)
BEGIN
    SELECT pr.*, ap.performed_at, a.appointment_id,
           p.first_name AS patient_first_name, p.last_name AS patient_last_name
    FROM procedure_record pr
    JOIN appointment_procedure ap ON pr.procedure_id = ap.procedure_id
    JOIN appointment a ON ap.appointment_id = a.appointment_id
    JOIN patient p ON a.patient_id = p.patient_id
    WHERE a.doctor_id = in_doctor_id
    ORDER BY ap.performed_at DESC;
END$$

CREATE PROCEDURE link_procedure_to_appointment(
    IN in_appointment_id INT,
    IN in_procedure_id INT,
    IN in_performed_at DATETIME
)
BEGIN
    INSERT INTO appointment_procedure (appointment_id, procedure_id, performed_at)
    VALUES (in_appointment_id, in_procedure_id, in_performed_at);
END$$

CREATE PROCEDURE get_doctor_dashboard_counts(IN in_doctor_id INT)
BEGIN
    SELECT 
        (SELECT COUNT(*) FROM appointment WHERE doctor_id = in_doctor_id) AS my_appointments,
        (SELECT COUNT(DISTINCT patient_id) FROM appointment WHERE doctor_id = in_doctor_id) AS my_patients,
        (SELECT COUNT(*) FROM medical_record mr 
         JOIN appointment a ON mr.appointment_id = a.appointment_id 
         WHERE a.doctor_id = in_doctor_id) AS my_records,
        (SELECT COUNT(*) FROM prescription pr 
         JOIN appointment a ON pr.appointment_id = a.appointment_id 
         WHERE a.doctor_id = in_doctor_id) AS my_prescriptions,
        (SELECT COUNT(*) FROM procedure_record pr 
         JOIN appointment_procedure ap ON pr.procedure_id = ap.procedure_id 
         JOIN appointment a ON ap.appointment_id = a.appointment_id 
         WHERE a.doctor_id = in_doctor_id) AS my_procedures,
        (SELECT COUNT(*) FROM patient) AS total_patients,
        (SELECT COUNT(*) FROM appointment) AS total_appointments;
END$$

DELIMITER ;