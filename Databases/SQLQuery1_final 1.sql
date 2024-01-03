

-- Create the Pizza table
CREATE TABLE Pizzas (
    ID INT PRIMARY KEY ,
    Name VARCHAR(50)
);

--Add the OvenID column to the Pizzas table
ALTER TABLE Pizzas
ADD OvenID INT;
-- Add a foreign key constraint to the Pizzas table
ALTER TABLE Pizzas
ADD FOREIGN KEY (OvenID) REFERENCES Oven(OvenID);


--Create the PizzaDetails table
CREATE TABLE PizzaDetails(
	ID INT,
	Price INT,
	Quality INT,
	Calories INT
);

ALTER TABLE PizzaDetails
ADD FOREIGN KEY (ID) REFERENCES Pizzas(ID);

-- Create the PizzaVegetarian table
CREATE TABLE PizzaVegetarians (
    ID INT,
    Name VARCHAR(50),
    CheeseQuantity INT,
    Sauces VARCHAR(50),
    Vegetables VARCHAR(200)
);

ALTER TABLE PizzaVegetarians
ADD FOREIGN KEY (ID) REFERENCES Pizzas(ID)

-- Create the PizzaCarnivora table
CREATE TABLE Ingedients (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    BaconQuantity INT,
    HamQuantity INT,
    CheeseQuantity INT,
    Sauces VARCHAR(50),
    Vegetables VARCHAR(200)
);

ALTER TABLE Ingredients
ADD FOREIGN KEY (ID) REFERENCES Pizzas(ID)

-- Create the PizzaTopping table
CREATE TABLE Toppings (
    PizzaID INT,
    ToppingID INT PRIMARY KEY
);

-- Create the HasMany table
CREATE TABLE HasMany (
    PizzaID INT,
    ToppingID INT,
    Quantity INT,
    PRIMARY KEY (PizzaID, ToppingID),
    FOREIGN KEY (PizzaID) REFERENCES Pizzas(ID),
    FOREIGN KEY (ToppingID) REFERENCES Toppings(ToppingID)
);

--Create the Oven table
CREATE TABLE Oven(
	OvenID INT PRIMARY KEY,
	OvenName VARCHAR(50),
	Capacity INT
);

--Create a pizzashop table
CREATE TABLE PizzaShop (
    ShopID INT PRIMARY KEY,
	Adress VARCHAR(100),
    ShopName VARCHAR(50)
);

-- Add a foreign key column to the Pizzas table
ALTER TABLE Pizzas
ADD ShopID INT;

-- Add a foreign key constraint to the Pizzas table
ALTER TABLE Pizzas
ADD FOREIGN KEY (ShopID) REFERENCES PizzaShop(ShopID);

ALTER TABLE Pizzas
ADD ID INT NOT NULL;

ALTER TABLE PizzasDetails
ADD ID INT NOT NULL;

ALTER TABLE Ingredients
ADD ID INT NOT NULL;

ALTER TABLE PizzaVegetarians
ADD ID INT NOT NULL;

ALTER TABLE HasMany
ADD PizzaID INT NOT NULL;

ALTER TABLE Toppings
ADD ToppingID INT NOT NULL;

insert into Oven(OvenID, Capacity) values (1, 5), (2, 7)
insert into PizzaShop(ShopID, ShopName, Adress) values (1, 'Pizzerias', 'St. Augustin')
insert into Pizzas(ID, Name , OvenID, ShopID) values (1, 'Margherita', 2, 1), (2, 'Capriciosa', 1, 1), (3, 'Quatro Formagi', 2, 1)
insert into Ingredients(ID, Name, BaconQuantity, HamQuantity, CheeseQuantity,Sauces, Vegetables) values(1,'Margherita', 0, 0, 200, 'tomato sauce', 'tomato'), (2,'Capriciosa', 100, 100, 100, 'tomato sauce', 'mushrooms, corn, tomato')
insert into Pizzas(ID, Name , OvenID, ShopID) values (4, 'Margherita', 1, 1), (5, 'Capriciosa', 2, 1), (6, 'Quatro Formagi', 2, 1)

update Ingredients 
set Name='Capriciosa' where Name like 'C__%' and BaconQuantity>10

delete from Ingredients
where CheeseQuantity between 150 and 200 and Name is not null
--a)
select s1.Name 
from Pizzas s1
where Name like 'Q_%'
union
select s2.ShopName
from PizzaShop s2
where ShopName like 'P_%'
order by s1.Name

select s1.Name 
from Pizzas s1
where Name like 'Q_%'
intersect
select s2.Name
from Pizzas s2
where Name like '%_i'
order by s1.Name

select s1.Name 
from Pizzas s1
where Name like 'Q_%'
union
select s2.ShopName
from PizzaShop s2
where ShopName like 'P_%'
order by s1.Name


select s1.Name 
from Pizzas s1
where Name like 'Q_%'
except
select s2.Name
from Pizzas s2
where ID >= 2
order by s1.Name

select * from Pizzas
select * from Ingredients
--b)
select *
from Pizzas p inner join Ingredients i on 


select *
from Pizzas p left outer join Ingredients i on p.ID=i.ID


select *
from PizzaShop ps right outer join Pizzas o on ps.ShopID=o.ShopID


select *
from Pizzas p full join Ingredients i on p.ID = i.ID full join PizzaShop ps on p.ShopId= ps.ShopID
--pe 3 tabele
--c)
select *
from Pizzas p inner join Ingredients i on p.ID=i.ID
where OvenID =2  and p.ID in (select p.ID from Pizzas p)

select ps.ShopID, ps.ShopName
from PizzaShop ps
where ShopID=1 and exists(select * from Pizzas p where p.ShopID = ps.ShopID)

--d)
select B.ID, B.OvenId
from (select p.ID, p.OvenID, i.ID as Ingredient    
		from Pizzas p inner join Ingredients i on p.ID=i.ID
		where p.Name like 'C_%') as B;

--e)
select p.Name, Sum(i.HamQuantity)
from Pizzas p inner join Ingredients i on p.ID = i.ID
group by p.Name
--todo
select p.ID, AVG(i.BaconQuantity)
from Pizzas p inner join Ingredients i on p.ID=i.ID
group by p.ID
having AVG(i.BaconQuantity)>=(select min(CheeseQuantity) from Ingredients)
--todo
select o.OvenID, AVG(o.Capacity)
from Oven o inner join Pizzas p on o.OvenID=p.ID
group by o.OvenID
having AVG(o.Capacity)>= (select min(Capacity) from Oven)

SELECT OvenID, COUNT(*) AS PizzaCount
FROM Pizzas
GROUP BY OvenID;


select DISTINCT i.ID
from Pizzas i

select TOP 2 ID, Name
from Pizzas

select * from Pizzas
