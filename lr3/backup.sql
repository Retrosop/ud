/*
	Тестовый запросов на создание хранимой процедуры
*/
DELIMITER //
CREATE PROCEDURE glagolev_Hello_World()
BEGIN
  SELECT('Hello, world!');
END
//

CALL glagolev_Hello_World();


/*
	Тестовый запросов на создание хранимой процедуры
*/
DELIMITER //
CREATE FUNCTION glagolev_Hello_World2()
RETURNS VARCHAR(20)
BEGIN
  RETURN 'Hello, world!';
END
//

SELECT glagolev_Hello_World2();

DELIMITER //
CREATE PROCEDURE glagolev_Hello_World_1_4()
BEGIN
  DECLARE S VARCHAR(20);
  SET S='Hello, world!';
  SELECT(S);
END
//

CALL glagolev_Hello_World_1_4();

DELIMITER //
CREATE PROCEDURE glagolev_Heavy()
BEGIN
  DECLARE S VARCHAR(20);
  SELECT weight INTO S FROM Parts ORDER BY Weight DESC LIMIT 1;
  SELECT(S);
END
//

CALL glagolev_Heavy();