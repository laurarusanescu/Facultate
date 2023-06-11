import matplotlib.pyplot as plt
from math import sqrt

class MyPoint:
    def __init__(self, x, y, color):
        """
        create a point in the coordinate system xOy painted with a specific color
        :param x:
        :param y:
        :param color:
        """
        self.__coord_x = x
        self.__coord_y = y
        colors = ['red', 'green', 'blue', 'yellow', 'magenta']
        if color in colors:
            self.__color = color
        else:
            raise ValueError("Value is not correct")

    # getter functions for the properties
    def getx(self):
        """
        get the coordinate of x
        :return:
        :rtype: int
        """
        return self.__coord_x

    def gety(self):
        """
        get the coodronate of y
        :return:
        :rtype: int
        """
        return self.__coord_y

    def getcolor(self):
        """
        get the color of a point
        :return:
        :rtype: str
        """
        return self.__color

    @property
    def coord_x(self):
        """
        get the coordinate of x
        :return:
        :rtype: int
        """
        return self.__coord_x

    @property
    def coord_y(self):
        """
        get the coodronate of y
        :return:
        :rtype: int
        """
        return self.__coord_y

    @property
    def color(self):
        """
        get the color of a point
        :return:
        :rtype: str
        """
        return self.__color

    def setCoord_x(self, newX):
        """
        set x
        :param newX: coordinate x
        :type newX: int
        :return:
        """
        self.__coord_x = newX

    def setCoord_y(self, newY):
        """
        set y
        :param newY: coordinate y
        :tpye newY: int
        :return:
        """
        self.__coord_y = newY

    def setColor(self, newColor):
        """
        attribute a new color
        :param newColor: the new color
        :type newColor: str
        :return:
        """
        self.__color = newColor

    def __repr__(self):
        """
        return the string reprezentation for a point
        :return:
        """
        return "Point (" + str(self.__coord_x) + "," + str(self.__coord_y) + ") the color is " + str(self.color)

    def __str__(self):
        """
        Function called when converting object into string
        :return:
        :rtype:
        """
        return self.__repr__()
plt.scatter(2, 3, c="red")
plt.show()

