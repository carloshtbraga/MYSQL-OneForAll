SELECT
  artista_name AS artista,
  CASE   
    WHEN COUNT(f.musica_id) in (1,2) THEN 'C'
	WHEN COUNT(f.musica_id) in (3,4) THEN 'B'
    WHEN COUNT(f.musica_id) >= 5 THEN 'A'
    ELSE '-'
  END AS ranking
FROM artistas AS artista
    JOIN albuns AS al ON al.artista_id = artista.artista_id
    JOIN musicas AS mu ON mu.album_id = al.album_id
    LEFT JOIN favorite_songs AS f ON f.musica_id = mu.musica_id

GROUP BY artista
ORDER BY
CASE ranking
    WHEN 'C' THEN 3
    WHEN 'B' THEN 2
    WHEN 'A' THEN 1
    WHEN '-' THEN 4
  END