def verificador(a,b):
    if(a>=0 and b>=0):
        return False
    else:
        print("Los numeros ingresados deben ser positivos.")
        return True

def main():
    m=int(input("m: "))
    n=int(input("n: "))
    while(verificador(m,n)):
        m=int(input("m: "))
        n=int(input("n: "))
    print(m,"-",n,"=",m-n) 

main()
