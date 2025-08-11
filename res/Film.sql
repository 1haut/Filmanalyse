CREATE TABLE "movies" (
  "id" serial PRIMARY KEY NOT NULL,
  "imdb_id" varchar(10),
  "title" text,
  "status" varchar(25),
  "release_date" date,
  "runtime" numeric,
  "original_language" char(2),
  "languages" text,
  "budget" numeric,
  "revenue" numeric
);

CREATE TABLE "languages" (
  "abbreviation" char(2) PRIMARY KEY,
  "english_name" varchar(40),
  "native_name" text
);

CREATE TABLE "genres" (
  "id" serial PRIMARY KEY,
  "genre" varchar(20)
);

CREATE TABLE "ratings" (
  "movie_id" integer PRIMARY KEY NOT NULL,
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
  "movie_id" integer NOT NULL,
  "genre_id" integer
);

CREATE TABLE "movie_actor" (
  "movie_id" integer NOT NULL,
  "actor_id" integer
);

CREATE TABLE "actors" (
  "id" integer PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_director" (
  "movie_id" integer NOT NULL,
  "director_id" integer
);

CREATE TABLE "directors" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_director_of_photography" (
  "movie_id" integer NOT NULL,
  "dop_id" integer
);

CREATE TABLE "director_of_photography" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_writer" (
  "movie_id" integer NOT NULL,
  "writer_id" integer
);

CREATE TABLE "writers" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_producer" (
  "movie_id" integer NOT NULL,
  "producer_id" integer
);

CREATE TABLE "producers" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_music_composer" (
  "movie_id" integer NOT NULL,
  "composer_id" integer
);

CREATE TABLE "music_composers" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_production_company" (
  "movie_id" integer NOT NULL,
  "company_id" integer
);

CREATE TABLE "production_companies" (
  "id" serial PRIMARY KEY,
  "name" text
);

CREATE TABLE "movie_country" (
  "movie_id" integer NOT NULL,
  "country_id" integer
);

ALTER TABLE "ratings" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_genre" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_genre" ADD FOREIGN KEY ("genre_id") REFERENCES "genres" ("id");

ALTER TABLE "movie_actor" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_actor" ADD FOREIGN KEY ("actor_id") REFERENCES "actors" ("id");

ALTER TABLE "movie_director" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_director" ADD FOREIGN KEY ("director_id") REFERENCES "directors" ("id");

ALTER TABLE "movie_director_of_photography" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_director_of_photography" ADD FOREIGN KEY ("dop_id") REFERENCES "director_of_photography" ("id");

ALTER TABLE "movie_writer" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_writer" ADD FOREIGN KEY ("writer_id") REFERENCES "writers" ("id");

ALTER TABLE "movie_producer" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_producer" ADD FOREIGN KEY ("producer_id") REFERENCES "producers" ("id");

ALTER TABLE "movie_music_composer" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_music_composer" ADD FOREIGN KEY ("composer_id") REFERENCES "music_composers" ("id");

ALTER TABLE "movie_production_company" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_production_company" ADD FOREIGN KEY ("company_id") REFERENCES "production_companies" ("id");

ALTER TABLE "movie_country" ADD FOREIGN KEY ("movie_id") REFERENCES "movies" ("id");

ALTER TABLE "movie_country" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id");

ALTER TABLE "languages" ADD FOREIGN KEY ("abbreviation") REFERENCES "movies" ("original_language");
