WITH big_budget_flops as (
	SELECT 	
		movies.id,
		movies.title,
		movies.revenue,
		movies.budget
	FROM movies
	WHERE 	
			budget >= 20000000 AND
			(revenue - budget) / budget <= -0.2
			AND revenue > 0 -- Filter streaming movies
) 

SELECT 	
		directors.name,
		COUNT(*) AS total
FROM big_budget_flops bbf
JOIN movie_director ON bbf.id=movie_director.movie_id
JOIN directors ON movie_director.director_id=directors.id
GROUP BY directors.name
ORDER BY total DESC
LIMIT 10