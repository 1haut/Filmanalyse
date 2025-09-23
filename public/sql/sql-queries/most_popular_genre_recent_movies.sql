SELECT 	
		genres.genre,
		COALESCE(SUM(CASE WHEN movie_genre.movie_id IS NOT NULL THEN 1 ELSE 0 END), 0) films_count
FROM movie_genre
JOIN movies ON movies.id=movie_genre.movie_id
JOIN ratings ON movies.id=ratings.movie_id
LEFT JOIN genres ON genres.id=movie_genre.genre_id
WHERE 	ratings.tmdb_vote_average > 8 
		AND ratings.tmdb_vote_count > 5
		AND movies.release_date >= '2020-01-01'::date
		AND genre != 'Documentary'
GROUP BY genre
ORDER BY films_count DESC;