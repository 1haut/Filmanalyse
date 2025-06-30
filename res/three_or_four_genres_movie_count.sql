SELECT COUNT(*) AS three_or_four_genres
FROM (
	SELECT movies.id, movies.title, COUNT(genres.genre)
	FROM movie_genre
	JOIN movies ON movies.id=movie_genre.movie_id
	JOIN genres ON genres.id=movie_genre.genre_id
	GROUP BY movies.id, movies.title
	HAVING COUNT(genres.genre) in (3, 4)
	ORDER BY movies.id, movies.title
)