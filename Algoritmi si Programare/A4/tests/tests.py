from functions.classes_and_functions import MyVector
from functions.classes_and_functions import VectorRepository

v = MyVector
def TestGettersAndSetters():
    vect = v(3, 'r', 1, [2, 4, 3])
    assert v.getName_id(vect) == 3
    assert v.getColor(vect) == 'r'
    assert v.getType(vect) == 1
    assert v.getValues(vect) == [2, 4, 3]

    v.setName_id(vect, 4)
    assert v.getName_id(vect) == 4
    assert v.name_id == 4
    v.setColor(vect, 'm')
    assert v.getColor(vect) == 'm'
    assert v.color == 'm'
    v.setType(vect, 2)
    assert v.getType(vect) == 2
    assert v.type == 2
    v.setValues(vect, [4, 1, 6, 2])
    assert v.getType(vect) == [4, 1, 6, 2]
    assert v.values == [4, 1, 6, 2]

def TestAddScalar():
    vect1 = v(1, 'm', 1, [2, 4, 3])
    v.AddScalar(vect1, 2)
    assert v.getValues(vect1) == [4, 8, 6]
    vect2 = v(1, 'm', 1, [5, 1, 2, 4])
    v.AddScalar(vect2, 3)
    assert v.getValues (vect2) == [15, 3, 6, 12]

def TestAddsVectors():
    vect1 = v('vecto', 'r', 8, [8, 3, 5, 0])
    v.AddsVectors(vect1, [3, 6, 2, 7])
    assert v.getValues(vect1) ==[11, 9, 7, 7]

def TestSubstractVectors():
    vector = v('vect', 'b', 3, [2, 1, 5, 3])
    v.SubstractVectors(vector, [1, 1, 2, 1])
    assert v.getValues(vector) == [1, 0, 3, 2]

def TestMultiplyVectors():
    vector = v(3, 'r', 1, [2, 4, 3])
    v.MultiplyVector(vector, [1, 2, 2])
    assert v.getValues(vector) == [2, 8, 6]

def TestSumOfElements():
    vct = v('vect', 'b', 3, [2, 1, 5, 3])
    assert v.SumOfElements(vct) == 11

def TestAverageOfElements():
    vector = v('v', 'm', 4, [3, 6, 2, 9])
    assert v.AverageOfElements(vector) == 5

def TestMinimumOfVector():
    vector = v('v', 'm', 4, [3, 6, 2, 9])
    assert v.MinimumOfVector(vector) == 2

def TestMaximumOfVector():
    vecto = v(3, 'g', 7, [6, 1, 7, 2, 8])
    assert v.MaximumOfAVector(vecto) == 8


def TestAddVector():
    vr = VectorRepository()
    vr.AddVector(3, 'g', 7, [6, 1, 7, 2, 8])
    assert str(vr.GetAllVectors()) == "(3, 'g', 7, [6, 1, 7, 2, 8])"


def TestUpdateVectorAtIndex():
    vr = VectorRepository()
    vect = vr.AddVector('vect', 'b', 3, [2, 1, 5, 3])
    vect1 = vr.AddVector('vector', 'b', 3, [3, 2, 5])
    vr.UpdateVectorAtIndex(1, 'vector1', 'r', 4, [1, 3, 5])
    assert vect1 == v('vector1', 'r', 4, [1, 3, 5])

def TestUpdateVectorByName():
    vr = VectorRepository()
    vect3 = vr.AddVector(2, 'b', 3, [2, 1, 5, 3])
    vect4 = vr.AddVector('vector', 'b', 3, [3, 2, 5])
    vr.UpdatePointByName(2, 'r', 4, [1, 3, 5, 3])
    assert vect3 == v(2, 'r', 4, [1, 3, 5])

def TestDelVectorByIndex():
    vr = VectorRepository()
    vect5 = vr.AddVector('vect', 'b', 3, [2, 1, 5, 3])
    vect6 = vr.AddVector('vector', 'b', 3, [3, 2, 5])
    vr.DelVectorByIndex(0)
    assert str(vr.GetAllVectors()) == "('vector', 'b', 3, [3, 2, 5])"

def TestDelVectorByName():
    vr = VectorRepository()
    vect5 = vr.AddVector('vect', 'b', 3, [2, 1, 5, 3])
    vect6 = vr.AddVector('vector', 'b', 3, [3, 2, 5])
    vr.DelVectorByName('vect')
    assert (vr.GetAllVectors()) == "('vector', 'b', 3, [3, 2, 5])"











