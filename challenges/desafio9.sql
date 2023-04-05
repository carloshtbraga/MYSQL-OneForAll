SELECT 
	COUNT(musica_id) as musicas_no_historico
FROM historico as h
WHERE usuario_id = 1