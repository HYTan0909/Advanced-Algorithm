class TreeNode:
    def __init__(self,data):
        self.item = data
        self.leftChild=None
        self.rightChild =None


class BST:
    def __init__(self):
        self.__root =None
        self.__numOfItem = 0

    def size(self):
        return self.__numOfItem

    def search(self,data):
       if root == None :
          return False
       curr = root
       while curr!=data :
          if data < curr.item and curr.leftChild != None :
             curr =  curr.leftChild
          elif data > curr.item and curr.rightChild != None:
              curr = curr.rightChild
          else:
           return False
       #to be completed

    def insert(self,data):
        newNode = TreeNode(data) #create new Node
        if self.__root == None:   #if BST is empty
            self.__root = newNode
        else:
            curr = self.__root
            par = None

            while curr!=None:    #traversal until leaf
                par = curr
                if data < curr.item :
                    curr = curr.leftChild
                elif data > curr.item:
                    curr = curr.rightChild
                else:
                    return False   #no allow duplicate value insert

            if data < par.item:
                par.leftChild = newNode  #insert as left child
            else:
                par.rightChild = newNode #insert as right child
        self.__numOfItem += 1
        return True

    def __remove(self,data):
        pass
        # implementation required

    def __inOrder(self,TreeNode):
        if TreeNode ==None:
            return

        self.__inOrder(TreeNode.leftChild)
        print (TreeNode.item)
        self.__inOrder(TreeNode.rightChild)

    def __preOrder(self, TreeNode):
        if TreeNode == None:
            return

        print(TreeNode.item)
        self.__preOrder(TreeNode.leftChild)
        self.__preOrder(TreeNode.rightChild)

    def __postOrder(self, TreeNode):
        if TreeNode == None:
            return

        self.__postOrder(TreeNode.leftChild)
        self.__postOrder(TreeNode.rightChild)
        print(TreeNode.item)

    def __levelOrder(self, node):
        if node == None:
            return
        q = Queue()
        q.put(node)

        while not q.empty():
          curr = q.get()
          print (curr.item)
          if curr.leftChild != None :
              q.put(curr.leftChild)
          if curr.rightChild != None :
              q.put(curr.rightChild)

    def displayAll(self, type = None):
        if type == None:
            self.__inOrder(self.__root)
        else:
            match type:
                case 1:
                    print("PreOrder: ")
                    self.__preOrder(self.__root)
                case 2:
                    print("InOrder: ")
                    self.__inOrder(self.__root)
                case 3:
                    print("PostOrder: ")
                    self.__postOrder(self.__root)
                case 4:
                    print("LevelOrder: ")
                    self.__levelOrder(self.__root)
                case default:
                    print("PreOrder: ")
                    self.__preOrder(self.__root)
                    print("InOrder: ")
                    self.__inOrder(self.__root)
                    print("PostOrder: ")
                    self.__postOrder(self.__root)


def program():

    myBst = BST()

    myBst.insert(57)
    myBst.insert(40)
    myBst.insert(13)
    myBst.insert(36)
    myBst.insert(71)
    myBst.insert(95)
    myBst.insert(105)
    myBst.insert(59)

    choice = int(input("Enter transversal type: "))
    myBst.displayAll(choice)

program()


