SELECT 	
		date_part('year', movies.release_date) AS year_of_release,
		COUNT(movies.title) AS titles_count,
		ROUND(AVG(movies.budget)) AS budget, 
		ROUND(AVG(movies.revenue)) AS box_office,
		ROUND(AVG(movies.revenue - movies.budget)) AS profit,
		ROUND(AVG(movies.revenue - movies.budget) / AVG(movies.budget) * 100) AS roi
FROM movies
WHERE 	movies.budget IS NOT NULL
		AND movies.revenue IS NOT NULL
GROUP BY year_of_release
ORDER BY year_of_release DESC