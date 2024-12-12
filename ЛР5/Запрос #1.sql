SELECT категория, COUNT(наименование) AS количество_наименований
FROM goods
GROUP BY категория
ORDER BY количество_наименований DESC
LIMIT 1;