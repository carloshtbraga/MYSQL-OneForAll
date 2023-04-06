SELECT
	ar.artista_name as artista,
    al.album_name as album,
    Count(s.artista_id) as pessoas_seguidoras
from artistas as ar
JOIN seguidores as s ON s.artista_id = ar.artista_id
JOIN albuns as al ON al.artista_id = s.artista_id
GROUP BY album, ar.artista_id
ORDER BY pessoas_seguidoras DESC, artista, album
    

