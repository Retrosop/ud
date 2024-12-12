SELECT ord_sale.`Дата_продажи`, ord_sale.`Код_товар`, goods.`Наименование`
FROM ord_sale, goods
WHERE ord_sale.`Дата_заказа` = CURDATE() and ord_sale.`Код_товар` = goods.`Код_товара`