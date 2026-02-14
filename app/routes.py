from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from app.db import mysql_manager as mysql
from app.db.mysql_manager import DatabaseError
from app.db import weaviate_manager as weaviate

main = Blueprint("main", __name__)


def login_required(f):
    """Decorator to require login"""
    from functools import wraps
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "doctor_id" not in session:
            flash("Please log in first.", "warning")
            return redirect(url_for("main.login"))
        return f(*args, **kwargs)

    return decorated_function


@main.route("/", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        doctor_id = request.form.get("doctor_id")
        if doctor_id:
            doctor = mysql.call_proc("get_doctor_by_id", [doctor_id])
            if doctor:
                session["doctor_id"] = doctor[0]["doctor_id"]
                session["doctor_name"] = f"Dr. {doctor[0]['first_name']} {doctor[0]['last_name']}"
                flash(f"Welcome, {session['doctor_name']}!", "success")
                return redirect(url_for("main.dashboard"))
        flash("Please select a doctor.", "warning")
    doctors = mysql.call_proc("get_all_doctors")
    return render_template("login.html", doctors=doctors)


@main.route("/logout")
def logout():
    session.clear()
    flash("You have been logged out.", "info")
    return redirect(url_for("main.login"))


@main.route("/dashboard")
@login_required
def dashboard():
    doctor_id = session["doctor_id"]
    counts = mysql.call_proc("get_doctor_dashboard_counts", [doctor_id])

    if counts:
        c = counts[0]
        return render_template("dashboard.html",
                               my_appointments=c["my_appointments"],
                               my_patients=c["my_patients"],
                               my_records=c["my_records"],
                               my_prescriptions=c["my_prescriptions"],
                               my_procedures=c["my_procedures"],
                               total_patients=c["total_patients"],
                               total_appointments=c["total_appointments"])

    return render_template("dashboard.html",
                           my_appointments=0, my_patients=0, my_records=0,
                           my_prescriptions=0, my_procedures=0,
                           total_patients=0, total_appointments=0)


@main.route("/patients")
@login_required
def patients():
    view_all = request.args.get("view") == "all"
    doctor_id = session["doctor_id"]

    if view_all:
        data = mysql.call_proc("get_all_patients")
    else:
        data = mysql.call_proc("get_patients_by_doctor", [doctor_id])

    return render_template("patients.html", patients=data, view_all=view_all)


@main.route("/patients/create", methods=["GET", "POST"])
@login_required
def create_patient():
    if request.method == "POST":
        try:
            mysql.call_proc("create_patient", [
                request.form["first_name"],
                request.form["last_name"],
                request.form["date_of_birth"],
                request.form["gender"],
                request.form.get("blood_type"),
                request.form.get("phone"),
                request.form.get("email"),
                request.form.get("address"),
                request.form.get("emergency_contact_name"),
                request.form.get("emergency_contact_phone")
            ])
            flash("Patient created successfully!", "success")
            return redirect(url_for("main.patients"))
        except DatabaseError as e:
            flash(str(e), "danger")
    return render_template("patient_form.html", patient=None)


@main.route("/patients/<int:id>/edit", methods=["GET", "POST"])
@login_required
def edit_patient(id):
    if request.method == "POST":
        try:
            mysql.call_proc("update_patient", [
                id,
                request.form["first_name"],
                request.form["last_name"],
                request.form["date_of_birth"],
                request.form["gender"],
                request.form.get("blood_type"),
                request.form.get("phone"),
                request.form.get("email"),
                request.form.get("address"),
                request.form.get("emergency_contact_name"),
                request.form.get("emergency_contact_phone")
            ])
            flash("Patient updated successfully!", "success")
            return redirect(url_for("main.patients"))
        except DatabaseError as e:
            flash(str(e), "danger")
    data = mysql.call_proc("get_patient_by_id", [id])
    return render_template("patient_form.html", patient=data[0] if data else None)


@main.route("/patients/<int:id>/delete", methods=["POST"])
@login_required
def delete_patient(id):
    mysql.call_proc("delete_patient", [id])
    flash("Patient deleted successfully!", "success")
    return redirect(url_for("main.patients"))


@main.route("/doctors/create", methods=["GET", "POST"])
def create_doctor():
    if request.method == "POST":
        try:
            mysql.call_proc("create_doctor", [
                request.form["first_name"],
                request.form["last_name"],
                request.form["specialization"],
                request.form["license_number"],
                request.form.get("phone"),
                request.form.get("email")
            ])
            flash("Doctor created successfully! You can now log in.", "success")
            return redirect(url_for("main.login"))
        except DatabaseError as e:
            flash(str(e), "danger")
    return render_template("doctor_form.html", doctor=None)


@main.route("/appointments")
@login_required
def appointments():
    view_all = request.args.get("view") == "all"
    doctor_id = session["doctor_id"]

    if view_all:
        data = mysql.call_proc("get_all_appointments")
    else:
        data = mysql.call_proc("get_appointments_by_doctor", [doctor_id])

    return render_template("appointments.html", appointments=data, view_all=view_all)


@main.route("/appointments/create", methods=["GET", "POST"])
@login_required
def create_appointment():
    if request.method == "POST":
        try:
            mysql.call_proc("create_appointment", [
                request.form["patient_id"],
                request.form["doctor_id"],
                request.form["appointment_date"],
                request.form["status"],
                request.form.get("reason_for_visit"),
                request.form.get("clinical_notes")
            ])
            flash("Appointment created successfully!", "success")
            return redirect(url_for("main.appointments"))
        except DatabaseError as e:
            flash(str(e), "danger")
    patients = mysql.call_proc("get_all_patients")
    doctors = mysql.call_proc("get_all_doctors")
    return render_template("appointment_form.html", appointment=None, patients=patients, doctors=doctors,
                           current_doctor_id=session["doctor_id"])


@main.route("/appointments/<int:id>/edit", methods=["GET", "POST"])
@login_required
def edit_appointment(id):
    if request.method == "POST":
        try:
            mysql.call_proc("update_appointment", [
                id,
                request.form["patient_id"],
                request.form["doctor_id"],
                request.form["appointment_date"],
                request.form["status"],
                request.form.get("reason_for_visit"),
                request.form.get("clinical_notes")
            ])
            flash("Appointment updated successfully!", "success")
            return redirect(url_for("main.appointments"))
        except DatabaseError as e:
            flash(str(e), "danger")
    data = mysql.call_proc("get_appointment_by_id", [id])
    patients = mysql.call_proc("get_all_patients")
    doctors = mysql.call_proc("get_all_doctors")
    return render_template("appointment_form.html", appointment=data[0] if data else None, patients=patients,
                           doctors=doctors, current_doctor_id=session["doctor_id"])


@main.route("/appointments/<int:id>/delete", methods=["POST"])
@login_required
def delete_appointment(id):
    mysql.call_proc("delete_appointment", [id])
    flash("Appointment deleted successfully!", "success")
    return redirect(url_for("main.appointments"))


@main.route("/records")
@login_required
def records():
    view_all = request.args.get("view") == "all"
    doctor_id = session["doctor_id"]

    if view_all:
        data = mysql.call_proc("get_all_medical_records")
    else:
        data = mysql.call_proc("get_medical_records_by_doctor", [doctor_id])

    return render_template("records.html", records=data, view_all=view_all)


@main.route("/records/create", methods=["GET", "POST"])
@login_required
def create_record():
    if request.method == "POST":
        try:
            mysql.call_proc("create_medical_record", [
                request.form["appointment_id"],
                request.form["visit_date"],
                request.form.get("chief_complaint"),
                request.form.get("diagnosis"),
                request.form.get("treatment_plan"),
                1 if request.form.get("follow_up_required") else 0,
                request.form.get("follow_up_date") or None
            ])
            flash("Medical record created successfully!", "success")
            return redirect(url_for("main.records"))
        except DatabaseError as e:
            flash(str(e), "danger")

    doctor_id = session["doctor_id"]
    appointments = mysql.call_proc("get_appointments_by_doctor", [doctor_id])
    return render_template("record_form.html", record=None, appointments=appointments)


@main.route("/records/<int:id>/edit", methods=["GET", "POST"])
@login_required
def edit_record(id):
    if request.method == "POST":
        try:
            mysql.call_proc("update_medical_record", [
                id,
                request.form["visit_date"],
                request.form.get("chief_complaint"),
                request.form.get("diagnosis"),
                request.form.get("treatment_plan"),
                1 if request.form.get("follow_up_required") else 0,
                request.form.get("follow_up_date") or None
            ])
            flash("Medical record updated successfully!", "success")
            return redirect(url_for("main.records"))
        except DatabaseError as e:
            flash(str(e), "danger")
    data = mysql.call_proc("get_medical_record_by_id", [id])
    appointments = mysql.call_proc("get_all_appointments")
    return render_template("record_form.html", record=data[0] if data else None, appointments=appointments)


@main.route("/records/<int:id>/delete", methods=["POST"])
@login_required
def delete_record(id):
    mysql.call_proc("delete_medical_record", [id])
    flash("Medical record deleted successfully!", "success")
    return redirect(url_for("main.records"))


@main.route("/prescriptions")
@login_required
def prescriptions():
    view_all = request.args.get("view") == "all"
    doctor_id = session["doctor_id"]

    if view_all:
        data = mysql.call_proc("get_all_prescriptions")
    else:
        data = mysql.call_proc("get_prescriptions_by_doctor", [doctor_id])

    return render_template("prescriptions.html", prescriptions=data, view_all=view_all)


@main.route("/prescriptions/create", methods=["GET", "POST"])
@login_required
def create_prescription():
    if request.method == "POST":
        try:
            mysql.call_proc("create_prescription", [
                request.form["appointment_id"],
                request.form["patient_id"],
                request.form["medication_name"],
                request.form.get("dosage"),
                request.form.get("frequency"),
                request.form.get("duration"),
                request.form.get("instructions"),
                request.form["prescribed_date"]
            ])
            flash("Prescription created successfully!", "success")
            return redirect(url_for("main.prescriptions"))
        except DatabaseError as e:
            flash(str(e), "danger")
    patients = mysql.call_proc("get_all_patients")
    doctor_id = session["doctor_id"]
    appointments = mysql.call_proc("get_appointments_by_doctor", [doctor_id])
    return render_template("prescription_form.html", prescription=None, patients=patients, appointments=appointments)


@main.route("/prescriptions/<int:id>/edit", methods=["GET", "POST"])
@login_required
def edit_prescription(id):
    if request.method == "POST":
        try:
            mysql.call_proc("update_prescription", [
                id,
                request.form["medication_name"],
                request.form.get("dosage"),
                request.form.get("frequency"),
                request.form.get("duration"),
                request.form.get("instructions")
            ])
            flash("Prescription updated successfully!", "success")
            return redirect(url_for("main.prescriptions"))
        except DatabaseError as e:
            flash(str(e), "danger")
    data = mysql.call_proc("get_prescription_by_id", [id])
    patients = mysql.call_proc("get_all_patients")
    appointments = mysql.call_proc("get_all_appointments")
    return render_template("prescription_form.html", prescription=data[0] if data else None, patients=patients,
                           appointments=appointments)


@main.route("/prescriptions/<int:id>/delete", methods=["POST"])
@login_required
def delete_prescription(id):
    mysql.call_proc("delete_prescription", [id])
    flash("Prescription deleted successfully!", "success")
    return redirect(url_for("main.prescriptions"))


@main.route("/procedures")
@login_required
def procedures():
    view_all = request.args.get("view") == "all"
    doctor_id = session["doctor_id"]

    if view_all:
        data = mysql.call_proc("get_all_procedures")
    else:
        data = mysql.call_proc("get_procedures_by_doctor", [doctor_id])

    return render_template("procedures.html", procedures=data, view_all=view_all)


@main.route("/procedures/create", methods=["GET", "POST"])
@login_required
def create_procedure():
    if request.method == "POST":
        try:
            result = mysql.call_proc("create_procedure_record", [
                request.form["procedure_name"],
                request.form.get("procedure_type"),
                request.form.get("duration_minutes") or None,
                request.form.get("outcome"),
                request.form.get("notes")
            ])

            procedure_id = result[0]["procedure_id"] if result else None
            if procedure_id:
                mysql.call_proc("link_procedure_to_appointment", [
                    request.form["appointment_id"],
                    procedure_id,
                    request.form.get("performed_at")
                ])

            flash("Procedure created successfully!", "success")
            return redirect(url_for("main.procedures"))
        except DatabaseError as e:
            flash(str(e), "danger")

    doctor_id = session["doctor_id"]
    appointments = mysql.call_proc("get_appointments_by_doctor", [doctor_id])
    return render_template("procedure_form.html", procedure=None, appointments=appointments)


@main.route("/procedures/<int:id>/edit", methods=["GET", "POST"])
@login_required
def edit_procedure(id):
    if request.method == "POST":
        try:
            mysql.call_proc("update_procedure_record", [
                id,
                request.form["procedure_name"],
                request.form.get("procedure_type"),
                request.form.get("duration_minutes") or None,
                request.form.get("outcome"),
                request.form.get("notes")
            ])
            flash("Procedure updated successfully!", "success")
            return redirect(url_for("main.procedures"))
        except DatabaseError as e:
            flash(str(e), "danger")
    data = mysql.call_proc("get_procedure_by_id", [id])
    appointments = mysql.call_proc("get_all_appointments")
    return render_template("procedure_form.html", procedure=data[0] if data else None, appointments=appointments)


@main.route("/procedures/<int:id>/delete", methods=["POST"])
@login_required
def delete_procedure(id):
    mysql.call_proc("delete_procedure_record", [id])
    flash("Procedure deleted successfully!", "success")
    return redirect(url_for("main.procedures"))


@main.route("/search", methods=["GET", "POST"])
@login_required
def search():
    results = []
    query = ""
    if request.method == "POST":
        query = request.form.get("query", "")
        if query:
            results = weaviate.search_similar_cases(query, limit=10)
    return render_template("search.html", results=results, query=query)