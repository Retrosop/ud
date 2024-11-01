CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
);


DELIMITER //

CREATE PROCEDURE abrashin_DeleteZeroStockProducts()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE productId INT;
    
    DECLARE productCursor CURSOR FOR 
        SELECT id FROM products WHERE stock = 0;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN productCursor;
    
    read_loop: LOOP
        FETCH productCursor INTO productId;
        
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        DELETE FROM products WHERE id = productId;
    END LOOP;
    
    CLOSE productCursor;
END //

CALL abrashin_DeleteZeroStockProducts();