def area(r):
    pi=3.14
    return pi*r**2

def perimetro(r):
    pi=3.14
    return 2*pi*r

def main():
    r=int(input("Ingrese el radio: "))
    print(str(area(r))+", "+str(perimetro(r)))

main()
