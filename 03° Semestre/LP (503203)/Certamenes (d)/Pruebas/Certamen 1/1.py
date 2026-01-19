c=True
while(c):
    n=int(input())
    if(10<=n<10**10):
        n=str(n)
        if(n==n[::-1]):
            print(n+" es capicua.")
        else:
            print(n+" no es capicua.")
        
        x=input("Desea ingresar otro numero? (s/n): ")
        if(x=="n" or x=="no"):
            c=False
    else:
        print("Error, numero fuera de rango.")