SELECT AVG(p.`Скидки`) AS Средняя_скидка
FROM Postav p
JOIN Customer c ON c.предприятие = p.`Название`
WHERE c.страна <> 'Россия';