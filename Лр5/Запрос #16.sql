SELECT o.код_покупателя,c.предприятие,
   SUM(o.цена * o.заказано) AS общая_сумма,
   COUNT(*) AS количество_партий
FROM Ord_Sale o
JOIN Customer c ON o.код_покупателя = c.код_покупателя
WHERE o.код_товар = 28798
GROUP BY o.код_покупателя, c.предприятие
HAVING COUNT(*) = 7;