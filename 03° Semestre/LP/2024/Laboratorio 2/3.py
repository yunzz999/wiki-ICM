def main():
    sueldo=int(input("Ingrese un sueldo: "))

    if(sueldo>1000000):
        print(sueldo)
    elif(sueldo<1000000 and sueldo>500000):
        print(str(int(sueldo+sueldo*0.05)))
    elif(sueldo<500000):
        print(str(int(sueldo+sueldo*0.1)))

main()