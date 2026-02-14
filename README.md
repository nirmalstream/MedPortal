# MedPortal

A clinical decision support system that combines MySQL for relational data storage with Weaviate vector database for semantic search of clinical notes.

## Features

- **Patient Management**: Create, read, update, and delete patient records
- **Doctor Management**: Manage doctor profiles and specializations
- **Appointment Scheduling**: Schedule and manage patient appointments
- **Medical Records**: Store and manage clinical notes and diagnoses
- **Prescriptions**: Create and track medication prescriptions
- **Procedures**: Document and track medical procedures
- **Semantic Search**: Search for similar clinical cases using natural language queries

## Tech Stack

- **Backend**: Python 3.8+ with Flask
- **Relational Database**: MySQL 8.0
- **Vector Database**: Weaviate (Docker)
- **Embeddings**: sentence-transformers (all-MiniLM-L6-v2)
- **Frontend**: HTML5, Bootstrap 5, Jinja2

## Prerequisites

- Python 3.8 or higher
- MySQL 8.0 or higher
- Docker Desktop
- Git

## Installation

### 1. Clone the repository
```bash
git clone https://github.com/nirmalstream/MedPortal.git
cd MedPortal
```

### 2. Create and activate virtual environment
```bash
python -m venv venv

# On Windows
venv\Scripts\activate

# On Mac/Linux
source venv/bin/activate
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

### 4. Start Weaviate with Docker
```bash
docker-compose up -d
```

Verify it's running:
```bash
docker ps
```

### 5. Set up MySQL database

Edit `config.py` with your MySQL credentials:
```python
MYSQL_HOST = "localhost"
MYSQL_USER = "root"
MYSQL_PASSWORD = "your_password"
MYSQL_DATABASE = "medportal"
WEAVIATE_HOST = "localhost"
WEAVIATE_PORT = 8080
```

Then run the SQL files in order:
```bash
mysql -u root -p medportal < sql/schema.sql
mysql -u root -p medportal < sql/functions.sql
mysql -u root -p medportal < sql/procedures.sql
mysql -u root -p medportal < sql/triggers.sql
```

Or use the data dump:
```bash
mysql -u root -p medportal < data_dump.sql
```

### 6. Run the application
```bash
python run.py
```

Open your browser to: `http://127.0.0.1:5000`

## Usage

1. **Login**: Select a doctor from the dropdown on the login page
2. **Navigate**: Use the dashboard to access different features
3. **Manage Data**: Create, view, update, or delete patients, appointments, records, etc.
4. **Search**: Use the semantic search feature to find similar clinical cases

## Project Structure

```
MedPortal/
├── app/
│   ├── routes.py          # Flask routes
│   ├── db/
│   │   ├── mysql_manager.py    # MySQL operations
│   │   └── weaviate_manager.py # Vector search
│   └── templates/         # HTML templates
├── data/
│   ├── generator.py       # Generate sample data
│   ├── load_data.py       # Load data to database
│   └── medical_scenarios.json  # Sample medical data
├── sql/
│   ├── schema.sql         # Database schema
│   ├── functions.sql      # Database functions
│   ├── procedures.sql     # Stored procedures
│   └── triggers.sql       # Database triggers
├── config.py              # Configuration
├── requirements.txt       # Dependencies
├── docker-compose.yml     # Docker setup
└── run.py                 # Entry point
```

## Database Design

**7 Tables**:
- Doctor
- Patient
- Appointment
- MedicalRecord
- Prescription
- Procedure
- ClinicalNote (Weaviate)

**35 Stored Procedures** | **2 Functions** | **10 Triggers**

## Stopping the Application

```bash
# Stop Flask
Ctrl+C

# Stop Weaviate
docker-compose down
```

## Notes

- Login uses a dropdown selector (no password required for demo)
- All CRUD operations use stored procedures
- Clinical notes are stored in both MySQL and Weaviate for semantic search
- The system uses local embeddings (no external API calls)

## Future Work

### Knowledge Graph Implementation
The next major enhancement is to build a **knowledge graph** that maps relationships between clinical entities:
- **Locations ↔ Diagnoses**: Identify regional health trends and outbreak patterns
- **Symptoms ↔ Diagnoses**: Create semantic links between reported symptoms and confirmed diagnoses
- **Diagnoses ↔ Procedures**: Map which procedures are most effective for specific diagnoses
- **Treatment Patterns**: Visualize treatment outcomes across different patient populations

This knowledge graph would enable:
- Predictive analytics for diagnosis suggestions based on symptom combinations
- Regional health trend analysis
- Identification of uncommon symptom-diagnosis pairs for research
- Improved clinical decision support with evidence-based recommendations

### Other Planned Enhancements
- **Semantic Search Expansion**: Provide automated treatment suggestions based on similar historical cases
- **Family Accounts**: Support multiple patients sharing contact information
- **Admin/Front Desk View**: Separate interface for non-clinical staff with role-based access control
- **Individual Doctor Authentication**: Replace dropdown selector with username/password login
- **Patient Portal**: Allow patients to securely view their own records and appointments
- **Integration with Knowledge Graphs**: Connect the system to external medical knowledge bases for enhanced decision support

## License

This project was created as a coursework for CS 5200 Database Management Systems.
