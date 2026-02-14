"""
NIH Clinical Tables API Client (Original Attempt)

This was our initial approach to fetch medical data from NIH APIs.
We found the API returned data but relationships between conditions,
medications, and procedures were not reliable, so we switched to
curated data in medical_scenarios.json.

Kept for documentation purposes.
"""

import requests
import json
import os
import time
import string

BASE_URL = "https://clinicaltables.nlm.nih.gov/api"
CACHE_DIR = "cache"
ALPHABET = list(string.ascii_lowercase)


def get_cache_path():
    """Get absolute path to cache directory"""
    script_dir = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(script_dir, CACHE_DIR)


def ensure_cache_dir():
    """Create cache directory if it doesn't exist"""
    cache_path = get_cache_path()
    if not os.path.exists(cache_path):
        os.makedirs(cache_path)
        print(f"Created cache directory: {cache_path}")
    return cache_path


def save_cache(data, filename):
    """Save data to cache file"""
    cache_path = ensure_cache_dir()
    filepath = os.path.join(cache_path, filename)
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
    print(f"Cached {len(data)} items to {filepath}")


def load_cache(filename):
    """Load data from cache file"""
    filepath = os.path.join(get_cache_path(), filename)
    if os.path.exists(filepath):
        with open(filepath, 'r', encoding='utf-8') as f:
            return json.load(f)
    return None


def fetch_all_from_endpoint(endpoint, display_fields, max_per_letter=500):
    """
    Fetch all data from an endpoint by searching each letter A-Z.
    This approach was needed because the API doesn't support listing all items.
    """
    results = []
    seen = set()

    for letter in ALPHABET:
        url = f"{BASE_URL}/{endpoint}/v3/search"
        params = {
            "terms": letter,
            "maxList": max_per_letter,
            "df": display_fields
        }

        try:
            response = requests.get(url, params=params, timeout=10)
            response.raise_for_status()
            data = response.json()

            if len(data) >= 4 and data[3]:
                for item in data[3]:
                    if isinstance(item, list) and len(item) >= 1:
                        name = item[0]
                        if name not in seen:
                            seen.add(name)
                            results.append({"name": name})

            time.sleep(0.1)

        except requests.RequestException as e:
            print(f"Error fetching {endpoint} for letter {letter}: {e}")
            continue

    return results


def fetch_conditions():
    """Fetch conditions from NIH Clinical Tables API"""
    cached = load_cache("conditions.json")
    if cached:
        print(f"Loaded {len(cached)} conditions from cache")
        return cached

    print("Fetching conditions from API...")
    conditions = fetch_all_from_endpoint(
        "conditions",
        "primary_name,info_link_data"
    )

    save_cache(conditions, "conditions.json")
    return conditions


def fetch_medications():
    """Fetch medications from RxTerms API"""
    cached = load_cache("medications.json")
    if cached:
        print(f"Loaded {len(cached)} medications from cache")
        return cached

    print("Fetching medications from API...")
    medications = fetch_all_from_endpoint(
        "rxterms",
        "DISPLAY_NAME,STRENGTHS_AND_FORMS"
    )

    save_cache(medications, "medications.json")
    return medications


def fetch_procedures():
    """Fetch procedures from NIH Clinical Tables API"""
    cached = load_cache("procedures.json")
    if cached:
        print(f"Loaded {len(cached)} procedures from cache")
        return cached

    print("Fetching procedures from API...")
    procedures = fetch_all_from_endpoint(
        "procedures",
        "name"
    )

    save_cache(procedures, "procedures.json")
    return procedures


def cache_all():
    """Fetch and cache all medical data from APIs"""
    print("=" * 60)
    print("NIH Clinical Tables API - Caching Medical Data")
    print("=" * 60)

    conditions = fetch_conditions()
    print(f"Conditions: {len(conditions)} items")

    medications = fetch_medications()
    print(f"Medications: {len(medications)} items")

    procedures = fetch_procedures()
    print(f"Procedures: {len(procedures)} items")

    print("=" * 60)
    print("Caching complete!")
    print("=" * 60)
    print("\nNOTE: This data lacks relationships between entities.")
    print("We switched to curated medical_scenarios.json for better data quality.")


if __name__ == "__main__":
    cache_all()