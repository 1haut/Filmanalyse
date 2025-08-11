-- Prominent movies with a large difference in rating between TMDB and IMDB --
SELECT 	movies.title || ' (' || date_part('year', movies.release_date) || ')' AS film,
		tmdb_vote_average tmdb_score,
		imdb_rating imdb_score,
		ROUND(ABS(tmdb_vote_average - imdb_rating)::numeric, 2) AS rating_difference,
		CASE 
			WHEN date_part('year', movies.release_date) >= 2010 THEN 'True' ELSE 'False' 
			END AS "2010_or_after"
FROM movies
JOIN ratings
ON movies.id=ratings.movie_id
WHERE 	tmdb_vote_count > 1000 AND 
		imdb_votes > 100000 
		AND ROUND(ABS(tmdb_vote_average - imdb_rating)::numeric, 3) >= 1
ORDER BY rating_difference DESC
LIMIT 25
