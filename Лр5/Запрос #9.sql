SELECT DISTINCT c.`Город`
FROM customer c
JOIN ord_sale o ON c.код_покупателя = o.код_покупателя
JOIN goods g ON o.код_товар = g.код_товара
WHERE c.область = 'Московская' 
AND g.наименование IN ('рога');