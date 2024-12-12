SELECT Город
FROM customer
GROUP BY Город
HAVING COUNT(Код_покупателя) < 3;