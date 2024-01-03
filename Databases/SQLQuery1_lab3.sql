--Lab 3

--1. Add a new column
alter table Pizzas
add ExpirationDate int

--2. Remove a column 
alter table Pizzas
drop column ExpirationDate

--3. add a new column with default constraint
alter table Pizzas 
add ExpirationDate int default 5

--4. 
alter table Pizzas
add constraint df_5 default 5 for ExpirationDate 

--5. Remove default constraint from a column
alter table Pizzas 
drop constraint df_5;


--6. Create a new table
alter table Pizzas
add PizzasCalId int
alter table Pizzas 
drop column PizzasCalId

create table PizzasCalories(
	PizzasCalId int not null primary key,
	KalNumber int,
	Alergeni varchar(50)
	)

--7. delete table
drop table PizzasCalories

--8. create foreing key constraint on a new table
ALTER TABLE Pizzas
ADD CONSTRAINT PizzasCalIdInPizzas FOREIGN KEY (PizzasCalId) REFERENCES PizzasCalories(PizzasCalId);

--9. remove foreing key
alter table Pizzas
drop constraint PizzasCalIdInPizzas

--version table
create table DatabaseVersion(
	Version int not null
)


--create direct stored procedures

go

create procedure do_proc_1
as
begin
	alter table Pizzas
	add ExpirationDate int
	update DatabaseVersion set Version=1
end;

go

EXEC do_proc_1

go

create procedure undo_proc_1
as
begin
    -- Drop the column
    alter table Pizzas
    drop column ExpirationDate
	
	update DatabaseVersion set Version=0
end;

go
EXEC undo_proc_1

go

create procedure do_proc_2
as 
begin
	alter table Pizzas
	add constraint df_5 default 5 for ExpirationDate 
	
	update DatabaseVersion set Version=2
end;

go
EXEC do_proc_2

go

create procedure undo_proc_2
as 
begin
	alter table Pizzas 
	drop constraint df_5;
	
	update DatabaseVersion set Version=1
end;

go
EXEC undo_proc_2

go

create procedure do_proc_3
as 
begin
	create table PizzasCalories(
		PizzasCalId int not null primary key,
		KalNumber int,
		Alergeni varchar(50)
		)
	update DatabaseVersion set Version=3
end;

go
EXEC do_proc_3

go
drop procedure undo_proc_3
create procedure undo_proc_3
as 
begin
	drop table PizzasCalories
	
	update DatabaseVersion set Version=2
end;

go
EXEC undo_proc_3

go
create procedure do_proc_4
as 
begin 
	ALTER TABLE Pizzas
	ADD CONSTRAINT PizzasCalIdInPizzas FOREIGN KEY (PizzasCalId) REFERENCES PizzasCalories(PizzasCalId);
	
	update DatabaseVersion set Version=4
end;

go
EXEC do_proc_4

go

create procedure undo_proc_4
as 
begin
	alter table Pizzas
	drop constraint PizzasCalIdInPizzas
	
	update DatabaseVersion set Version=3
end;

go
EXEC do_proc_4

go
go
-- Main stored procedure
alter procedure goToVersion
    @DesiredVersion int
as
begin
    declare @CurrentVersion int;
	select @CurrentVersion = Version from DatabaseVersion;

	if(isnumeric(@DesiredVersion)=0)
	BEGIN
		raiserror('Incorrect input, please write an integer',16,1)
		return -1
	end
	else if(@DesiredVersion < 0 or @DesiredVersion > 4)
		begin
			raiserror('input needs to be between 1 and 5', 16, 1)
			return -1
		end
	else if(@DesiredVersion = @CurrentVersion)
		begin
			print('The input version is the current one')
			return -1
		end
	else
	begin
	--do procedures
		while(@CurrentVersion < @DesiredVersion)
		begin
			if @CurrentVersion = 0
			begin
				exec do_proc_1
			end
			else if @CurrentVersion = 1
			begin
				exec do_proc_2
			end
			else if @CurrentVersion = 2
			begin
				exec do_proc_3
			end
			else if @CurrentVersion = 3
			begin
				exec do_proc_4
			end

		end

		--redo procedures
		while(@CurrentVersion > @DesiredVersion)
		begin

			if @CurrentVersion = 1
			begin
				exec undo_proc_1
			end
			else if @CurrentVersion = 2
			begin
				exec undo_proc_2
			end
			else if @CurrentVersion = 3
			begin
				exec undo_proc_3
			end
			else if @CurrentVersion = 4
			begin
				exec undo_proc_4
			end
		end
	end   
end;
go
exec do_proc_1
go

exec do_proc_2
go
exec do_proc_3
go
exec do_proc_4
go
exec undo_proc_1
go
exec undo_proc_2
go
exec undo_proc_3
go
exec undo_proc_4
go
insert into DatabaseVersion values (0)
delete from DatabaseVersion where Version=0
update DatabaseVersion set Version=0
select * from DatabaseVersion
exec goToVersion 4
go
select * from DatabaseVersion