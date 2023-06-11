
from functions.classes_and_functions import VectorRepository


def greet():
    print("Welcome to our program that helps students perform simple operations with vectors. :)")
    print("Here are a list of operations that you can use:")
    print("0.Stop the program.")
    print("1.Add one vector to the repository.")
    print("2.Get all vectors")
    print("3.Get a vector at a given index")
    print("4.Update a vector at a given index")
    print("5.Update a vector identified by name or id")
    print("6.Delete a vector by index")
    print("7.Delete a vector by name or id")
    print("8.Plot all points in a coordinate system")


greet()
c = 1

repo = VectorRepository()


while c != 0:
    c = int(input("Choose your command:"))
    if 0 < c < 8:
        if c == 1:
            name = int(input("ID = "))
            color = str(input("color = "))
            type = int(input("type = "))
            values = list(input("values = "))
            repo.AddVector(name, color, type, values)

        if c == 2:
            repo.GetAllVectors()

        if c == 3:
            index = int(input("index = "))
            repo.GetVectorAtIndex(index)

        if c == 4:
            index = int(input("index = "))
            name = int(input("ID = "))
            color = str(input("color = "))
            type = int(input("type = "))
            values = list(input("values = "))
            repo.UpdateVectorAtIndex(index, name, color, type, values)

        if c == 5:
            name = input("name = ")
            color = str(input("color = "))
            type = int(input("type = "))
            values = list(input("values = "))
            repo.UpdatePointByName(name, color, type, values)

        if c == 6:
            index = int(input("index = "))
            repo.DelVectorByIndex(index)

        if c == 7:
            name = input("name or id = ")
            repo.DelVectorByName(name)

        if c == 8:
            repo.PlotAllPoints()