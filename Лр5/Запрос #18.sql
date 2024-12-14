SELECT DISTINCT o.цена
FROM Goods g
JOIN Ord_Sale o ON g.код_товара = o.код_товар
WHERE g.категория = 2;