USE medportal;

DELIMITER $$

CREATE TRIGGER validate_patient_before_insert
BEFORE INSERT ON patient
FOR EACH ROW
BEGIN
    IF NEW.date_of_birth > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date of birth cannot be in the future';
    END IF;
    
    IF NEW.phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number must be 10 digits';
    END IF;
    
    IF NEW.emergency_contact_phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.emergency_contact_phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Emergency contact phone must be 10 digits';
    END IF;
END$$

CREATE TRIGGER validate_patient_before_update
BEFORE UPDATE ON patient
FOR EACH ROW
BEGIN
    IF NEW.date_of_birth > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Date of birth cannot be in the future';
    END IF;
    
    IF NEW.phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number must be 10 digits';
    END IF;
    
    IF NEW.emergency_contact_phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.emergency_contact_phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Emergency contact phone must be 10 digits';
    END IF;
END$$

CREATE TRIGGER validate_doctor_before_insert
BEFORE INSERT ON doctor
FOR EACH ROW
BEGIN
    IF NEW.phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number must be 10 digits';
    END IF;
END$$

CREATE TRIGGER validate_doctor_before_update
BEFORE UPDATE ON doctor
FOR EACH ROW
BEGIN
    IF NEW.phone IS NOT NULL AND LENGTH(REPLACE(REPLACE(REPLACE(NEW.phone, '-', ''), '(', ''), ')', '')) != 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Phone number must be 10 digits';
    END IF;
END$$

CREATE TRIGGER validate_appointment_before_insert
BEFORE INSERT ON appointment
FOR EACH ROW
BEGIN
    IF NEW.status NOT IN ('scheduled', 'completed', 'cancelled', 'no-show') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid appointment status';
    END IF;
END$$

CREATE TRIGGER validate_appointment_before_update
BEFORE UPDATE ON appointment
FOR EACH ROW
BEGIN
    IF NEW.status NOT IN ('scheduled', 'completed', 'cancelled', 'no-show') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid appointment status';
    END IF;
END$$

CREATE TRIGGER validate_medical_record_before_insert
BEFORE INSERT ON medical_record
FOR EACH ROW
BEGIN
    IF NEW.follow_up_required = TRUE AND NEW.follow_up_date IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Follow up date is required when follow up is marked as required';
    END IF;
END$$

CREATE TRIGGER validate_medical_record_before_update
BEFORE UPDATE ON medical_record
FOR EACH ROW
BEGIN
    IF NEW.follow_up_required = TRUE AND NEW.follow_up_date IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Follow up date is required when follow up is marked as required';
    END IF;
END$$

CREATE TRIGGER validate_procedure_before_insert
BEFORE INSERT ON procedure_record
FOR EACH ROW
BEGIN
    IF NEW.duration_minutes IS NOT NULL AND NEW.duration_minutes < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Procedure duration cannot be negative';
    END IF;
END$$

CREATE TRIGGER validate_procedure_before_update
BEFORE UPDATE ON procedure_record
FOR EACH ROW
BEGIN
    IF NEW.duration_minutes IS NOT NULL AND NEW.duration_minutes < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Procedure duration cannot be negative';
    END IF;
END$$

DELIMITER ;