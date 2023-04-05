SELECT
  album_name AS album,
  COUNT(f.musica_id) AS favoritadas

FROM favorite_songs AS f
    INNER JOIN musicas AS m ON m.musica_id = f.musica_id
    INNER JOIN albuns AS a ON a.album_id = m.album_id

GROUP BY a.album_id
ORDER BY favoritadas DESC, album
LIMIT 3