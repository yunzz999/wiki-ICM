sum=0
while(True):
    n=int(input("Ingrese valor del producto: "))
    if(n<0):
        while(n<0):
            print("Error, el valor a pagar no puede ser negativo")
            n=int(input("Ingrese valor del producto: "))       
    if(n==0):
        if(sum>100000):
            print(int(sum*0.9))
        else:
            print(sum)
        break
    else:
        sum+=n