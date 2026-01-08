def multiplicacion(a,b):
    sum=0
    for i in range(b):
        sum+=a
    return sum
def main():
    a=int(input("Ingrese el primer numero: "))
    b=int(input("Ingrese el segundo numero: "))
    print(multiplicacion(a,b))

main()