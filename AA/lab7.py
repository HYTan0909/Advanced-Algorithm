def quickSort(a, first, last):
    pivotIndex = 0
    if(first < last):
        pivotIndex = partition(a, first, last)
        quickSort(a, first, pivotIndex-1)
        quickSort(a, pivotIndex+1, last)

def partition(a, first, last):
    #use first item as pivot

    pivot = a[first]
    currIndex = first
    for m in range(first+1, last+1):
        if(a[m] < pivot):
            currIndex += 1
            a[m], a[currIndex] = a[currIndex], a[m]
    else:
        a[first], a[currIndex] = a[currIndex], a[first]

        return currIndex

def mergeSort(a, low, high):
    mid = 0

    if(low < high):
        mid = int((low+high)/2)
        mergeSort(a, low, mid)
        mergeSort(a, mid+1, high)
        merge(a, low, high, mid)

    return

def merge(a, low, high, mid):
    temp = [None]*(high - low+1)
    i = low
    k = 0 #keep the index of temp
    j = mid+1

    #merge 2 parts into temp
    while (i <= mid and j <= high):
        if(a[i] < a[j]):
            temp[k] = a[i]
            k += 1
            i += 1
        else:
            temp[k] = a[j]
            k += 1
            j += 1

    while i <= mid:
        temp[k] = a[i]
        k += 1
        i += 1

    while j <= high:
        temp[k] =  a[j]
        k += 1
        j += 1

    for i in range(low, high+1):
        a[i] = temp[i-low]


def display(a, type = None):
    if type == None:
        print("Invalid selection")
    else:
        match type:
            case 'a':
                print("Quick Sort: ")
                quickSort(a, 0, len(a)-1)
                print(a)
            case 'b':
                print("Merge Sort: ")
                mergeSort(a, 0, len(a)-1)
                print(a)


def program():

    numList = []

    for i in range(10):
        num = int(input("Enter number " + str(i+1) + ": "))

        numList.append(num)

    choice = input("Enter sort type: ")
    display(numList, choice)

program()
