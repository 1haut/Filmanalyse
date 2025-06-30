SELECT 	
		actors.name,
		COUNT(*) films_count
FROM movie_actor 
JOIN movies ON movies.id=movie_actor.movie_id
JOIN ratings ON movies.id=ratings.movie_id
JOIN actors ON actors.id=movie_actor.actor_id
WHERE 	ratings.tmdb_vote_average > 8 
		AND ratings.tmdb_vote_count > 10
		AND movies.release_date >= '2020-01-01'::date
GROUP BY actors.name
HAVING COUNT(*)
ORDER BY films_count DESC