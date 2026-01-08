def verificador(a,b):
    if(a>=0 and b>=0):
        return False
    else:
        print("Los numeros ingresados deben ser positivos.")
        return True

def main():
    a=int(input("a: "))
    b=int(input("b: "))
    while(verificador(a,b)):
        a=int(input("a: "))
        b=int(input("b: "))
    sum=0
    for i in range(b):
        sum+=a
    print(sum)

main()