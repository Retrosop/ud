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

DELIMITER //

CREATE PROCEDURE abrahin_GetEmployeesWithSalaryAbove (
    IN minSalary DECIMAL(10, 2)
)
BEGIN
    SELECT EmployeeID, EmployeeName, Salary
    FROM Employees
    WHERE Salary > minSalary;
END //

DELIMITER ;

CALL abrahin_GetEmployeesWithSalaryAbove(51000);

DELIMITER //
CREATE PROCEDURE abrahins_count(IN Input VARCHAR(20),OUT PNum INT)
BEGIN
  SELECT count(*) INTO PNum FROM LR3 WHERE ProductName=Input ;
END
//

CALL abrahins_count('Laptop HB', @s);
SELECT @s;