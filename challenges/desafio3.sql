SELECT
	u.usuario_name AS pessoa_usuaria, 
	COUNT( h.musica_id) AS musicas_ouvidas,
	ROUND(SUM(m.musica_duration / 60),2) AS total_minutos
FROM usuarios AS u
JOIN historico AS h ON h.usuario_id = u.usuario_id 
JOIN musicas AS m ON m.musica_id = h.musica_id
GROUP BY u.usuario_name
ORDER BY u.usuario_name