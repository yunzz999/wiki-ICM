while(True): #bucle inf
    n=input("n: ") #input
    if(n!="F"):
        n=int(n)
    else:
        break #rompe bucle

    if(n>0):
        print("Positivo")
    elif(n<0):
        print("Negativo")
    else:
        print("Cero")

