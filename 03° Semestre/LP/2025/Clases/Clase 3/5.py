while(True):
    r=input("r: ")
    l=r.split("=")
    r=int(l[1])
    if(r>0):
        print(r)
        break
    else:
        print("Error, valor mal ingresado")