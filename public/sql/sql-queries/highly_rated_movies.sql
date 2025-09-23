SELECT 	movies.title,
		ratings.tmdb_vote_average AS tmdb_score, 
		ratings.imdb_rating imdb_score
FROM movies
JOIN ratings
ON movies.id=ratings.movie_id
WHERE ratings.tmdb_vote_average > 8 AND ratings.tmdb_vote_count > 10
