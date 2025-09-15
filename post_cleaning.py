import pandas as pd
import numpy as np
# import time

# Load the dataframe
df = pd.read_csv("TMDB_filtered_movies2.csv")

# start = time.time()

df.cast = df.cast.fillna('')
df.director = df.director.fillna('')
df.producers = df.producers.fillna('')
df.director_of_photography = df.director_of_photography.fillna('')
df.production_companies = df.production_companies.fillna('')
df.production_countries = df.production_countries.fillna('')
df.writers = df.writers.fillna('')
df.music_composer = df.music_composer.fillna('')
df.genres = df.genres.fillna('')

# Mapping dictionaries
persons_list = {}
directors_list = {}
producers_list = {}
production_companies_list = {}
writers_list = {}
music_composers_list = {}
photo_directors_list = {}

# Temp lists for relational tables
movie_person_rows = []
movie_director_rows = []
movie_producer_rows = []
movie_writer_rows = []
movie_production_company_rows = []
movie_music_composer_rows = []
movie_photo_director_rows = []

movie_genre_name = []
movie_country_name = []


# Temp lists for referential tables
persons_rows = []
directors_rows = []
producers_rows = []
writers_rows = []
production_companies_rows = []
music_composers_rows = []
photo_directors_rows = []

for row in df.itertuples():
    # Cast
    persons = row.cast.strip().split(",")
    for person in persons:
        person = person.strip()
        if person == '':
            continue
        elif person not in persons_list.keys():
            cast_id = len(persons_list) + 1
            persons_list[person] = cast_id
            persons_rows.append({"id": cast_id,"name": person})

        movie_person_rows.append({"movie_id": row.id, "actor_id": persons_list[person]})

    # Directors
    directors = row.director.strip().split(",")
    for director in directors:
        director = director.strip()
        if director == '':
            continue
        elif director not in directors_list.keys():
            director_id = len(directors_list) + 1
            directors_list[director] = director_id
            directors_rows.append({"id": director_id,"name": director})

        movie_director_rows.append({"movie_id": row.id, "director_id": directors_list[director]})

    # Producers
    producers = row.producers.strip().split(",")
    for producer in producers:
        producer = producer.strip()
        if producer == '':
            continue
        elif producer not in producers_list.keys():
            producer_id = len(producers_list) + 1
            producers_list[producer] = producer_id
            producers_rows.append({"id": producer_id,"name": producer})

        movie_producer_rows.append({"movie_id": row.id, "producer_id": producers_list[producer]})

    # Writers
    writers = row.writers.strip().split(",")
    for writer in writers:
        writer = writer.strip()
        if writer == '':
            continue
        elif writer not in writers_list.keys():
            writer_id = len(writers_list) + 1
            writers_list[writer] = writer_id
            writers_rows.append({"id": writer_id,"name": writer})

        movie_writer_rows.append({"movie_id": row.id, "writer_id": writers_list[writer]})

    # Production Companies
    production_companies = row.production_companies.strip().split(",")
    for production_company in production_companies:
        production_company = production_company.strip()
        if production_company == '':
            continue
        elif production_company not in production_companies_list.keys():
            production_company_id = len(production_companies_list) + 1
            production_companies_list[production_company] = production_company_id
            production_companies_rows.append({"id": production_company_id,"name": production_company})

        movie_production_company_rows.append({"movie_id": row.id, "company_id": production_companies_list[production_company]})

    # Music Composers
    music_composers = row.music_composer.strip().split(",")
    for music_composer in music_composers:
        music_composer = music_composer.strip()
        if music_composer == '':
            continue
        elif music_composer not in music_composers_list.keys():
            music_composer_id = len(music_composers_list) + 1
            music_composers_list[music_composer] = music_composer_id
            music_composers_rows.append({"id": music_composer_id,"name": music_composer})

        movie_music_composer_rows.append({"movie_id": row.id, "composer_id": music_composers_list[music_composer]})

    # Directors of photography
    photo_directors = row.director_of_photography.strip().split(",")
    for photo_director in photo_directors:
        photo_director = photo_director.strip()
        if photo_director == '':
            continue
        elif photo_director not in photo_directors_list.keys():
            photo_director_id = len(photo_directors_list) + 1
            photo_directors_list[photo_director] = photo_director_id
            photo_directors_rows.append({"id": photo_director_id,"name": photo_director})

        movie_photo_director_rows.append({"movie_id": row.id, "dop_id": photo_directors_list[photo_director]})

    # Genres
    genres = row.genres.strip().split(",")
    for genre in genres:
        genre = genre.strip()
        if genre == '':
            continue

        movie_genre_name.append({"movie_id": row.id, "genre_name": genre})

    # Countries
    countries = row.production_countries.strip().split(",")
    for country in countries:
        country = country.strip()
        if country == '':
            continue

        movie_country_name.append({"movie_id": row.id, "country_name": country})


# Create dataframes for relational tables
pd_movie_person = pd.DataFrame(movie_person_rows)
pd_movie_director = pd.DataFrame(movie_director_rows)
pd_movie_producer = pd.DataFrame(movie_producer_rows)
pd_movie_writer = pd.DataFrame(movie_writer_rows)
pd_movie_production_company = pd.DataFrame(movie_production_company_rows)
pd_movie_music_composer = pd.DataFrame(movie_music_composer_rows)
pd_movie_photo_director = pd.DataFrame(movie_photo_director_rows)

# Create dataframes from referential tables
pd_persons_ref = pd.DataFrame(persons_rows)
pd_directors_ref = pd.DataFrame(directors_rows)
pd_producers_ref = pd.DataFrame(producers_rows)
pd_writers_ref = pd.DataFrame(writers_rows)
pd_production_companies_ref = pd.DataFrame(production_companies_rows)
pd_music_composer_ref = pd.DataFrame(music_composers_rows)
pd_photo_director_ref = pd.DataFrame(photo_directors_rows)
pd_genre_name = pd.DataFrame(movie_genre_name)
pd_country_name = pd.DataFrame(movie_country_name)