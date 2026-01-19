def dibujo(s):
    for i in range (5):
        if(i==4 or i==0):
            print(s*5)
        else:
            print(s+(3*len(s)*" ")+s)


def main():
    s=str(input("Ingrese el caracter que desea: "))
    dibujo(s)

main()