SELECT genres.genre, ROUND(AVG(ratings.tmdb_vote_average)::numeric, 2) vote_average
FROM movie_genre
JOIN movies ON movie_genre.movie_id=movies.id
JOIN ratings ON movies.id=ratings.movie_id
JOIN genres ON movie_genre.genre_id=genres.id
WHERE ratings.tmdb_vote_count IS NOT NULL
GROUP BY genres.genre;
