import os
from dotenv import load_dotenv
from supabase import create_client, Client

load_dotenv()

url = os.getenv("SUPABASE_URL")
key = os.getenv("SUPABASE_KEY")
service_role_key = os.getenv("SERVICE_ROLE_KEY")

supabase = create_client(url, service_role_key)