#q2
def program():
    numList = []
    count = 0;
    total = 0;

    for i in range(10):
        num = int(input("Enter a number: "))
        numList.append(num)

    if num > 100:
        count = count+1

    if count !=0:
        total = sum(count)


print()
program()
