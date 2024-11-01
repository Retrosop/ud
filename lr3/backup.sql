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

DELIMITER //
CREATE PROCEDURE glagolev_Parts_rename(PName VARCHAR(20))
BEGIN
  DECLARE Done INT DEFAULT 0;
  DECLARE S VARCHAR(20);
  DECLARE N,I INTEGER;
  DECLARE Cur1 CURSOR FOR SELECT Part_ID, Part_name FROM Parts WHERE Part_name=PName ORDER BY WEIGHT;
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;
  OPEN Cur1;
  SET I=1;
  REPEAT
    FETCH Cur1 INTO N,S;
    IF Done=0 THEN UPDATE Parts SET Part_name=CONCAT(S,'-',I) WHERE Part_ID=N;
    END IF;
  SET I=I+1;
  UNTIL Done END REPEAT;
  CLOSE Cur1;
END

//

CALL glagolev_Parts_rename('Car');