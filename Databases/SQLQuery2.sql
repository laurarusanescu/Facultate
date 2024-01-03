

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



