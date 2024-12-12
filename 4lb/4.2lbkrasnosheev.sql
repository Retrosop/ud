CREATE TABLE Parts (
    PartId INT NOT NULL PRIMARY KEY,
    ProjectId INT NOT NULL,
    PartName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL
);

INSERT INTO Parts (PartId, ProjectId, PartName, Quantity, UnitPrice) VALUES
(1, 101, 'Деталь A', 50, 2.50),
(2, 101, 'Деталь B', 30, 3.75),
(3, 102, 'Деталь C', 20, 5.00),
(4, 103, 'Деталь D', 15, 10.00),
(5, 104, 'Деталь E', 100, 1.25);

CREATE TRIGGER PreventDeleteParts
ON Parts
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @ProjectId INT;
    DECLARE @RemainingCount INT;
    DECLARE @MinRequiredCount INT = 5; -- Задайте минимальное количество деталей

    -- Получаем ID проекта из удаляемой записи
    SELECT @ProjectId = ProjectId FROM deleted;

    -- Получаем текущее количество оставшихся деталей для данного проекта
    SELECT @RemainingCount = COUNT(*)
    FROM Parts
    WHERE ProjectId = @ProjectId;

    -- Проверяем, достаточно ли деталей для выполнения проекта
    IF @RemainingCount <= @MinRequiredCount
    BEGIN
        RAISERROR('Невозможно удалить запись: недостаточно деталей для выполнения проекта.', 16, 1);
        RETURN;
    END

    -- Если проверка пройдена, выполняем удаление
    DELETE FROM Parts
    WHERE ProjectId = @ProjectId;
END;