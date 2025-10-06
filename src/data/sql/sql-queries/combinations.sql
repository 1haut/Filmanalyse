WITH movie_id_gen AS (
	SELECT movie_genre.movie_id id , genres.genre genre
	FROM movie_genre
	JOIN genres ON movie_genre.genre_id=genres.id
)

SELECT mg1.genre || ', ' || mg2.genre as combination, COUNT(*) AS total
FROM movie_id_gen mg1
JOIN movie_id_gen mg2
ON mg1.id=mg2.id AND mg1.genre > mg2.genre
GROUP BY combination

UNION

SELECT mg1.genre || ', ' || mg2.genre || ', ' || mg3.genre  as combination, COUNT(*) AS total
FROM movie_id_gen mg1
JOIN movie_id_gen mg2 ON mg1.id=mg2.id AND mg1.genre < mg2.genre
JOIN movie_id_gen mg3 ON mg1.id=mg3.id AND mg2.genre < mg3.genre
GROUP BY combination

ORDER BY total



