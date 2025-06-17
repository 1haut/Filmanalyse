CREATE TABLE languages (
  "abbreviation" char(2) PRIMARY KEY,
  "english_name" varchar(40),
  "native_name" text
);

CREATE TABLE "movies" (
  "id" INTEGER PRIMARY KEY NOT NULL,
  "imdb_id" varchar(10),
  "title" varchar(100),
  "status" varchar(25),
  "release_date" date,
  "runtime" numeric,
  "original_language" char(2) REFERENCES languages(abbreviation),
  "languages" text,
  "budget" numeric,
  "revenue" numeric
);


CREATE TABLE "genres" (
  "id" SERIAL PRIMARY KEY,
  "genre" varchar(20)
);

CREATE TABLE "ratings" (
  "movie_id" integer UNIQUE REFERENCES movies(id),
  "tmdb_vote_average" float,
  "tmdb_vote_count" numeric,
  "tmdb_popularity" float,
  "imdb_rating" float,
  "imdb_votes" numeric
);

CREATE TABLE "countries" (
  "id" serial PRIMARY KEY,
  "name" varchar(50),
  "abbreviation" char(2)
);

CREATE TABLE "movie_genre" (
  "movie_id" integer NOT NULL REFERENCES movies(id),
  "genre_id" integer REFERENCES genres(id)
);

CREATE TABLE "actors" (
  "id" integer PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_actors" (
  "movie_id" integer NOT NULL REFERENCES movies(id),
  "actor_id" integer REFERENCES actors(id)
);

CREATE TABLE "directors" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_director" (
  "movie_id" integer NOT NULL REFERENCES movies(id),
  "director_id" integer REFERENCES directors(id)
);

CREATE TABLE "diretor_of_photography" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_diretor_of_photography" (
  "movie_id" integer NOT NULL REFERENCES movies(id),
  "dop_id" integer REFERENCES diretor_of_photography(id)
);

CREATE TABLE "writers" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_writer" (
  "movie_id" integer NOT NULL REFERENCES movies(id),
  "writer_id" integer REFERENCES writers(id)
);

CREATE TABLE "producers" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_producer" (
  "movie_id" integer NOT NULL REFERENCES movies(id),
  "producer_id" integer REFERENCES producers(id)
);

CREATE TABLE "music_composers" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_music_composer" (
  "movie_id" integer NOT NULL REFERENCES movies(id),
  "composer_id" integer REFERENCES music_composers(id)
);

CREATE TABLE "production_companies" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_production_company" (
  "movie_id" integer NOT NULL REFERENCES movies(id),
  "company_id" integer REFERENCES production_companies(id)
);

CREATE TABLE "movie_country" (
  "movie_id" integer NOT NULL REFERENCES movies(id),
  "country_id" integer REFERENCES countries(id)
);