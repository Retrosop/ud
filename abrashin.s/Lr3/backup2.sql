PROCEDURE `abrashin_HelloWorld`()
BEGIN
   SELECT 'Hello World';
END

CALL abrashin_HelloWorld();

DELIMITER //
CREATE FUNCTION abrashin_Hello_World_1_3()
RETURNS VARCHAR(20)
BEGIN
  RETURN 'HELLO WORLD';
END
//

SELECT abrashin_Hello_World_1_3();

DELIMITER //
CREATE PROCEDURE abrashin_Hello_World_1_4()
BEGIN
  DECLARE S VARCHAR(20);
  SET S='HELLO WORLD';
  SELECT(S);
END
//

CALL abrashin_Hello_World_1_4();

DELIMITER //
CREATE PROCEDURE abrashin_Heavy()
BEGIN
  DECLARE S VARCHAR(20);
  SELECT weight INTO S FROM Parts ORDER BY Weight DESC LIMIT 1;
  SELECT(S);
END
//

CALL abrashin_Heavy();

DELIMITER //
CREATE PROCEDURE abrashin_Parts_count()
BEGIN
  DECLARE S VARCHAR(20);
  SELECT count(*) INTO S FROM Parts;
  SELECT(S);
END
//

CALL abrashin_Parts_count();