colors = ['red', 'green', 'blue', 'yellow', 'magenta']
class RepositorPoint:
    def __init__(self, initialPoints=None):
        """
        create a repository for points
        :param initialPoints:
        """
        self.__list_of_points__ = []
        if initialPoints is not None:
            for point in initialPoints:
                self.__list_of_points__.append(point)

    def addPoint(self, x, y, color):
        """
        ex. 1
        add a point to the repository
        :param x:
        :type x: int
        :param y:
        :type y: int
        :param color:
        :type color: str
        :return:
        """
        if not color in colors:
            raise ValueError("The color is not approved.")
        else:
            self.__list_of_points__.append(MyPoint(x, y, color))

    def getAllPoints(self):
        """
        ex. 2
        get all the points in the repository
        :return:
        """
        return self.__list_of_points__[:]

    def __ifIndexCorrect(self, index):
        """
        verify if a given index is correct
        :param index:
        :type index: int
        :return:
        """
        return 0 < index < len(self.__list_of_points__)

    def getPointAtIndex(self, index):
        """
        ex. 3
        get point at chosen index
        :param index:
        :return:
        """
        if self.__ifIndexCorrect(index):
            return self.__list_of_points__[index]
        else:
            raise ValueError("The index is out of range.")

    def getPointsColor(self, givenColor):
        """
        ex. 4
        get all points that have a given color
        :param givenColor:
        :type givenColor: str
        :return:
        """
        l = []
        for i in range(0, len(self.__list_of_points__)+1):
            if givenColor in colors:
                if self.__list_of_points__[i].getcolor() == givenColor:
                    l.append(self.__list_of_points__[i])
        return RepositorPoint(l)

    def getPointsSquare(self, x1, y1, length):
        """
        ex. 5
        get all points that are inside a given square
        :param x1:
        :param y1:
        :return:
        """
        l = len(self.__list_of_points__)
        for i in range(0, l+1):
            if x1 < int(self.__list_of_points__[i].getx) < x1+length and y1 < int(self.__list_of_points__[i].gety) < y1+length:
                return self.__list_of_points__[i]

    def getMinDistance(self):
        """
        ex. 6
        get the minimum distance between two points
        :return:
        """
        minD = 10000000
        l = len(self.__list_of_points__)
        if l>2:
            for i in range(0, l+1):
                for j in range(1, l+1):
                    dist = sqrt(((int(self.__list_of_points__[i].getx))-(int(self.__list_of_points__[j].getx)))**2+((int(self.__list_of_points__[i].gety))-(int(self.__list_of_points__[j].gety)))**2)
                    if dist < minD or dist == minD:
                        minD = dist
        else:
            raise ValueError
        print(int(minD))

    def updatePoint(self, x1, y1, color1, index):
        """
        ex. 7
        update a point at a given index
        :param x1:
        :type x1: int
        :param y1:
        :type y1: int
        :param color1:
        :type color1: str
        :param index:
        :return:
        """
        self.__list_of_points__[index].setCoord_x(x1)
        self.__list_of_points__[index].setCoord_y(y1)
        if color1 in colors:
            self.__list_of_points__[index].setColor(color1)
        else:
            raise ValueError("The color is not available.")

    def deletePoint(self, index):
        """
        ex. 8
        delete point at a given index
        :param index:
        :type index: int
        :return:
        """
        if 0 <= index < len(self.__list_of_points__):
            del self.__list_of_points__[index]
        else:
            raise ValueError("Index out of range")

    def deletePointsSquare(self, x1, y1, length):
        """
        ex. 9
        delete all points that are inside a given square
        :param x1:
        :param y1:
        :return:
        """
        l = len(self.__list_of_points__)
        for i in range(l-1, -1, -1):
            if x1 < int(self.__list_of_points__[i].getx) < x1+length and y1 < int(self.__list_of_points__[i].gety) < y1+length:
                del self.__list_of_points__[i]

    def plotAllPoints(self):
        """
        ex.10
        plot all points
        :return:
        """
        for i in range(0, len(self.__list_of_points__)+1):
            plt.scatter(self.__list_of_points__[i].get)
        plt.show()

    def getPointsRectange(self, x1, y1, length, width):
        """
        ex. 12
        get all the points inside a rectangle (up-left corner, length and width given)
        :param x1:
        :type x1: int
        :param y1:
        :type y1: int
        :param length:
        :type length: int
        :param width:
        :type width: int
        :return:
        """
        l = len(self.__list_of_points__)
        for i in range(0, l+1):
            if x1 < int(self.__list_of_points__[i].getx) < x1+length and y1 < int(self.__list_of_points__[i].gety) < y1+width:
                return self.__list_of_points__[i]

    def updateColor(self, x2, y2, color2):
        """
        ex. 15
        update the color of a point given its coordonates
        :param x2:
        :type x2: int
        :param y2:
        :type y2: int
        :param color2:
        :type color2: str
        :return:
        """
        for i in range(0, len(self.__list_of_points__)+1):
            if self.__list_of_points__[i].coord_x == x2 and self.__list_of_points__[i].coord_y == y2:
                if color2 in colors:
                    self.__list_of_points__[i].setColor(color2)
                else:
                    raise ValueError("The color is not avaliable.")

    def delPointsCircle(self, x1, y1, radius):
        """
        ex. 19
        delete all points that are inside a given circle
        :param x1:
        :type x1: int
        :param y1:
        :type y1: int
        :param radius:
        :type radius: int
        :return:
        """
        index1 = 0
        for i in range(0, len(self.__list_of_points__)):
            if self.__list_of_points__[i].coord_x == x1 and self.__list_of_points__[i].coord_y == y1:
                index1 = i
                break
        for i in range(0, len(self.__list_of_points__)+1):
            dist = sqrt(((int(self.__list_of_points__[i].getx)) - (int(self.__list_of_points__[index1].getx))) ** 2 + ((int(self.__list_of_points__[i].gety)) - (int(self.__list_of_points__[index1].gety))) ** 2)
            if dist <= radius:
                del self.__list_of_points__[i]


