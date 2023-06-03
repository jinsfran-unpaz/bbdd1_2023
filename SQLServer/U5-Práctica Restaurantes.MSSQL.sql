USE Restaurantes;
/* a El NOMBRE de Restaurante y NOMBRE de Plato, de aquellos platos que no pertenecen a alguna Cocina Típica.*/
SELECT r.Nombre, p.Nombre 
FROM Restaurante r JOIN Plato p ON r.CodRes = p.CodRes 
WHERE p.CODCT IS NULL; 

/* b El NOMBRE del Restaurante que tiene en su menú la mayor variedad de Cocinas Típicas.  (en MySQL usar LIMIT en lugar de TOP) */
SELECT TOP 1 r.Nombre
FROM Restaurante r JOIN Plato p ON r.CodRes = p.CodRes
WHERE p.CodCT IS NOT NULL
GROUP BY r.CodRes, r.Nombre 
ORDER BY COUNT(DISTINCT CodCT) DESC, r.CodRes; 

/* c El NOMBRE de o los platos que utilizan 250 gramos de algún Ingrediente.*/
SELECT p.Nombre
FROM Plato p JOIN Composicion c ON p.CodRes = c.CodRes AND c.NroPlato = c.NroPlato 
JOIN Ingrediente i ON c.CodI = i.CodI 
WHERE i.UnidadMedida = 'GRS' and c.Cantidad = 250; 

/* d El NOMBRE de los ingredientes que componen los platos que cocinan los chefs especializados en cocina típica “ALEMANA”.*/
SELECT DISTINCT i.Nombre
FROM Chef ch JOIN Especialidad e ON ch.CUIT = e.CUIT JOIN CocinaTipica ct ON e.CodCT = ct.CodCT 
JOIN Restaurante r ON ch.CUIT = r.CUIT JOIN Plato p ON r.CodRes = p.CodRes
JOIN Composicion co ON p.CodRes = co.CodRes AND p.NroPlato = co.NroPlato
JOIN Ingrediente i ON co.CodI = i.CodI 
WHERE ct.Tipo = 'Alemana'; 

/* e El (o los) TIPO de cocina típica en que se especializan los chefs que cocinan platos incluyendo el ingrediente “CILANTRO”. */
SELECT DISTINCT ct.TIPO
FROM Chef ch JOIN Especialidad e ON ch.CUIT = e.CUIT JOIN CocinaTipica ct ON e.CodCT = ct.CodCT
JOIN Restaurante r ON ch.CUIT = r.CUIT JOIN Plato p ON r.CodRes = p.CodRes 
JOIN Composicion co ON p.CodRes = co.CodRes AND p.NroPlato = co.NroPlato  
JOIN Ingrediente i ON co.CodI = i.CodI 
WHERE i.Nombre = 'Cilantro'; 

/* f El TIPO de cocina típica en la cual no clasifica plato alguno, ni se especializa Chef alguno.  */
SELECT TIPO 
FROM CocinaTipica 
WHERE CodCT NOT IN (SELECT CodCT FROM Especialidad) AND 
CodCT NOT IN (SELECT CodCT FROM Plato WHERE CODCT IS NOT NULL); 

/* g El NOMBRE de los restaurantes para los cuales se cumple que su menú incluye platos que clasifican en algunas de las cocinas típicas en las cuales se especializa el chef que cocina en el restaurante. */
SELECT DISTINCT r.Nombre 
FROM Restaurante r JOIN Plato p ON r.CodRes = p.CodRes
JOIN Chef ch ON r.CUIT = ch.CUIT JOIN Especialidad e ON ch.CUIT = e.CUIT  
WHERE e.CodCT = p.CodCT; 

/* h El NOMBRE de los restaurantes para los cuales se cumple que su menú incluye platos que clasifican en alguna cocina típica en la cual no se especializa el chef que cocina en el restaurante.  */
SELECT  DISTINCT r.Nombre 
FROM Restaurante r JOIN Plato p ON r.CodRes = p.CodRes 
WHERE p.CodCT NOT IN ( 
SELECT e.CodCT 
FROM Chef ch JOIN Especialidad e ON ch.CUIT = e.CUIT 
WHERE ch.CUIT = r.CUIT); 

/* i El NOMBRE de los ingredientes que participan, en la composición de platos, en alguna cocina típica.  */
SELECT DISTINCT i.Nombre 
FROM Ingrediente i JOIN Composicion co ON i.CodI = co.CodI 
JOIN Plato p ON co.CodRes = p.CodRes AND co.NroPlato = p.NroPlato 
WHERE p.CODCT IS NOT NULL; 

/* j El NOMBRE de los ingredientes que participan, en la composición de platos, en todas las cocinas típicas.  */
SELECT i.Nombre 
FROM Ingrediente i JOIN Composicion co ON i.CodI = co.CodI 
JOIN Plato p ON co.CodRes = p.CodRes AND co.NroPlato = p.NroPlato 
WHERE p.CodCT IS NOT NULL 
GROUP BY i.Nombre 
HAVING COUNT(DISTINCT p.CodCT) = (SELECT COUNT(*) FROM CocinaTipica); 

/* k El NOMBRE del o los chefs que trabajan en más de un Restaurante.  */
SELECT ch.Nombre 
FROM Restaurante r JOIN Chef ch ON r.CUIT = ch.CUIT 
GROUP BY r.CUIT, ch.Nombre 
HAVING COUNT(r.CodRes) > 1; 
