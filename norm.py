import pandas as pd
from database import supabase

df = pd.read_csv("TMDB_filtered_movies.csv")

persons_list = {}
directors_list = {}
photo_directors_list = {}
producers_list = {}
writers_list = {}
production_companies_list = {}
composers_list = {}


for row in df.itertuples():
    persons = row.cast.strip().split(",")
    directors = row.director.strip().split(",")
    producers = row.producers.strip().split(",")
    directors_of_photograpy = row.director_of_photography.strip().split(",")
    writers = row.writers.strip().split(",")
    production_companies = row.production_companies.strip().split(",")
    composers = row.music_composer.strip().split(",")

    for person in persons:
        person = person.strip()
        if person == '':
            continue
        elif person in persons_list.keys():
            persons_list[person].append(row.id)
        else:
            persons_list[person] = []
            persons_list[person].append(row.id)

    for director in directors:
        director = director.strip()
        if director == '':
            continue
        elif director in directors_list.keys():
            directors_list[director].append(row.id)
        else:
            directors_list[director] = []
            directors_list[director].append(row.id)

    for producer in producers:
        producer = producer.strip()
        if producer == '':
            continue
        elif producer in producers_list.keys():
            producers_list[producer].append(row.id)
        else:
            producers_list[producer] = []
            producers_list[producer].append(row.id)

    for photo_director in directors_of_photograpy:
        photo_director = photo_director.strip()
        if directors_of_photograpy == '':
            continue
        elif directors_of_photograpy in photo_directors_list.keys():
            photo_directors_list[directors_of_photograpy].append(row.id)
        else:
            photo_directors_list[directors_of_photograpy] = []
            photo_directors_list[directors_of_photograpy].append(row.id)

    
    for writer in writers:
        writer = writer.strip()
        if writer == '':
            continue
        elif writer in writers_list.keys():
            writers_list[writer].append(row.id)
        else:
            writers_list[writer] = []
            writers_list[writer].append(row.id)

    for production_company in production_companies:
        production_company = production_company.strip()
        if production_company == '':
            continue
        elif production_company in production_companies_list.keys():
            production_companies_list[production_company].append(row.id)
        else:
            production_companies_list[production_company] = []
            production_companies_list[production_company].append(row.id)


    for composer in composers:
        composer = composer.strip()
        if composer == '':
            continue
        elif composer in composers_list.keys():
            composers_list[composer].append(row.id)
        else:
            composers_list[composer] = []
            composers_list[composer].append(row.id)
        
