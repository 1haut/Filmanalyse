import os
import requests
import numpy as np
import pandas as pd
from dotenv import load_dotenv

load_dotenv()

# TMDB access token auth
tmdb_auth = os.getenv("TMDB_TOKEN")
headers = {
    "accept": "application/json",
    "Authorization": f"Bearer {tmdb_auth}"
}

url_countries = "https://api.themoviedb.org/3/configuration/countries?language=en-US"
url_languages = "https://api.themoviedb.org/3/configuration/languages"
url_genres = "https://api.themoviedb.org/3/genre/movie/list?language=en"

def transform(tmdb_url):
    transformed = []
    tmdb_data = requests.get(tmdb_url, headers=headers).json()
    for element in tmdb_data:
        # Countries
        if "countries" in tmdb_url:
            transformed.append({  "abbreviation": f"{element["iso_3166_1"]}" ,
                                    "name": f"{element["english_name"]}"})
            
            
        if "languages" in tmdb_url:
            transformed.append({  "abbreviation": f"{element["iso_3166_1"]}" ,
                                    "name": f"{element["english_name"]}"})
        
        if "genre" in tmdb_url:
            transformed.append({"genre": f"{element["name"]}"})
        
    return transformed
    
for url in [url_countries, url_languages, url_genres]:
    data = transform(url)
    file_name = f"{url_countries=}".split('=')[0].split("_")[1] + ".csv"
    pd.DataFrame(data).to_csv(file_name, index=False)