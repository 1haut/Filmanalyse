WITH one_genre_mid AS (
	SELECT movies.id m_id
	FROM movie_genre
	JOIN movies ON movies.id=movie_genre.movie_id
	JOIN genres ON genres.id=movie_genre.genre_id
	GROUP BY movies.id, movies.title
	HAVING COUNT(genres.genre) = 1
)

SELECT genres.genre, COUNT(genres.genre) number_movies
FROM movie_genre
JOIN one_genre_mid ON one_genre_mid.m_id=movie_genre.movie_id
JOIN genres ON genres.id=movie_genre.genre_id
GROUP BY genres.genre
ORDER BY number_movies DESC