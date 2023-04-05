SELECT 
	ar.artista_name as artista,
    al.album_name as album
FROM artistas as ar
JOIN albuns as al ON ar.artista_id = al.artista_id
WHERE ar.artista_name = 'Elis Regina'
