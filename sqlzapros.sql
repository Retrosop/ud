SELECT category, product_name FROM product;
SELECT last_name, first_name, patronymic, email, phone FROM customer;
SELECT supplier_name, address, phone FROM supplier;
SELECT order_code, order_date, sale_date FROM ord_sale;
SELECT product_name FROM product WHERE category = 'Автомобили';
SELECT supplier_name, discount FROM supplier WHERE discount > 10;
SELECT SUM(quantity_ordered) AS total_ordered FROM ord_sale;
SELECT SUM(quantity_sold) AS total_sold FROM ord_sale;
SELECT SUM(price * quantity_sold) AS total_sales FROM ord_sale;
SELECT order_code, order_date, sale_date FROM ord_sale WHERE customer_code = 1;
SELECT order_code, order_date, sale_date FROM ord_sale WHERE supplier_code = 2;
SELECT order_code, quantity_ordered FROM ord_sale WHERE quantity_ordered > 10;
SELECT product_code, quantity_sold FROM ord_sale WHERE quantity_sold > 5;
SELECT order_code, order_date FROM ord_sale WHERE order_date BETWEEN '2023-10-01' AND '2023-10-31';
SELECT last_name, first_name, patronymic FROM customer WHERE address LIKE '%Москва%';
SELECT supplier_name FROM supplier WHERE address LIKE '%Санкт-Петербург%';
SELECT order_code, price FROM ord_sale WHERE price > 10000;
SELECT order_code, product_code FROM ord_sale WHERE quantity_ordered > quantity_sold;
SELECT c.last_name, c.first_name, c.patronymic, SUM(os.quantity_ordered) AS total_ordered
FROM customer c
JOIN ord_sale os ON c.customer_code = os.customer_code
GROUP BY c.customer_code;