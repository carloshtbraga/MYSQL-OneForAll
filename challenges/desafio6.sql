SELECT MIN(p.plano_price) as faturamento_minimo,
 MAX(p.plano_price) as faturamento_maximo,
 ROUND(AVG(p.plano_price),2) as faturamento_medio,
 SUM(p.plano_price) as faturamento_total from planos as p
 join usuarios as u on u.plano_id = p.plano_id
 
