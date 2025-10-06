WITH big_budget_flops as (
	SELECT 	
		m.id,
		m.title,
		m.revenue,
		m.budget
	FROM movies m
	JOIN ratings r ON m.id=r.movie_id
	WHERE 	
			budget >= 20000000 AND
			(revenue - budget) / budget <= -0.2 --
			AND revenue > 0 -- Filter streaming movies
) 

SELECT 	
		a.name,
		COUNT(*) AS total
FROM big_budget_flops bbf
JOIN movie_actor ma ON bbf.id=ma.movie_id
JOIN actors a ON ma.actor_id=a.id
GROUP BY a.name
ORDER BY total DESC
