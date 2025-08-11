WITH feature_movies AS (
	-- Most sources consider 40 minutes to be minimum length for a full movie --
	SELECT * FROM movies WHERE movies.runtime >= 40
)

SELECT 	date_part('year', feature_movies.release_date) AS year_of_release,
		ROUND(AVG(feature_movies.runtime)::numeric, 1) AS average_runtime
FROM feature_movies
GROUP BY year_of_release
HAVING COUNT(feature_movies) > 50
ORDER BY year_of_release DESC