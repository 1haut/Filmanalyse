WITH decade_genre AS (
	SELECT 	date_part('decade', movies.release_date) AS decade,
		genres.genre,
		COUNT(movies.id) AS movie_count
	FROM	genres
	LEFT outer JOIN movie_genre ON movie_genre.genre_id=genres.id
	FULL OUTER JOIN	movies ON movie_genre.movie_id=movies.id
	WHERE genre != 'TV Movie' AND date_part('decade', movies.release_date) >= '190'
	GROUP BY genre, decade
)

SELECT 	decade_genre.decade, 
		decade_genre.genre, 
		ROUND((decade_genre.movie_count / SUM(movie_count) OVER(
			PARTITION BY decade
		) * 100)::numeric, 2) AS percentage_per_decade
FROM decade_genre 