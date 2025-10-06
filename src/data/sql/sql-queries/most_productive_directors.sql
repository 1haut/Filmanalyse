SELECT 	directors.name director, 
		COUNT(*) films_directed
FROM movie_director
JOIN directors ON movie_director.director_id = directors.id
GROUP BY directors.id
ORDER BY films_directed DESC
LIMIT 10;
