"""
Load generated data into MySQL and Weaviate
Run from project root: python data/load_data.py

Run this after:
1. Running schema.sql, procedures.sql, functions.sql, triggers.sql in MySQL Workbench
2. Starting Weaviate with docker-compose up -d
3. Running generator.py to create the JSON files
"""

import json
import os
import sys

# Add parent directory to path so we can import from app/
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app.db import mysql_manager as mysql
from app.db import weaviate_manager as weaviate


DATA_DIR = os.path.join(os.path.dirname(__file__), "generated")


def load_json(filename):
    """Load a JSON file from the generated data directory"""
    filepath = os.path.join(DATA_DIR, filename)
    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)


def load_doctors():
    """Load doctors into MySQL"""
    doctors = load_json("doctors.json")
    for d in doctors:
        mysql.call_proc("create_doctor", [
            d["first_name"], d["last_name"], d["specialization"],
            d["license_number"], d["phone"], d["email"]
        ])
    print(f"Loaded {len(doctors)} doctors")


def load_patients():
    """Load patients into MySQL"""
    patients = load_json("patients.json")
    for p in patients:
        mysql.call_proc("create_patient", [
            p["first_name"], p["last_name"], p["date_of_birth"],
            p["gender"], p["blood_type"], p["phone"], p["email"],
            p["address"], p["emergency_contact_name"], p["emergency_contact_phone"]
        ])
    print(f"Loaded {len(patients)} patients")


def load_appointments():
    """Load appointments into MySQL and clinical notes into Weaviate"""
    appointments = load_json("appointments.json")

    for a in appointments:
        # Load into MySQL
        mysql.call_proc("create_appointment", [
            a["patient_id"], a["doctor_id"], a["appointment_date"],
            a["status"], a["reason_for_visit"], a["clinical_notes"]
        ])

        # Load into Weaviate (only completed appointments with clinical notes)
        if a["status"] == "completed" and a["clinical_notes"]:
            weaviate.add_clinical_note(
                appointment_id=a["appointment_id"],
                patient_id=a["patient_id"],
                doctor_id=a["doctor_id"],
                clinical_notes=a["clinical_notes"],
                reason_for_visit=a["reason_for_visit"] or ""
            )

    print(f"Loaded {len(appointments)} appointments")


def load_medical_records():
    """Load medical records into MySQL"""
    records = load_json("medical_records.json")
    for r in records:
        mysql.call_proc("create_medical_record", [
            r["appointment_id"], r["visit_date"], r["chief_complaint"],
            r["diagnosis"], r["treatment_plan"], r["follow_up_required"],
            r["follow_up_date"]
        ])
    print(f"Loaded {len(records)} medical records")


def load_prescriptions():
    """Load prescriptions into MySQL"""
    prescriptions = load_json("prescriptions.json")

    # Get patient_id from appointments
    appointments = load_json("appointments.json")
    appt_to_patient = {a["appointment_id"]: a["patient_id"] for a in appointments}

    for p in prescriptions:
        patient_id = appt_to_patient.get(p["appointment_id"])
        mysql.call_proc("create_prescription", [
            p["appointment_id"], patient_id,
            p["medication_name"], p["dosage"], p["frequency"],
            p["duration"], p["instructions"], p["prescribed_date"]
        ])
    print(f"Loaded {len(prescriptions)} prescriptions")


def load_procedures():
    """Load procedures into MySQL"""
    procedures = load_json("procedures.json")

    # Get appointment dates for performed_at
    appointments = load_json("appointments.json")
    appt_to_date = {a["appointment_id"]: a["appointment_date"] for a in appointments}

    for p in procedures:
        # Create the procedure record
        mysql.call_proc("create_procedure_record", [
            p["procedure_name"], p["procedure_type"],
            p["duration_minutes"], p["outcome"], p["notes"]
        ])
        # Link to appointment
        performed_at = appt_to_date.get(p["appointment_id"])
        mysql.call_proc("link_procedure_to_appointment", [
            p["appointment_id"], p["procedure_id"], performed_at
        ])
    print(f"Loaded {len(procedures)} procedures")


def main():
    print("=" * 50)
    print("Loading data into MySQL and Weaviate")
    print("=" * 50)

    # Create Weaviate schema
    print("\nSetting up Weaviate schema...")
    weaviate.create_schema()

    # Load data in order (respecting foreign keys)
    print("\nLoading into MySQL...")
    load_doctors()
    load_patients()
    load_appointments()
    load_medical_records()
    load_prescriptions()
    load_procedures()

    print("\n" + "=" * 50)
    print("Data loading complete!")
    print("=" * 50)

    # Close Weaviate connection
    weaviate.close_client()


if __name__ == "__main__":
    main()