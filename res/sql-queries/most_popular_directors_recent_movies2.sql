SELECT 	
		directors.name name_director,
		COUNT(*) films_count
FROM movie_director  movie_director
JOIN movies ON movies.id=movie_director.movie_id
JOIN ratings ON movies.id=ratings.movie_id
JOIN directors ON directors.id=movie_director.director_id
WHERE 	ratings.tmdb_vote_average > 8 
		AND ratings.tmdb_vote_count > 10
		AND movies.release_date >= '2020-01-01'::date
GROUP BY directors.name
ORDER BY films_count DESC
LIMIT 10