WITH all_decades AS (
    SELECT DISTINCT date_part('decade', release_date) AS decade
    FROM movies
    WHERE release_date IS NOT NULL AND date_part('decade', release_date) >= 190
),
all_genres AS (
    SELECT DISTINCT genre
    FROM genres
    WHERE genre != 'TV Movie'
),
decade_genre_combos AS (
    SELECT 
        d.decade,
        g.genre
    FROM all_decades d
    CROSS JOIN all_genres g
),
movie_counts AS (
    SELECT 
        date_part('decade', m.release_date) AS decade,
        g.genre,
        COUNT(*) AS movie_count
    FROM movies m
    JOIN movie_genre mg ON mg.movie_id = m.id
    JOIN genres g ON g.id = mg.genre_id
    WHERE g.genre != 'TV Movie' AND m.release_date IS NOT NULL
    GROUP BY g.genre, date_part('decade', m.release_date)
),
decade_genre AS (
    SELECT 
        combos.decade,
        combos.genre,
        COALESCE(mc.movie_count, 0) AS movie_count
    FROM decade_genre_combos combos
    LEFT JOIN movie_counts mc 
        ON combos.decade = mc.decade AND combos.genre = mc.genre
)

SELECT 
    decade,
    genre,
    movie_count,
    ROUND((movie_count * 100.0 / NULLIF(SUM(movie_count) OVER (PARTITION BY decade), 0)), 2) AS percentage_per_decade
FROM decade_genre
ORDER BY genre, decade;
