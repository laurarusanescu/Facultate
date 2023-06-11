import matplotlib.pyplot as plt
import numpy as np
from helpers.hepers import isvectorEqual

colors = ["r", "g", "b", "y", "m"]


class MyVector:
    def __init__(self, name_id, color, type, values):
        """
        create a vector
        :param name_id:
        :type name_id: int or str
        :param color:
        :type color:str
        :param type:
        :type type:int
        :param values:
        :type values: list
        """
        self.__name_id1 = name_id
        colors = ["r", "g", "b", "y", "m"]
        if color in colors:
            self.__color1 = color
        else:
            raise ValueError
        if type >= 1:
            self.__type1 = type
        else:
            raise ValueError
        self.__values1 = values

    def getName_id(self):
        """
        get the name id
        :return:
        """
        return self.__name_id1

    def getColor(self):
        """
        get the color
        :return:
        """
        return self.__color1

    def getType(self):
        """
        get the type
        :return:
        """
        return self.__type1

    def getValues(self):
        """
        get values
        :return:
        """
        return self.__values1

    @property
    def name_id(self):
        """
        get the name of the id
        :return:
        """
        return self.__name_id1

    @property
    def color(self):
        """
        get the color
        :return:
        """
        return self.__color1

    @property
    def type(self):
        """
        get the type
        :return:
        """
        return self.__type1

    @property
    def values(self):
        """
        get the values
        :return:
        """
        return self.__values1

    def setName_id(self, newName_id):
        """
        set a name or id
        :return:
        """
        self.__name_id1 = newName_id

    def setColor(self, newColor):
        """
        set a color
        :param newColor:
        :return:
        """
        if newColor in colors:
            self.__color1 = newColor
        else:
            raise ValueError

    def setType(self, newType):
        """
        set a new type
        :param newType:
        :return:
        """
        self.__type1 = newType

    def setValues(self, newValues):
        """
        set new values
        :param newValues:
        :return:
        """
        self.__values1 = newValues

    def repr(self):
        """
        print function
        :return:
        """
        return "Vector ID is", str(self.__name_id1), "with the color:", str(self.__color1), ", type:", str(self.__type1), "of values:", str(self.__values1), "."

    def AddScalar(self, c):
        """
        ad a scalar to a vector
        :param c:
        :type c:int
        :return:
        """
        vector = np.array(self.values)
        vector = vector + c

    def AddsVectors(self, vector):
        """
        ads two vectors
        :param vector:
        :return:
        """
        sum = 0
        vector1 = np.array(self.__values1)
        vector2 = np.array(vector)
        if isvectorEqual(vector2):
            vector1 = vector1 + vector2
        return vector1

    def SubstractVectors(self, vector):
        """
        subtract one vector from the other
        :param vector:
        :return:
        """
        vector1 = np.array(self.__values1)
        vector2 = np.array(vector)
        if isvectorEqual(vector2):
            vector1 = vector1 - vector2
        return vector1

    def MultiplyVector(self, vector):
        """
        multiply th=woi vectors
        :param vector:
        :return:
        """
        product = 1
        vector1 = np.array(self.__values1)
        vector2 = np.array(vector)
        if isvectorEqual(vector):
            product = vector1.dot(vector2)
        return product

    def SumOfElements(self):
        """
        sum of elements in a vector
        :return:
        """
        s = 0
        vector1 = np.array(self.__values1)
        if len(self.__values1) > 0:
            s = np.prod(vector1)
            return s
        return 0

    def AverageOfElements(self):
        """
        Average of elements in a vector
        :return:
        """
        if len(self.__values1):
            x = sum(self.__values1)
            y = len(self.__values1)
            return x/y

    def MinimumOfVector(self):
        """
        find the minim value from a vector
        :return:
        """
        vector1 = np.array(self.__values1)
        if len(self.__values1):
            return min(vector1)

    def MaximumOfAVector(self):
        """
        find the maxim value from a vector
        :return:
        """
        vector1 = np.array(self.__values1)
        if len(self.__values1):
            return max(vector1)


class VectorRepository:
    def __init_(self, initialVectors=None):
        """
        create a repository for points
        :param initialVectors:
        :return:
        """
        self.__list_of_vectors = []
        if initialVectors is not None:
            for vector in initialVectors:
                self.__list_of_vectors.append(vector)

    def IsIDUnique(self, id):
        """
        check if the id is unique
        :param id:
        :return:
        """
        for i in self.__list_of_vectors:
            if i.name_Id == id:
                return False
            else:
                return True

    def IsTypeValid(self, type):
        """
        chack if the type is valid
        :param type:
        :return:
        """
        if type >= 1:
            return 1
        else :
            raise ValueError("The type imputed is not valid.")

    def IsIndexCorrect(self, index):
        """
        check if the index is correct
        :param index:
        :return:
        """
        if 0 <= index <= len(self.__list_of_vectors):
            return 1
        else:
            raise ValueError("The index can not be found.")

    def IsColorCorrect(self, color):
        """
        check if the color is correct
        :param color:
        :return:
        """
        if color in colors:
            return 1
        else:
            raise ValueError("The color imputed is not available.")

    def AddVector(self, name, color, type1, values):
        """
        add a vector to the list
        :param name:
        :param color:
        :param type1:
        :type type1: int
        :param values:
        :type values: list
        :return:
        """
        if self.IsIDUnique(name) and self.IsColorCorrect(color) and self.IsTypeValid(type1):
            self.__list_of_vectors.append(MyVector(name, color, type1, values))
        return self.__list_of_vectors

    def GetAllVectors(self):
        """
        get all the vectors
        :return:
        """
        for i in range(0, len(self.__list_of_vectors)):
            return self.__list_of_vectors[:]

    def GetVectorAtIndex(self, index):
        """
        get vector at a specified index
        :param index:
        :return:
        """
        return self.__list_of_vectors[index]

    def UpdateVectorAtIndex(self, index, newName, newColor, newType, newValues):
        """
        update a vector given at an index
        :param index:
        :param newName:
        :param newColor:
        :param newType:
        :param newValues:
        :type newValues: list
        :return:
        """
        if self.IsIndexCorrect(index):
            self.__list_of_vectors[index].setName_Id(newName)
            self.__list_of_vectors[index].setValues(newValues)
            if self.IsColorCorrect(newColor):
                self.__list_of_vectors[index].setColor(newColor)
            if self.IsTypeValid(newType):
                self.__list_of_vectors[index].setType(newType)
        return self.__list_of_vectors

    def UpdatePointByName(self, name, newColor1, newType1, newValues1):
        """
        update a vector by name
        :param name:
        :param newColor1:
        :param newType1:
        :param newValues1:
        :return:
        """
        for vector in self.__list_of_vectors:
            if vector.getName_Id == name and self.IsColorCorrect(newColor1):
                vector.setColor = newColor1
                vector.setType = newType1
                vector.setValues = newValues1
        return self.__list_of_vectors

    def DelVectorByIndex(self, index):
        """
        delete a vector at a given index
        :param index:
        :return:
        """
        if self.IsIndexCorrect(index):
            del self.__list_of_vectors[index]
        return self.__list_of_vectors

    def DelVectorByName(self, Name):
        """
        delete a vector at a given name
        :param Name:
        :return:
        """
        for i, vector in self.__list_of_vectors:
            if vector.getName_Id == Name:
                del self.__list_of_vectors[i]
        return self.__list_of_vectors

    def PlotAllPoints(self):
        """
        plot al points in a coordinate system
        :return:
        """
        for vector in self.__list_of_vectors:
            plt.plot(vector)











