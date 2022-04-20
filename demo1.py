#class
class Student():
    def __init__(self, s, n, m):
        self.__stdid = s
        self.__name = n
        self.__marks = m

    def display(self):
        print("name: {} marks: {}".format(self.__name, self.__marks))


s = Student("123", "Mark", 30)
s.display()
