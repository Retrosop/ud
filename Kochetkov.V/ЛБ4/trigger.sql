CREATE TABLE ChangeLog (
    ChangeID INT PRIMARY KEY AUTO_INCREMENT,
    PartID INT,
    ChangeTime DATETIME,
    OldValue TEXT,
    NewValue TEXT,
    ChangeType VARCHAR(10)
);

DELIMITER //

CREATE TRIGGER BeforeUpdateParts
BEFORE UPDATE ON Parts
FOR EACH ROW
BEGIN
    INSERT INTO ChangeLog (PartID, ChangeTime, OldValue, NewValue, ChangeType)
    VALUES (OLD.PartID, NOW(), OLD.Value, NEW.Value, 'UPDATE');
END;
//

CREATE TRIGGER BeforeDeleteParts
BEFORE DELETE ON Parts
FOR EACH ROW
BEGIN
    INSERT INTO ChangeLog (PartID, ChangeTime, OldValue, NewValue, ChangeType)
    VALUES (OLD.PartID, NOW(), OLD.Value, NULL, 'DELETE');
END;
//

DELIMITER ;