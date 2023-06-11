from functions.functions import MyPoint
from functions.functions import RepositorPoint

def greet():
    print("Welcome to our program that helps students perform simple operations with points in two-dimentional space. :)")
    print("Here are a list of operations that you can use:")
    print("0.Stop the program.")
    print("1.Add one point to the repository.")
    print("2.Get all points")
    print("3.Get a point at a given index")
    print("4.Get all points of a given color")
    print("5.Get all points that are inside a given square (up-left corner and length given)")
    print("6.Get the minimum distance between two points")
    print("7.Update a point at a given index")
    print("8.Delete a point by index")
    print("9.Delete all points that are inside a given square")
    print("10.Plot all points in a chart")
    print("11. Get all the points ")
    print("12. Get all the points inside a rectangle")
    print("13. Update the color of a point given its coordinates")
    print("14. Delete all points that are inside a given circle")

greet()
c=1

repo = RepositorPoint()


while c !=0:
    c = int(input("Choose your command:"))
    if 0 < c < 15:
        if c == 1:
            x = int(input("x= "))
            y = int(input("y= "))
            color = str(input("Color of the point "))
            RepositorPoint.addPoint(x, y, color)

        elif c == 2:
            print(repo.getAllPoints())

        elif c == 3:
            index = int(input("The position of the point: "))
            RepositorPoint.getPointAtIndex(index)

        elif c == 4:
            color = str(input("Color of the points "))
            RepositorPoint.getPointsColor(color)

        elif c == 5:
            x1 = int(input("x= "))
            y1 = int(input("y= "))
            length = int(input("length ="))
            RepositorPoint.getPointsSquare(x1, y1, length)

        elif c == 6:
            RepositorPoint.getMinDistance()

        elif c == 7:
            index = int(input("The position of the point (index)"))
            x1 = int(input("New value of x "))
            y1 = int(input("New value of y "))
            color1 = str(input("New color "))
            RepositorPoint.updatePoint(x1, y1, color1, index)

        elif c == 8:
            index = int(input("Index of the point to be deleted "))
            RepositorPoint.deletePoint(index)

        elif c == 9:
            x1 = int(input("x= "))
            y1 = int(input("y= "))
            length = int(input("length ="))
            RepositorPoint.deletePointsSquare(x1, y1, length)

        elif c == 10:
            RepositorPoint.plotAllPoints()

        elif c == 11:
            RepositorPoint.getAllPoints()

        elif c == 12:
            x1 = int(input("The up-left corner x = "))
            x1 = int(input("The up-left corner x = "))
            length = int(input("The length = "))
            width = int(input(" The width = "))
            RepositorPoint.getPointsRectange(x1, y1, length, width)

        elif c == 13:
            x2 = int(input("The value for the point of x =  "))
            y2 = int(input("The value for the point of y =  "))
            color2 = int(input("The new color of the point:"))
            RepositorPoint.updateColor(x2, y2, color2)

        elif c == 14:
            x1 = int(input("x= "))
            y1 = int(input("y= "))
            radius = int(input("radius ="))
            RepositorPoint.delPointsCircle(x1, y1, radius)
    else:
        raise ValueError("The command imputed is not available :(")



