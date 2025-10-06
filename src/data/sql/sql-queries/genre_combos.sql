WITH movie_genre_2genres AS (
	SELECT movie_genre.movie_id id, genres.genre genre
	FROM (
		SELECT movie_genre.movie_id as mov_id
		FROM movie_genre
		GROUP BY movie_genre.movie_id
		HAVING COUNT(movie_genre.movie_id) = 2
	) AS trunc_movie_genre
	JOIN movie_genre ON trunc_movie_genre.mov_id=movie_genre.movie_id
	JOIN genres ON movie_genre.genre_id=genres.id
),
movie_genre_3genres AS (
	SELECT movie_genre.movie_id id, genres.genre genre
	FROM (
		SELECT movie_genre.movie_id as mov_id
		FROM movie_genre
		GROUP BY movie_genre.movie_id
		HAVING COUNT(movie_genre.movie_id) = 3
	) AS trunc_movie_genre
	JOIN movie_genre ON trunc_movie_genre.mov_id=movie_genre.movie_id
	JOIN genres ON movie_genre.genre_id=genres.id
)

SELECT t11.genre || ', ' || t12.genre as combination, COUNT(*) AS total
FROM movie_genre_2genres t11
JOIN movie_genre_2genres t12
ON t11.id=t12.id AND t11.genre > t12.genre
GROUP BY combination

UNION

SELECT 	t21.genre || ', ' || t22.genre || ', ' || t23.genre  as combination, 
		COUNT(*) AS total
FROM movie_genre_3genres t21
JOIN movie_genre_3genres t22 ON t21.id=t22.id AND t21.genre < t22.genre
JOIN movie_genre_3genres t23 ON t21.id=t23.id AND t22.genre < t23.genre
GROUP BY combination

ORDER BY total DESC
LIMIT 10

