while(True):
    r=input("q: ")
    l=r.split("=")
    r=int(l[1])
    if(r>0):
        print(r*(r+1)//2) #div entera para evitar pasar a float
        break
    else:
        print("Error, valor mal ingresado")