--lab4
create function checkInt(@n int)
returns int as
begin
	declare @no int 
	if @n>0 and @n<=100
		set @no = 1
	else
		set @no = 0
	return @no
end;

--check a varchar
create function checkVarchar(@v varchar(50))
returns bit as
begin 
	declare @b bit
	if @v LIKE '[a-z]%[a-z]'
		set @b = 1
	else
		set @b = 0
	return @b
end;


drop procedure addPizza
create procedure addPizza 
    @id int, 
    @name varchar(50), 
    @OvenID int, 
    @ShopID int, 
    @ExpirationDate int
as
begin
    if dbo.checkInt(@id)=1 and dbo.checkVarchar(@name)=1 and dbo.checkInt(@OvenID)=1 and dbo.checkInt(@ShopID)=1 and dbo.checkInt(@ExpirationDate)=1
    begin
        -- Check if OvenID exists in the Oven table
        if exists (select 1 from Oven where OvenID = @OvenID)
        begin
            insert into Pizzas(ID, Name, OvenID, ShopID, ExpirationDate) 
            values (@id, @name, @OvenID, @ShopID, @ExpirationDate)
            print 'value added'
            select * from Pizzas
        end
        else
        begin
            print 'OvenID does not exist in the Oven table'
            select * from Pizzas
        end
    end
    else
    begin
        print 'the parameters are not correct'
        select * from Pizzas
    end
end
go

drop procedure addOven
-- Modify the addOven procedure
create procedure addOven 
    @ovenID int, 
    @ovenName varchar(50), 
    @capacity int
as
begin 
    if dbo.checkInt(@ovenID)=1 and dbo.checkVarchar(@ovenName)=1 and dbo.checkInt(@capacity) = 1
    begin
        insert into Oven(OvenID, OvenNme, Capacity) 
        values (@ovenID, @ovenName, @capacity)
        print 'value added'
        select * from Oven
    end
    else
    begin
        print 'the parameters are not correct'
        select * from Oven
    end
end
go

-- Example usage
exec addOven 1, 'Zanussi', 3
exec addOven 2, 'Samsung', 5

exec addPizza 1, 'Margherita', 1, 1, 30 -- Assuming OvenID 1 exists in the Oven table
exec addPizza 2, 'Salami', 3, 1, 20 -- Assuming OvenID 3 does not exist in the Oven table

CREATE TABLE Logs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    TriggerDate DATETIME,
    TriggerType VARCHAR(10),
    AffectedTable VARCHAR(50),
    NoAffectedRows INT
);
drop trigger PizzasTrigger
-- Create the trigger for the Pizzas table
CREATE trigger PizzasTrigger
ON Pizzas
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @TriggerType VARCHAR(10)

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @TriggerType = 'UPDATE'
        ELSE
            SET @TriggerType = 'INSERT'
    END
    ELSE IF EXISTS (SELECT 1 FROM deleted)
        SET @TriggerType = 'DELETE'

    INSERT INTO Logs (TriggerDate, TriggerType, AffectedTable, NoAffectedRows)
    VALUES (GETDATE(), @TriggerType, 'Pizzas', @@ROWCOUNT)
END;

-- Create the trigger for the PizzaDetails table
CREATE TRIGGER PizzaDetailsTrigger
ON PizzaDetails
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @TriggerType VARCHAR(10)

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
            SET @TriggerType = 'UPDATE'
        ELSE
            SET @TriggerType = 'INSERT'
    END
    ELSE IF EXISTS (SELECT 1 FROM deleted)
        SET @TriggerType = 'DELETE'

    INSERT INTO Logs (TriggerDate, TriggerType, AffectedTable, NoAffectedRows)
    VALUES (GETDATE(), @TriggerType, 'PizzaDetails', @@ROWCOUNT)
END;