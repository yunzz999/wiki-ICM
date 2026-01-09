arriba=0
abajo=0
n=int(input("n: "))#N barras
a=int(input()) #primera barra
for i in range(n-1): #N-1 siguientes
    b=int(input())
    if(a>b):
        abajo+=1
    if(b>a):
        arriba+=1
    a=b

print(arriba,abajo)