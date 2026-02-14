USE medportal;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE appointment_procedure;
TRUNCATE TABLE procedure_record;
TRUNCATE TABLE prescription;
TRUNCATE TABLE medical_record;
TRUNCATE TABLE appointment;
TRUNCATE TABLE doctor;
TRUNCATE TABLE patient;
SET FOREIGN_KEY_CHECKS = 1;