SELECT
	CASE
		WHEN rat.tmdb_vote_average < 2 THEN 'Awful (<2.0)'
		WHEN rat.tmdb_vote_average < 3 AND rat.tmdb_vote_average >= 2 THEN 'Bad (2.0+)'
		WHEN rat.tmdb_vote_average < 4 AND rat.tmdb_vote_average >= 3 THEN 'Poor (3.0+)'
		WHEN rat.tmdb_vote_average < 5 AND rat.tmdb_vote_average >= 4 THEN 'Mediocre (4.0+)'
		WHEN rat.tmdb_vote_average < 6 AND rat.tmdb_vote_average >= 5 THEN 'Decent (5.0+)'
		WHEN rat.tmdb_vote_average < 7 AND rat.tmdb_vote_average >= 6 THEN 'Good (6.0+)'
		WHEN rat.tmdb_vote_average < 8 AND rat.tmdb_vote_average >= 7 THEN 'Great (7.0+)'
		ELSE 'Excellent (8.0+)'
	END AS "rating_scale",
	ROUND(AVG(mov.revenue)) AS avg_revenue
FROM movies mov
JOIN ratings rat ON mov.id = rat.movie_id
WHERE revenue > 0
	AND rat.tmdb_vote_average IS NOT NULL
	AND rat.tmdb_vote_count >= 10
GROUP BY rating_scale
ORDER BY MIN(rat.tmdb_vote_average);


