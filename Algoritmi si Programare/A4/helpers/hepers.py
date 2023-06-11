from functions.classes_and_functions import MyVector
from functions.classes_and_functions import VectorRepository
mv = MyVector()
VectorRepository()
def isvectorEqual(other):
    """
     checks if two vectors are equal
     :return:
     """
    if len (mv.values) != len (other) :
        raise ValueError ("Vectors should be the same type.")
    return 1

