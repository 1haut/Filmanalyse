SELECT 	date_part('decade', movies.release_date) AS decade,
		genres.genre,
		ROUND(AVG(ratings.tmdb_vote_average)::numeric, 2) AS rating
FROM	movie_genre
FULL OUTER JOIN	movies ON movie_genre.movie_id=movies.id
FULL OUTER JOIN	genres ON movie_genre.genre_id=genres.id
FULL OUTER JOIN ratings ON movies.id=ratings.movie_id
WHERE date_part('decade', movies.release_date) >= '190'
		AND genre != 'TV Movie'
GROUP BY decade, genre
ORDER BY decade


