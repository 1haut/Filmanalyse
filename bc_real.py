import pandas as pd
import numpy as np
from database import supabase
import time

# Load the dataframe
df = pd.read_csv("TMDB_filtered_movies2.csv")

start = time.time()

df.cast = df.cast.fillna('')
df.director = df.director.fillna('')
df.producers = df.producers.fillna('')
df.director_of_photography = df.director_of_photography.fillna('')
df.production_companies = df.production_companies.fillna('')
df.production_countries = df.production_countries.fillna('')
df.writers = df.writers.fillna('')
df.music_composer = df.music_composer.fillna('')
df.genres = df.genres.fillna('')

supabase_movie_person = []
persons_list = {}
supabase_persons = []

supabase_movie_director = []
directors_list = {}
supabase_directors = []

supabase_movie_producer = []
producers_list = {}
supabase_producers = []

supabase_movie_writer = []
writers_list = {}
supabase_writers = []

supabase_movie_production_company = []
production_companies_list = {}
supabase_production_companies = []

supabase_movie_music_composer = []
music_composers_list = {}
supabase_music_composers = []

supabase_movie_photo_director = []
photo_directors_list = {}
supabase_photo_directors = []

supabase_movie_genre_name = []
supabase_movie_country_name = []

def generate_for_bulk_create():
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
                supabase_persons.append({"id": cast_id,"name": person})

            supabase_movie_person.append({"movie_id": row.id, "actor_id": persons_list[person]})

        # Directors
        directors = row.director.strip().split(",")
        for director in directors:
            director = director.strip()
            if director == '':
                continue
            elif director not in directors_list.keys():
                director_id = len(directors_list) + 1
                directors_list[director] = director_id
                supabase_directors.append({"id": director_id,"name": director})

            supabase_movie_director.append({"movie_id": row.id, "director_id": directors_list[director]})

        # Producers
        producers = row.producers.strip().split(",")
        for producer in producers:
            producer = producer.strip()
            if producer == '':
                continue
            elif producer not in producers_list.keys():
                producer_id = len(producers_list) + 1
                producers_list[producer] = producer_id
                supabase_producers.append({"id": producer_id,"name": producer})

            supabase_movie_producer.append({"movie_id": row.id, "producer_id": producers_list[producer]})

        # Writers
        writers = row.writers.strip().split(",")
        for writer in writers:
            writer = writer.strip()
            if writer == '':
                continue
            elif writer not in writers_list.keys():
                writer_id = len(writers_list) + 1
                writers_list[writer] = writer_id
                supabase_writers.append({"id": writer_id,"name": writer})

            supabase_movie_writer.append({"movie_id": row.id, "writer_id": writers_list[writer]})

        # Production Companies
        production_companies = row.production_companies.strip().split(",")
        for production_company in production_companies:
            production_company = production_company.strip()
            if production_company == '':
                continue
            elif production_company not in production_companies_list.keys():
                production_company_id = len(production_companies_list) + 1
                production_companies_list[production_company] = production_company_id
                supabase_production_companies.append({"id": production_company_id,"name": production_company})

            supabase_movie_production_company.append({"movie_id": row.id, "company_id": production_companies_list[production_company]})

        # Music Composers
        music_composers = row.music_composer.strip().split(",")
        for music_composer in music_composers:
            music_composer = music_composer.strip()
            if music_composer == '':
                continue
            elif music_composer not in music_composers_list.keys():
                music_composer_id = len(music_composers_list) + 1
                music_composers_list[music_composer] = music_composer_id
                supabase_music_composers.append({"id": music_composer_id,"name": music_composer})

            supabase_movie_music_composer.append({"movie_id": row.id, "composer_id": music_composers_list[music_composer]})

        # Directors of photography
        photo_directors = row.director_of_photography.strip().split(",")
        for photo_director in photo_directors:
            photo_director = photo_director.strip()
            if photo_director == '':
                continue
            elif photo_director not in photo_directors_list.keys():
                photo_director_id = len(photo_directors_list) + 1
                photo_directors_list[photo_director] = photo_director_id
                supabase_photo_directors.append({"id": photo_director_id,"name": photo_director})

            supabase_movie_photo_director.append({"movie_id": row.id, "dop_id": photo_directors_list[photo_director]})

        # Genres
        genres = row.genres.strip().split(",")
        for genre in genres:
            genre = genre.strip()
            if genre == '':
                continue

            supabase_movie_genre_name.append({"movie_id": row.id, "genre_name": genre})

        # Countries
        countries = row.production_countries.strip().split(",")
        for country in countries:
            country = country.strip()
            if country == '':
                continue

            supabase_movie_country_name.append({"movie_id": row.id, "country_name": country})

generate_for_bulk_create()

try: 
    # actors, movie_actor
    response_cast = (supabase.table("actors")
                    .insert(supabase_persons)
                    .execute())
    
    response_movie_cast = (supabase.table("movie_actor")
                           .insert(supabase_movie_person)
                           .execute())
    
    # directors, movie_director
    response_directors = (supabase.table("directors")
                        .insert(supabase_directors)
                        .execute())
    
    response_movie_directors = (supabase.table("movie_director")
                           .insert(supabase_movie_director)
                           .execute())
    
    # producers, movie_producer
    response_producers = (supabase.table("producers")
                        .insert(supabase_producers)
                        .execute())
    
    response_movie_producer = (supabase.table("movie_producer")
                            .insert(supabase_movie_producer)
                            .execute())
    
    # writers, movie_writer
    response_writers = (supabase.table("writers")
                    .insert(supabase_writers)
                    .execute())
    
    response_movie_writer = (supabase.table("movie_writer")
                           .insert(supabase_movie_writer)
                           .execute())
    
    # production_companies, movie_production_company
    response_production_companies = (supabase.table("production_companies")
                    .insert(supabase_production_companies)
                    .execute())
    
    response_movie_production_company = (supabase.table("movie_production_company")
                           .insert(supabase_movie_production_company)
                           .execute())
    
    # music_composers, movie_music_composer
    response_music_composers = (supabase.table("music_composers")
                    .insert(supabase_music_composers)
                    .execute())
    
    response_movie_music_composer = (supabase.table("movie_music_composer")
                           .insert(supabase_movie_music_composer)
                           .execute())
    
    # diretors_of_photography, movie_director_of_photography
    response_diretors_of_photography = (supabase.table("diretors_of_photography")
                    .insert(supabase_photo_directors)
                    .execute())
    
    response_movie_director_of_photography = (supabase.table("movie_director_of_photography")
                           .insert(supabase_movie_photo_director)
                           .execute())
    
    # movie_genre_name
    response_movie_genre_name = (supabase.table("movie_genre_name")
                    .insert(supabase_movie_genre_name)
                    .execute())
    
    # movie_country_name
    response_movie_country_name = (supabase.table("movie_country_name")
                           .insert(supabase_movie_country_name)
                           .execute())
    
except Exception as exception:
    print(exception)

time_sec = time.time() - start

print(f"Time: {round(time_sec // 60)} min {time_sec % 60:.3f} sec")