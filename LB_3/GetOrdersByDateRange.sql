CREATE DEFINER=`userr`@`localhost` PROCEDURE `GetOrdersByDateRange`(
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT *
    FROM orders
    WHERE order_date BETWEEN start_date AND end_date;
END