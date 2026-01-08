def pair (x):
    if(x%2==0):
        return True
    else:
        return False

def main():
    a=int(input("Ingrese el primer numero: "))
    b=int(input("Ingrese el segundo numero: "))

    print(str(a*b)+" - "+str(pair(a*b)))


main()