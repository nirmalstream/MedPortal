"""
Medical Data Generator
Generates synthetic patient data using Faker and curated medical scenarios
"""

import random
import json
import os
from datetime import datetime, timedelta
from faker import Faker

fake = Faker()
Faker.seed(42)
random.seed(42)

NOTE_TEMPLATES = [
    "Patient presents with {chief_complaint}. Reports {symptoms} for {duration}. {history} Assessment: {diagnosis}. Plan: {plan}",
    "Chief complaint: {chief_complaint}. Duration: {duration}. Symptoms include {symptoms}. {history} Diagnosis: {diagnosis}. Treatment: {plan}",
    "Patient presents with {chief_complaint} for {duration}. Patient reports {symptoms}. {history} Impression: {diagnosis}. Recommendation: {plan}",
    "Patient complains of {chief_complaint} ongoing for {duration}. Associated symptoms: {symptoms}. {history} Working diagnosis: {diagnosis}. {plan}",
]

HISTORY_PHRASES = [
    "No significant past medical history.",
    "Patient has history of similar symptoms.",
    "Vital signs stable.",
    "No acute distress noted.",
    "Patient appears uncomfortable but stable.",
    "No fever present.",
    "Alert and oriented.",
]

PLAN_TEMPLATES = [
    "Start {medication}. Follow up in {follow_up}.",
    "Prescribe {medication}. Return if symptoms worsen.",
    "Begin treatment with {medication}. Schedule follow-up in {follow_up}.",
    "Continue monitoring. Start {medication}.",
    "{medication} prescribed. Patient education provided. Follow up in {follow_up}.",
]

DURATIONS = ["2 days", "3 days", "1 week", "2 weeks", "1 month", "several weeks", "a few days"]
FOLLOW_UPS = ["1 week", "2 weeks", "1 month", "3 months", "6 months"]

SPECIALIZATIONS = [
    "Family Medicine", "Internal Medicine", "Cardiology", "Pulmonology",
    "Gastroenterology", "Neurology", "Orthopedics", "Dermatology",
    "Psychiatry", "Endocrinology", "Rheumatology", "Urology"
]

BLOOD_TYPES = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"]
GENDERS = ["Male", "Female"]
APPOINTMENT_STATUSES = ["scheduled", "completed", "cancelled", "no-show"]
PROCEDURE_TYPES = ["Diagnostic", "Therapeutic", "Preventive", "Monitoring"]
PROCEDURE_OUTCOMES = ["completed", "normal", "abnormal", "pending review", "requires follow-up"]
DOSAGES = ["5mg", "10mg", "20mg", "25mg", "50mg", "100mg", "200mg", "250mg", "500mg"]
FREQUENCIES = ["Once daily", "Twice daily", "Three times daily", "Every 8 hours", "As needed", "At bedtime"]
PRESCRIPTION_DURATIONS = ["7 days", "10 days", "14 days", "30 days", "60 days", "90 days"]


def generate_phone():
    """Generate a standardized phone number in XXX-XXX-XXXX format"""
    return f"{fake.random_number(digits=3, fix_len=True)}-{fake.random_number(digits=3, fix_len=True)}-{fake.random_number(digits=4, fix_len=True)}"


def load_medical_scenarios():
    """Load the curated medical scenarios from JSON file"""
    script_dir = os.path.dirname(os.path.abspath(__file__))
    filepath = os.path.join(script_dir, "medical_scenarios.json")

    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)


def get_conditions(scenarios):
    """Extract conditions with their related data"""
    return scenarios


def get_all_medications(scenarios):
    """Get all unique medications from scenarios"""
    medications = set()
    for s in scenarios:
        for med in s["medications"]:
            medications.add(med)
    return list(medications)


def get_all_procedures(scenarios):
    """Get all unique procedures from scenarios"""
    procedures = set()
    for s in scenarios:
        for proc in s["procedures"]:
            procedures.add(proc)
    return list(procedures)


def generate_doctors(n=10):
    """Generate n doctor records"""
    doctors = []
    used_licenses = set()

    for i in range(n):
        license_num = fake.unique.bothify(text="MD######")
        while license_num in used_licenses:
            license_num = fake.unique.bothify(text="MD######")
        used_licenses.add(license_num)

        doctors.append({
            "doctor_id": i + 1,
            "first_name": fake.first_name(),
            "last_name": fake.last_name(),
            "specialization": random.choice(SPECIALIZATIONS),
            "license_number": license_num,
            "phone": generate_phone(),
            "email": fake.email()
        })
    return doctors


