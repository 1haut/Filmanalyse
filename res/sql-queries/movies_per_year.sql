SELECT date_part('year', release_date) AS year_of_release, COUNT(*) movie_count
FROM movies
GROUP BY year_of_release
ORDER BY year_of_release DESC