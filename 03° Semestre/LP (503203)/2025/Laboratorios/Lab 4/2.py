def verificador1(n):
    if(1<n<=1000):
        return False
    else:
        return True
        print("Datos fuera de rango...")

def verificador2(r):
    if(0<r<=100):
        return False
    else:
        print("Datos fuera de rango...")
        return True


n=int(input("cantidad pelotas: "))
while(verificador1(n)):
    n=int(input("cantidad pelotas: "))

mini=101
sol=0
for i in range(n):
    r=int(input("radio: "))
    while(verificador2(r)):
        r=int(input("radio: "))
    if(r<mini):
        mini=r
        sol=1
    elif(r==mini):
        sol+=1

print("Se han producido",sol,"pelotas de radio",mini)