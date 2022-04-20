#function
def areaTriangle(base, height):
    area = 1/2 * base * height

    return(area)


base = int(input("Enter base: "))
height = int(input("Enter height: "))

print(areaTriangle(base, height))


