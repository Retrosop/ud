SELECT COUNT(DISTINCT c.код_покупателя) AS количество_покупателей
FROM customer c
JOIN Ord_Sale os ON c.код_покупателя = os.код_покупателя
JOIN goods g ON os.код_товар = g.код_товара
WHERE g.наименование = 'рога';