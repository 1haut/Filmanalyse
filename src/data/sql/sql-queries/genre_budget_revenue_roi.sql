SELECT 	gen.genre,
		ROUND(AVG(mov.budget)) AS budget,
		ROUND(AVG(mov.revenue)) AS box_office,
		ROUND((AVG(mov.revenue) - AVG(mov.budget)) / AVG(mov.budget) * 100) AS roi
FROM genres gen
JOIN movie_genre m_gen ON gen.id=m_gen.genre_id
JOIN movies mov ON m_gen.movie_id=mov.id
WHERE 	genre != 'TV Movie' 
		AND mov.budget >= 1000
GROUP BY gen.genre	
ORDER BY budget DESC