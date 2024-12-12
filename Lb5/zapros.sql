SELECT * FROM supkras;

SELECT supplier_id FROM supkras;

SELECT COUNT(*) AS total_suppliers FROM supkras;

SELECT * FROM supkras WHERE discount > 0.05;

SELECT * FROM ordkras;

SELECT * FROM ordkras WHERE order_date > '2024-12-01';

SELECT SUM(quantity_sold) AS total_sold FROM ordkras;

SELECT DISTINCT customer_id FROM ordkras;

SELECT * FROM ordkras WHERE price > 10000;

SELECT o.order_number, s.supplier_name
FROM ordkras o
JOIN supkras s ON o.supplier_id = s.supplier_id;

SELECT * FROM ordkras WHERE quantity_ordered > 10;

SELECT supplier_name, discount FROM supkras ORDER BY discount DESC;

SELECT customer_id, COUNT(*) AS order_count
FROM ordkras
GROUP BY customer_id;

SELECT * FROM ordkras WHERE notes LIKE '%заказ%';

SELECT * FROM supkras WHERE discount = 0;

SELECT order_date, COUNT(*) AS order_count
FROM ordkras
GROUP BY order_date;

SELECT * FROM supkras WHERE supplier_name LIKE 'О%';

SELECT * FROM ordkras WHERE order_date = '2024-12-03';

SELECT DISTINCT product_id FROM ordkras;

SELECT o.order_number, s.supplier_name, o.sale_date
FROM ordkras o
JOIN supkras s ON o.supplier_id = s.supplier_id
WHERE o.sale_date > '2024-12-01';



