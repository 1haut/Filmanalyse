import pandas as pd
from database import supabase

df = pd.read_csv("TMDB_filtered_movies.csv")

persons_list = {}
directors_list = {}
directors_photo_list = {}
producers_list = {}
writers_list = {}
production_companies_list = {}
composers_list = {}


# for i, row in df.itertuples():
#     if row["id"] > 646460 and row["id"] < 646470:
#         persons = row["cast"].strip().split(",")
#         directors = row["directors"].strip().split(",")
#         # producers = row["producers"].strip().split(",")
#         # directors_of_photograpy = row["directors_of_photograpy"].strip().split(",")
#         # writers = row["writers"].strip().split(",")
#         # productions_companies = row["productions_companies"].strip().split(",")

#         for person in persons:
#             person = person.strip()
#             if persons_list[person]:
#                 persons_list[person].append(row["id"])
#                 # persons_list[person] = 
#                 # supabase.table("actors").insert({"name", person}).execute()
#             else:
#                 persons_list[person] = []

#         for director in directors:
#             director = director.strip()
#             if directors_list[director]:
#                 directors_list[director].append(row["id"])
#             else:
#                 directors_list[director] = []

df.cast = df.cast.fillna('')
df.director = df.director.fillna('')


for row in df.itertuples():
    # if row.id > 646460 and row.id < 646470:
    if  row.id < 100:
        print(row.id)
        persons = row.cast.strip().split(",")
        directors = row.director.strip().split(",")
        # producers = row["producers"].strip().split(",")
        # directors_of_photograpy = row["directors_of_photograpy"].strip().split(",")
        # writers = row["writers"].strip().split(",")
        # productions_companies = row["productions_companies"].strip().split(",")

        # for person in persons:
        #     person = person.strip()
        #     if person in persons_list.keys():
        #         persons_list[person].append(row.id)
        #         # persons_list[person] = 
        #         # supabase.table("actors").insert({"name", person}).execute()
        #     elif person == '':
        #         continue
        #     else:
        #         persons_list[person] = []
        #         directors_list[director].append(row.id)

        for director in directors:
            director = director.strip()
            if director == '':
                continue
            elif director in directors_list.keys():
                directors_list[director].append(row.id)
            else:
                directors_list[director] = []
                directors_list[director].append(row.id)



with open("result.txt", 'w') as file:
    file.write(str(directors_list))

