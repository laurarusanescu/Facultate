from functions.functions import *
def testCreatePoint():
    try:
        MyPoint(2,4, "red")
        assert False
    except ValueError:
        assert True


def testGetterSetter():
    s = MyPoint(2, 4, "red")
    assert s.getx() == 2
    assert s.gety() == 4
    assert s.getcolor() == "red"

    s.setCoord_x(2)
    assert s.getx() == 2
    assert s.coord_x == 2
    s.setCoord_y(4)
    assert s.gety() == 4
    assert s.coord_y ==4
    s.setColor("red")
    assert s.getcolor() == "red"
    assert s.color == "red"

def testPointPrinting():
    point = MyPoint(1, 4 , 'red')
    str(point)

def testaddPoint():
    sr = RepositorPoint()
    assert len(sr.__list_of_points__) == 0
    sr.addPoint(2, 4, "red")
    assert len(sr.__list_of_points__) == 1

def testGetAllPoints():
    sr = RepositorPoint()
    assert len(sr.__list_of_points__) == 0
    sr.addPoint(3, 4, "blue")
    sr.addPoint(5, 2, "red")
    assert sr.__list_of_points__.getAllPoints == (3, 4, "blue") and (5, 2, "red")

def testGetPointAtIndex():
    sr = RepositorPoint()
    sr.addPoint(2, 3, "green")
    sr.addPoint(3, 4, "green")
    sr.addPoint(2, 5, "blue")
    assert sr.__list_of_points__.getAllPointAtIndex(2) ==(2, 5, "blue")

def testGetPointsColor():
    sr = RepositorPoint()
    sr.addPoint(2, 3, "green")
    sr.addPoint(3, 4, "green")
    sr.addPoint(2, 5, "blue")
    assert sr.__list_of_points__.getPointsColor("green") == (2, 3, "green") and (3, 4, "green")

def testGetPointsSquare():
    sr = RepositorPoint()
    sr.addPoint(4, 1, "blue")
    sr.addPoint(3, 2, "red")
    sr.addPoint(2, 3, "green")
    sr.addPoint(3, 5, "red")
    assert sr.getPointsSquare(1, 4, 3) ==(3, 2, "red") and (2, 3, "green")

def testGetMinDistance():
    sr = RepositorPoint()
    sr.addPoint(4, 1, "blue")
    sr.addPoint(3, 2, "red")
    sr.addPoint(1, 4, "green")
    sr.addPoint(3, 5, "red")
    assert sr.getMinDistance() == 1

def testUpdatePoint():
    sr = RepositorPoint()
    assert len(sr.__list_of_points__) == 0
    sr.addPoint(4, 1, "blue")
    sr.addPoint(3, 2, "red")
    assert sr.updatePoint(2, 6, "green", 1)
    assert sr.getAllPoints() == (4, 1, "blue"), (2, 6, "green")

def testDelPoint():
    sr = RepositorPoint()
    assert len(sr.__list_of_points__) == 0
    sr.addPoint(4, 3, "green")
    sr.addPoint(1, 2, "red")
    assert sr.deletePoint(1)
    assert len(sr.__list_of_points__) == 1

def testDelPointSquare():
    sr = RepositorPoint()
    assert len(sr.__list_of_points__) ==0
    sr.addPoint(4, 1, "blue")
    sr.addPoint(3, 2, "red")
    sr.addPoint(2, 3, "green")
    sr.addPoint(3, 5, "red")
    assert sr.deletePointsSquare(1, 4, 3)
    assert len(sr.__list_of_points__) == 2

def testPlotAllPoints():
    sr = RepositorPoint()
    assert len(sr.__list_of_points__) == 0
    sr.addPoint(4, 1, "blue")
    sr.addPoint(2, 1, "red")
    sr.addPoint(1, 3, "green")
    sr.addPoint(3, 5, "red")
    assert sr.plotAllPoints()

def testGetPointsRectangle():
    sr = RepositorPoint()
    assert len(sr.__list_of_points__)
    sr.addPoint(4, 1, "blue")
    sr.addPoint(2, 2, "red")
    sr.addPoint(0, 3, "green")
    sr.addPoint(3, 5, "red")
    sr.addPoint(5, 3, "green")
    assert sr.getPointsRectange(1, 4, 5, 3) == (2, 2, "red") , (5, 3, "green")

def testUpdateColor():
    sr = RepositorPoint()
    sr.addPoint(3, 2, "red")
    sr.addPoint(2, 3, "green")
    assert sr.updateColor(3, 2, "green")
    assert sr.getAllPoints() == (3, 2, "green"), (2, 3, "green")

def testDelPointsCircle():
    sr = RepositorPoint()
    assert len(sr.getAllPoints()    ) == 0
    sr.addPoint(4, 1, "blue")
    sr.addPoint(2, 1, "red")
    sr.addPoint(1, 3, "green")
    sr.addPoint(3, 5, "red")
    assert sr.delPointsCircle(2, 2, 2)
    assert len(sr.__list_of_points__) == 2

def runAllTests():
    testaddPoint()
    testGetAllPoints()
    testGetPointAtIndex()
    testGetPointsColor()
    testGetPointsSquare()
    testGetMinDistance()
    testUpdatePoint()
    testDelPoint()
    testDelPointSquare()
    testPlotAllPoints()
    testGetPointsRectangle()
    testUpdateColor()
    testDelPointsCircle()