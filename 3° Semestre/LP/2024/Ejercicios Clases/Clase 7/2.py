def multiplicacion(x,y):
    suma=0
    for i in range(x):
        suma+=y
    return suma

def exponenciacion(x,e):
    suma=1
    for i in range(e):
        suma=multiplicacion(suma,x)
    return suma

def main():
    while True:
        s=input()
        s=s.split()
        if int(s[0])==0 and int(s[1])==0:
            break
        else:
            suma=0
            for i in range(int(s[1])+1):
                suma+=exponenciacion(int(s[0]),i)
            print(suma)

main()