def generate_patients(n=50):
    """Generate n patient records"""
    patients = []

    for i in range(n):
        gender = random.choice(GENDERS)
        first_name = fake.first_name_male() if gender == "Male" else fake.first_name_female()

        patients.append({
            "patient_id": i + 1,
            "first_name": first_name,
            "last_name": fake.last_name(),
            "date_of_birth": fake.date_of_birth(minimum_age=18, maximum_age=90).isoformat(),
            "gender": gender,
            "blood_type": random.choice(BLOOD_TYPES),
            "phone": generate_phone(),
            "email": fake.email(),
            "address": fake.address().replace("\n", ", ")[:200],
            "emergency_contact_name": fake.name(),
            "emergency_contact_phone": generate_phone()
        })
    return patients


def generate_clinical_note(scenario):
    """Generate a realistic clinical note for a given scenario"""
    symptoms_list = random.sample(scenario["symptoms"], min(3, len(scenario["symptoms"])))
    symptoms_text = ", ".join(symptoms_list)

    medication = random.choice(scenario["medications"])
    follow_up = random.choice(FOLLOW_UPS)

    template = random.choice(NOTE_TEMPLATES)
    plan_template = random.choice(PLAN_TEMPLATES)

    plan = plan_template.format(
        medication=medication,
        follow_up=follow_up
    )

    note = template.format(
        chief_complaint=random.choice(scenario["chief_complaints"]),
        symptoms=symptoms_text,
        duration=random.choice(DURATIONS),
        history=random.choice(HISTORY_PHRASES),
        diagnosis=scenario["condition"],
        plan=plan
    )

    note = note.rstrip('.')
    note += '.'

    return note


def generate_appointments(patients, doctors, scenarios, n=200):
    """Generate n appointment records with clinical notes for completed appointments"""
    appointments = []
    end_date = datetime.now()
    start_date = end_date - timedelta(days=365)

    for i in range(n):
        patient = random.choice(patients)
        doctor = random.choice(doctors)
        scenario = random.choice(scenarios)
        status = random.choices(
            APPOINTMENT_STATUSES,
            weights=[0.2, 0.6, 0.1, 0.1]
        )[0]

        appt_date = start_date + timedelta(
            days=random.randint(0, 365),
            hours=random.randint(8, 17),
            minutes=random.choice([0, 15, 30, 45])
        )

        # Ensure appointment date is not in the future
        if appt_date > end_date:
            appt_date = end_date - timedelta(days=random.randint(1, 30))

        clinical_notes = None
        if status == "completed":
            clinical_notes = generate_clinical_note(scenario)

        appointments.append({
            "appointment_id": i + 1,
            "patient_id": patient["patient_id"],
            "doctor_id": doctor["doctor_id"],
            "appointment_date": appt_date.isoformat(),
            "status": status,
            "reason_for_visit": random.choice(scenario["chief_complaints"]),
            "clinical_notes": clinical_notes,
            "scenario": scenario
        })

    return appointments


def generate_medical_records(appointments):
    """Generate medical records for completed appointments"""
    records = []
    record_id = 1

    for appt in appointments:
        if appt["status"] == "completed":
            scenario = appt["scenario"]
            follow_up_required = random.choice([True, False])
            follow_up_date = None
            if follow_up_required:
                appt_date = datetime.fromisoformat(appt["appointment_date"])
                follow_up_date = (appt_date + timedelta(days=random.randint(7, 90))).date().isoformat()

            records.append({
                "record_id": record_id,
                "appointment_id": appt["appointment_id"],
                "visit_date": appt["appointment_date"],
                "chief_complaint": random.choice(scenario["chief_complaints"]),
                "diagnosis": scenario["condition"],
                "treatment_plan": f"Start {random.choice(scenario['medications'])}. {random.choice(HISTORY_PHRASES)}",
                "follow_up_required": follow_up_required,
                "follow_up_date": follow_up_date
            })
            record_id += 1

    return records


def generate_prescriptions(appointments, scenarios):
    """Generate prescriptions for completed appointments"""
    prescriptions = []
    rx_id = 1

    for appt in appointments:
        if appt["status"] == "completed":
            scenario = appt["scenario"]
            num_meds = random.randint(1, 3)
            meds = random.sample(scenario["medications"], min(num_meds, len(scenario["medications"])))

            for med in meds:
                appt_date = datetime.fromisoformat(appt["appointment_date"])

                prescriptions.append({
                    "prescription_id": rx_id,
                    "appointment_id": appt["appointment_id"],
                    "medication_name": med,
                    "dosage": random.choice(DOSAGES),
                    "frequency": random.choice(FREQUENCIES),
                    "duration": random.choice(PRESCRIPTION_DURATIONS),
                    "instructions": f"Take {random.choice(['with food', 'on empty stomach', 'with water', 'as directed'])}.",
                    "prescribed_date": appt_date.isoformat()
                })
                rx_id += 1

    return prescriptions


