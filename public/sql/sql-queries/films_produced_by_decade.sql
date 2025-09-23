SELECT 	date_part('decade', movies.release_date) AS decade,
		genres.genre,
		NULLIF(COUNT(movies.id),0) AS total
FROM	genres
FULL OUTER JOIN	movie_genre ON movie_genre.genre_id=genres.id
INNER JOIN	movies ON movie_genre.movie_id=movies.id
WHERE genre != 'TV Movie' AND date_part('decade', movies.release_date) >= '190'
GROUP BY decade, genre
ORDER BY decade, genre
