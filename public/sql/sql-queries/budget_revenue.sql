SELECT 	date_part('year', movies.release_date) AS year_of_release,
		ROUND(AVG(movies.budget)) AS budget,
		ROUND(AVG(movies.revenue)) AS revenue,
		ROUND((AVG(movies.revenue) - AVG(movies.budget)) / AVG(movies.budget) * 100) AS roi
FROM movies
WHERE date_part('year', movies.release_date) >= 191 
	AND revenue > 0
GROUP BY year_of_release
ORDER BY year_of_release DESC