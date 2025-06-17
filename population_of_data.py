import os
import json
import requests
import numpy as np
import pandas as pd
# from database import supabase
from dotenv import load_dotenv
from admin_connection import supabase

load_dotenv()

# Access auth admin api
admin_auth_client = supabase.auth.admin

# TMDB access token auth
tmdb_auth = os.getenv("TMDB_TOKEN")

headers = {
    "accept": "application/json",
    "Authorization": f"Bearer {tmdb_auth}"
}

def requests_json(url):
    res = requests.get(url, headers=headers)
    return res.json()


url_countries = "https://api.themoviedb.org/3/configuration/countries?language=en-US"
url_languages = "https://api.themoviedb.org/3/configuration/languages"
url_genres = "https://api.themoviedb.org/3/genre/movie/list?language=en"

countries_tmdb = requests.get(url_countries, headers=headers).json()
languages_tmdb = requests.get(url_languages, headers=headers).json()
genres_tmdb = requests.get(url_genres, headers=headers).json()

# Transform data from TMDB
transformed_countries = []
for element in countries_tmdb:
    transformed_countries.append({  "abbreviation": f"{element["iso_3166_1"]}" ,
                                    "name": f"{element["english_name"]}"})
    
transformed_languages = []
for element in languages_tmdb:
    transformed_languages.append({  "abbreviation": f"{element["iso_639_1"]}" ,
                                    "english_name": f"{element["english_name"]}",
                                    "native_name": f"{element["name"]}"})

transformed_genres = []
for element in genres_tmdb:
    transformed_genres.append({"genre": f"{element["name"]}"})
    

# Insert data to database    
supabase.table("countries").insert(transformed_countries).execute()
supabase.table("languages").insert(transformed_languages).execute()
supabase.table("genres").insert(transformed_genres).execute()
