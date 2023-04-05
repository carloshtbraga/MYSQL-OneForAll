SELECT 
  CASE 
    WHEN u.usuario_age <= 30 THEN 'Até 30 anos'
    WHEN u.usuario_age > 30 AND u.usuario_age <= 60 THEN 'Entre 31 e 60 anos'
    ELSE 'Maior de 60 anos'
  END AS faixa_etaria,
  COUNT(DISTINCT u.usuario_id) AS total_pessoas_usuarias,
  COUNT(f.usuario_id) AS total_favoritadas
FROM 
  usuarios AS u
LEFT JOIN favorite_songs AS f ON u.usuario_id = f.usuario_id
GROUP BY faixa_etaria
ORDER BY faixa_etaria

