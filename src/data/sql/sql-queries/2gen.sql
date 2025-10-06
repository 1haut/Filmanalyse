SELECT movie_genre.movie_id id
FROM movie_genre
JOIN genres ON movie_genre.genre_id=genres.id
GROUP BY movie_genre.movie_id
HAVING COUNT(movie_genre.movie_id) = 2
ORDER BY movie_genre.movie_id
