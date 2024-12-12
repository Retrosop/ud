CREATE TABLE products (
    ProductId INT NOT NULL PRIMARY KEY,
    Code VARCHAR(5),
    Name VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
);

INSERT INTO products (ProductId, Code, Name, UnitPrice) VALUES
(1, 'P001', 'Product 1', 10.99),
(2, 'P002', 'Product 2', 15.49),
(3, 'P003', 'Product 3', 7.99),
(4, 'P004', 'Product 4', 22.50),
(5, 'P005', 'Product 5', 5.75);

BEGIN TRANSACTION;

DECLARE @ProductId INT = 1; -- Замените на ID продукта
DECLARE @NewPrice DECIMAL(10, 2) = 99.99; -- Замените на новую цену

IF EXISTS (SELECT 1 FROM products WHERE ProductId = @ProductId)
BEGIN
    UPDATE products
    SET Price = @NewPrice
    WHERE ProductId = @ProductId;
END
ELSE
BEGIN
    RAISERROR('Продукт не найден', 16, 1);
    ROLLBACK TRANSACTION;
    RETURN;
END

COMMIT TRANSACTION;