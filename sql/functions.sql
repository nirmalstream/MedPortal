USE medportal;

DELIMITER $$

CREATE FUNCTION calculate_patient_age(in_patient_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE age INT;
    SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) INTO age
    FROM patient
    WHERE patient_id = in_patient_id;
    RETURN age;
END$$

CREATE FUNCTION get_patient_appointment_count(in_patient_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM appointment
    WHERE patient_id = in_patient_id;
    RETURN total;
END$$

DELIMITER ;