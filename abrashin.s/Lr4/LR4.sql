CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    email VARCHAR(255) UNIQUE,
    password_hash VARCHAR(255), 
);

DELIMITER //

CREATE PROCEDURE abrashin_insert_user(IN new_username VARCHAR(255))
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        DECLARE msg VARCHAR(255);
        SET msg = 'User with this username already exists';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END;

    INSERT INTO users (username)
    VALUES (new_username);
END //

DELIMITER ;

CALL abrashin_insert_user('Vova'); -- New user Vova
CALL abrashin_insert_user('Petr'); -- New user Petr
CALL abrashin_insert_user('Vova'); -- User with this username already exists