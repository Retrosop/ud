
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL
);

DELIMITER //


CREATE PROCEDURE get_products()
BEGIN
    DECLARE product_count INT;


    SELECT COUNT(*) INTO product_count FROM products;


    IF product_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No products found!';
    ELSE
        SELECT * FROM products;
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE DEFINER=`bh35910_student1711`@`%` TRIGGER `Parts_after_insert`
AFTER INSERT ON `Parts`
FOR EACH ROW 
BEGIN
    UPDATE Projects
    SET TotalCost = TotalCost + NEW.Cost
    WHERE ProjectID = NEW.ProjectID;
END; //