def generate_appointment_procedures(appointments, scenarios):
    """Generate procedure records for appointments (M:N relationship)"""
    appt_procedures = []
    proc_id = 1

    for appt in appointments:
        if appt["status"] == "completed":
            scenario = appt["scenario"]
            if random.random() < 0.7:
                num_procs = random.randint(1, 3)
                procs = random.sample(scenario["procedures"], min(num_procs, len(scenario["procedures"])))

                for proc in procs:
                    appt_procedures.append({
                        "procedure_id": proc_id,
                        "appointment_id": appt["appointment_id"],
                        "procedure_name": proc,
                        "procedure_type": random.choice(PROCEDURE_TYPES),
                        "duration_minutes": random.randint(5, 60),
                        "outcome": random.choice(PROCEDURE_OUTCOMES),
                        "notes": f"Procedure completed. {random.choice(['No complications.', 'Patient tolerated well.', 'Results pending.', 'Normal findings.'])}"
                    })
                    proc_id += 1

    return appt_procedures


def generate_all_data(num_doctors=10, num_patients=50, num_appointments=200):
    """Generate all synthetic data"""
    print("Loading medical scenarios...")
    scenarios = load_medical_scenarios()
    print(f"Loaded {len(scenarios)} medical conditions")

    print("\nGenerating data...")
    doctors = generate_doctors(num_doctors)
    print(f"  Doctors: {len(doctors)}")

    patients = generate_patients(num_patients)
    print(f"  Patients: {len(patients)}")

    appointments = generate_appointments(patients, doctors, scenarios, num_appointments)
    print(f"  Appointments: {len(appointments)}")

    medical_records = generate_medical_records(appointments)
    print(f"  Medical Records: {len(medical_records)}")

    prescriptions = generate_prescriptions(appointments, scenarios)
    print(f"  Prescriptions: {len(prescriptions)}")

    procedures = generate_appointment_procedures(appointments, scenarios)
    print(f"  Procedures: {len(procedures)}")

    # Remove scenario from appointments (not needed in output)
    for appt in appointments:
        del appt["scenario"]

    return {
        "doctors": doctors,
        "patients": patients,
        "appointments": appointments,
        "medical_records": medical_records,
        "prescriptions": prescriptions,
        "procedures": procedures
    }


def save_generated_data(data, output_dir="generated"):
    """Save all generated data to JSON files"""
    script_dir = os.path.dirname(os.path.abspath(__file__))
    output_path = os.path.join(script_dir, output_dir)

    if not os.path.exists(output_path):
        os.makedirs(output_path)

    for entity_name, entity_data in data.items():
        filepath = os.path.join(output_path, f"{entity_name}.json")
        with open(filepath, 'w', encoding='utf-8') as f:
            json.dump(entity_data, f, indent=2, ensure_ascii=False)
        print(f"Saved {entity_name}.json ({len(entity_data)} records)")


def print_samples(data):
    """Print sample records for verification"""
    print("\n" + "=" * 60)
    print("SAMPLE DATA")
    print("=" * 60)

    print("\n--- Sample Doctor ---")
    doc = data["doctors"][0]
    print(f"  {doc['first_name']} {doc['last_name']}, {doc['specialization']}")
    print(f"  License: {doc['license_number']}, Phone: {doc['phone']}")

    print("\n--- Sample Patient ---")
    pat = data["patients"][0]
    print(f"  {pat['first_name']} {pat['last_name']}")
    print(f"  DOB: {pat['date_of_birth']}, Blood Type: {pat['blood_type']}")
    print(f"  Phone: {pat['phone']}")

    print("\n--- Sample Clinical Note ---")
    for appt in data["appointments"]:
        if appt["clinical_notes"]:
            print(f"  {appt['clinical_notes'][:200]}...")
            break

    print("\n--- Sample Prescription ---")
    if data["prescriptions"]:
        rx = data["prescriptions"][0]
        print(f"  {rx['medication_name']} {rx['dosage']}")
        print(f"  {rx['frequency']} for {rx['duration']}")

    print("\n--- Sample Procedure ---")
    if data["procedures"]:
        proc = data["procedures"][0]
        print(f"  {proc['procedure_name']}")
        print(f"  Type: {proc['procedure_type']}, Outcome: {proc['outcome']}")


if __name__ == "__main__":
    data = generate_all_data(
        num_doctors=10,
        num_patients=50,
        num_appointments=200
    )

    save_generated_data(data)
    print_samples(data)

    print("\n" + "=" * 60)
    print("Data generation complete!")
    print("Files saved to data/generated/")
    print("=" * 60)