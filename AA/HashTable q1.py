class HashNode:
  def __init__ (self,key,data):
    self.key = key
    self.data = data

class HashTable:
    def __init__(self,size):
        self.__capacity = size
        self.__Table = []
        for i in range(self.__capacity):
            self.__Table.append([])


    def __hashFunction(self,key):
        return key % self.__capacity;

    def insertItem(self, key, data):
        index = self.__hashFunction(key)
        node = HashNode(key,data)
        self.__Table[index].append(node)




    def deleteItem(self, key):
        index = self.__hashFunction(key)
        for i in range(len(self.__Table[index])):
            if self.__Table[index][i].key == key:
                self.__Table[index].pop(i)
                break

    def displayHashTable(self):

        for i in range(self.__capacity):
             print(f'table[{i}]',end='')
             for x in self.__Table[i]:
                print(f'-->{x.key},{x.data}',end='')
             print()

h = HashTable(21) #size
h.insertItem(3,100) # 3 % 21 = 0 r 3
h.insertItem(45, 200) # x % 21 =  r 3
h.insertItem(66, 300)
h.insertItem(87, 400)
h.insertItem(109, 500)
h.displayHashTable()
