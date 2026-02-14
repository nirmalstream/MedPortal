import weaviate
from weaviate.classes.config import Property, DataType
from sentence_transformers import SentenceTransformer
from config import WEAVIATE_HOST, WEAVIATE_PORT

# Load embedding model once
model = SentenceTransformer('all-MiniLM-L6-v2')

# Global client
_client = None


def get_client():
    """Get Weaviate client (v4)"""
    global _client
    if _client is None:
        _client = weaviate.connect_to_local(
            host=WEAVIATE_HOST,
            port=WEAVIATE_PORT
        )
    return _client


def close_client():
    """Close Weaviate connection"""
    global _client
    if _client:
        _client.close()
        _client = None


def create_schema():
    """Create the ClinicalNote collection in Weaviate"""
    client = get_client()

    # Delete if exists
    if client.collections.exists("ClinicalNote"):
        client.collections.delete("ClinicalNote")

    # Create collection
    client.collections.create(
        name="ClinicalNote",
        properties=[
            Property(name="appointment_id", data_type=DataType.INT),
            Property(name="patient_id", data_type=DataType.INT),
            Property(name="doctor_id", data_type=DataType.INT),
            Property(name="clinical_notes", data_type=DataType.TEXT),
            Property(name="reason_for_visit", data_type=DataType.TEXT)
        ]
    )
    print("Weaviate schema created")


def add_clinical_note(appointment_id, patient_id, doctor_id, clinical_notes, reason_for_visit):
    """Add a clinical note with its embedding"""
    client = get_client()
    collection = client.collections.get("ClinicalNote")

    # Generate embedding from clinical notes
    text = f"{reason_for_visit} {clinical_notes}"
    vector = model.encode(text).tolist()

    collection.data.insert(
        properties={
            "appointment_id": appointment_id,
            "patient_id": patient_id,
            "doctor_id": doctor_id,
            "clinical_notes": clinical_notes,
            "reason_for_visit": reason_for_visit
        },
        vector=vector
    )


def search_similar_cases(query_text, limit=5):
    """Search for similar clinical cases"""
    client = get_client()
    collection = client.collections.get("ClinicalNote")

    # Generate embedding for search query
    query_vector = model.encode(query_text).tolist()

    results = collection.query.near_vector(
        near_vector=query_vector,
        limit=limit,
        return_metadata=["distance"]
    )

    return results.objects