SELECT 	
		genres.genre name_genre,
		COUNT(*) films_count
FROM movie_genre
JOIN movies ON movies.id=movie_genre.movie_id
JOIN genres ON genres.id=movie_genre.genre_id
JOIN ratings ON movies.id=ratings.movie_id
WHERE 	ratings.tmdb_vote_average > 8 
		AND ratings.tmdb_vote_count > 100
		AND movies.release_date >= '2020-01-01'::date
GROUP BY name_genre
ORDER BY films_count DESC
LIMIT 10