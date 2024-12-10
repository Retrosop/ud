-- Создание таблицы users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Вставка данных в таблицу users
INSERT INTO users (username, email, password) VALUES
('user1', 'user1@example.com', 'password1'),
('user2', 'user2@example.com', 'password2'),
('user3', 'user3@example.com', 'password3'),
('user4', 'user4@example.com', 'password4'),
('user5', 'user5@example.com', 'password5'),
('user6', 'user6@example.com', 'password6'),
('user7', 'user7@example.com', 'password7'),
('user8', 'user8@example.com', 'password8'),
('user9', 'user9@example.com', 'password9'),
('user10', 'user10@example.com', 'password10');

-- Создание таблицы orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Вставка данных в таблицу orders
INSERT INTO orders (user_id, total_amount) VALUES
(1, 100.00),
(2, 150.50),
(3, 200.75),
(4, 50.00),
(5, 300.00),
(6, 120.25),
(7, 75.00),
(8, 90.00),
(9, 250.00),
(10, 60.00);

-- Создание триггера для проверки наличия заказов перед удалением пользователя
DELIMITER 

CREATE TRIGGER before_delete_user
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    DECLARE order_count INT;

    -- Проверяем, есть ли заказы у пользователя
    SELECT COUNT() INTO order_count
    FROM orders
    WHERE user_id = OLD.user_id;

    -- Если заказы есть, выбрасываем ошибку
    IF order_count  0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete user with existing orders!';
    END IF;
END 

DELIMITER ;