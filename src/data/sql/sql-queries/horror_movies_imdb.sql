
SELECT 	movies.title,
		imdb_rating imdb_score
FROM movies
JOIN ratings ON movies.id=ratings.movie_id
JOIN movie_genre ON movies.id=movie_genre.movie_id
JOIN genres ON movie_genre.genre_id=genres.id
WHERE 	genres.genre = 'Horror' 
		AND ratings.imdb_rating >= 7.5 
		AND ratings.imdb_votes > 100
		AND movies.release_date >= '2000-01-01'::date
		