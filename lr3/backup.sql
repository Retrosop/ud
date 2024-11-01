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

DELIMITER //
CREATE PROCEDURE glagolev_Parts_count()
BEGIN
  DECLARE S VARCHAR(20);
  SELECT count(*) INTO S FROM Parts;
  SELECT(S);
END
//


CALL glagolev_Parts_count();

DELIMITER //
CREATE PROCEDURE glagolev_Parts_count_1(IN Mat VARCHAR(20),OUT PNum INT)
BEGIN
  SELECT count(*) INTO PNum FROM Parts WHERE Material=Mat ;
END
//

SET @s=0;
CALL glagolev_Parts_count_1('Сталь',@s);
SELECT @s;