CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    password_hash VARCHAR(255), 
);

DELIMITER //

CREATE PROCEDURE get_users()
BEGIN
    DECLARE user_count INT;
    SELECT COUNT(*) INTO user_count FROM users;
    IF user_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Таблица пользователей пуста';;
    ELSE
        SELECT * FROM users;
    END IF;
END //

DELIMITER ;