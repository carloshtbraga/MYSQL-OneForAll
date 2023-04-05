SELECT
    COUNT(m.musica_id) AS cancoes, 
    COUNT(DISTINCT ar.artista_id) AS artistas,
    COUNT( DISTINCT al.album_id) as albuns 
FROM musicas AS m
JOIN albuns AS al ON al.album_id = m.album_id
JOIN artistas AS ar ON ar.artista_id = al.artista_id

-- 