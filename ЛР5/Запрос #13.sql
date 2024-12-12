SELECT категория, COUNT(DISTINCT наименование) AS количество_наименований 
FROM Goods 
GROUP BY категория 
ORDER BY количество_наименований ASC 
LIMIT 1;