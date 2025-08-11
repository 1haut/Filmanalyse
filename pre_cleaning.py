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
    

# Convert transformed lists to csv 
pd.DataFrame(transformed_countries).to_csv('countries.csv', index=False)
pd.DataFrame(transformed_languages).to_csv('languages.csv', index=False)
pd.DataFrame(transformed_genres).to_csv('genres.csv', index=False)