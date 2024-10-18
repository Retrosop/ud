/*
	Тестовый запросов на создание хранимой процедуры
*/
DELIMITER //
CREATE PROCEDURE glagolev_Hello_World()
BEGIN
  SELECT('Hello, world!');
END
//
